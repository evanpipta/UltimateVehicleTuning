#!/usr/bin/env python3
"""Compare UVT tune snapshots with an exported pre-UVT runtime baseline."""

from __future__ import annotations

import json
import math
from collections import Counter
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[1]
STOCK_FILE = ROOT / "stock_tunes.json"
TUNES_ROOT = ROOT / "tunes"
OUTPUT_FILE = ROOT / "parameter_usage_report.json"


def load_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def different(left: Any, right: Any) -> bool:
    if isinstance(left, bool) or isinstance(right, bool):
        return left != right
    if isinstance(left, (int, float)) and isinstance(right, (int, float)):
        if not math.isfinite(float(left)) or not math.isfinite(float(right)):
            return left != right
        tolerance = max(1e-4, abs(float(right)) * 1e-5)
        return abs(float(left) - float(right)) > tolerance
    return left != right


def changed_keys(values: dict[str, Any], baseline: dict[str, Any]) -> set[str]:
    return {
        key
        for key, value in values.items()
        if key not in baseline or different(value, baseline[key])
    }


def vehicle_kind(vehicle_id: str) -> str:
    lowered = vehicle_id.lower()
    return "bike" if "sportbike" in lowered or "_bike" in lowered else "car"


def main() -> None:
    if not STOCK_FILE.exists():
        raise SystemExit(
            "stock_tunes.json is missing. Enable the dev exporter, reload UVT "
            "against the desired baseline, and click Export Stock Tune Baselines."
        )

    stock_document = load_json(STOCK_FILE)
    stock_vehicles = stock_document.get("vehicles", {})
    defaults: dict[str, dict[str, Any]] = {}
    documents: list[tuple[Path, str, dict[str, Any]]] = []

    for path in sorted(TUNES_ROOT.glob("**/*.json")):
        try:
            document = load_json(path)
        except (OSError, json.JSONDecodeError):
            continue
        vehicle_id = document.get("vehicleId")
        values = document.get("values")
        if not isinstance(vehicle_id, str) or not isinstance(values, dict):
            continue
        documents.append((path, vehicle_id, values))
        if path.name.lower() == "modded_default.json":
            defaults[vehicle_id] = values

    counters = {
        "default_all": Counter(),
        "default_car": Counter(),
        "default_bike": Counter(),
        "custom_from_stock_all": Counter(),
        "custom_incremental_all": Counter(),
        "custom_incremental_car": Counter(),
        "custom_incremental_bike": Counter(),
    }
    sample_counts = Counter()
    file_results: list[dict[str, Any]] = []
    missing_stock: set[str] = set()

    for path, vehicle_id, values in documents:
        stock_entry = stock_vehicles.get(vehicle_id)
        stock_values = stock_entry.get("values") if isinstance(stock_entry, dict) else None
        if not isinstance(stock_values, dict):
            missing_stock.add(vehicle_id)
            continue

        kind = vehicle_kind(vehicle_id)
        is_default = path.name.lower() == "modded_default.json"
        from_stock = changed_keys(values, stock_values)
        if is_default:
            sample_counts["modded_defaults"] += 1
            counters["default_all"].update(from_stock)
            counters[f"default_{kind}"].update(from_stock)
            incremental: set[str] = set()
        else:
            sample_counts["custom_tunes"] += 1
            counters["custom_from_stock_all"].update(from_stock)
            baseline = defaults.get(vehicle_id, stock_values)
            incremental = changed_keys(values, baseline)
            counters["custom_incremental_all"].update(incremental)
            counters[f"custom_incremental_{kind}"].update(incremental)

        file_results.append(
            {
                "path": str(path.relative_to(ROOT)).replace("\\", "/"),
                "vehicleId": vehicle_id,
                "kind": kind,
                "isModdedDefault": is_default,
                "changedFromStock": sorted(from_stock),
                "changedFromModdedDefault": sorted(incremental),
            }
        )

    all_keys = sorted({key for counter in counters.values() for key in counter})
    parameters = []
    for key in all_keys:
        parameters.append(
            {
                "key": key,
                **{name: counter[key] for name, counter in counters.items()},
            }
        )
    parameters.sort(
        key=lambda row: (
            -row["default_all"],
            -row["custom_incremental_all"],
            row["key"],
        )
    )

    report = {
        "schema": "uvt_parameter_usage_v1",
        "stockSource": STOCK_FILE.name,
        "sampleCounts": dict(sample_counts),
        "missingStockVehicleIds": sorted(missing_stock),
        "parameters": parameters,
        "files": file_results,
    }
    OUTPUT_FILE.write_text(
        json.dumps(report, indent=2, sort_keys=False) + "\n",
        encoding="utf-8",
    )
    print(
        f"Wrote {OUTPUT_FILE.name}: {len(parameters)} changed parameters across "
        f"{sample_counts['modded_defaults']} defaults and "
        f"{sample_counts['custom_tunes']} custom tunes."
    )
    if missing_stock:
        print(f"Skipped {len(missing_stock)} vehicle IDs without exported stock.")


if __name__ == "__main__":
    main()
