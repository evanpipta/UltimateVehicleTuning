import json
import re
from pathlib import Path

base = Path(__file__).parent
lua = (base / "init.lua").read_text(encoding="utf-8")

params = set(re.findall(r'\{\s*key\s*=\s*"([^"]+)"', lua))
for g in range(1, 9):
    for s in ("min_speed", "max_speed", "min_rpm", "max_rpm", "torque_mul"):
        params.add(f"gear_{g}_{s}")

helper_names = (
    "rotation_limiter",
    "rear_grip",
    "handbrake_helper",
    "uphill_helper",
    "accel_noise",
    "downforce",
    "air_gravity",
)
for m in re.finditer(
    r'\{\s*"([a-z_]+)",\s*"[^"]+",\s*"([a-z_]+)"', lua
):
    helper, suffix = m.group(1), m.group(2)
    if helper in helper_names:
        params.add(f"{helper}_{suffix}")

stock = json.loads((base / "stock.json").read_text(encoding="utf-8"))
config = json.loads((base / "config.json").read_text(encoding="utf-8"))

stock_keys = set()
for vals in stock.values():
    if isinstance(vals, dict):
        stock_keys.update(vals.keys())

config_keys = set()
vehicles = config.get("vehicles") or config
if isinstance(vehicles, dict):
    for vals in vehicles.values():
        if isinstance(vals, dict):
            config_keys.update(vals.keys())

missing = sorted(stock_keys - params)
params_not_stock = sorted(params - stock_keys)
config_only = sorted(config_keys - stock_keys)

print("STOCK_UNIQUE_KEYS", len(stock_keys))
print("PARAMS_KEYS", len(params))
print("CONFIG_UNIQUE_KEYS", len(config_keys))
print("MISSING_COUNT", len(missing))
print("---MISSING---")
for k in missing:
    print(k)
print("---PARAMS_NOT_IN_STOCK---")
for k in params_not_stock:
    print(k)
print("---CONFIG_KEYS_NOT_IN_STOCK---")
for k in config_only:
    print(k)

# sample values for missing keys from first vehicle with most keys
best_vid = max(stock.keys(), key=lambda v: len(stock[v]) if isinstance(stock[v], dict) else 0)
print("---SAMPLE_VEHICLE---", best_vid)
for k in missing:
    v = stock[best_vid].get(k)
    print(f"{k}={v!r}")
