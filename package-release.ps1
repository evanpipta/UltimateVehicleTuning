[CmdletBinding()]
param(
    [string]$OutputPath
)

$ErrorActionPreference = "Stop"

$modRoot = $PSScriptRoot.TrimEnd("\")
$OutputPath = if ($OutputPath) {
    $OutputPath
} else {
    Join-Path $modRoot "release\UltimateVehicleTuning.zip"
}
$modName = Split-Path $modRoot -Leaf
$archiveRoot = "bin\x64\plugins\cyber_engine_tweaks\mods\$modName"
$stagingRoot = Join-Path ([System.IO.Path]::GetTempPath()) (
    "UltimateVehicleTuning-release-" + [Guid]::NewGuid().ToString("N")
)
$stagedModRoot = Join-Path $stagingRoot $archiveRoot
$scriptName = Split-Path $PSCommandPath -Leaf
$resolvedOutput = [System.IO.Path]::GetFullPath($OutputPath)

function Test-ExcludedFile {
    param([string]$RelativePath)

    $normalized = $RelativePath.Replace("/", "\")
    $fileName = Split-Path $normalized -Leaf

    return (
        $normalized -eq ".gitignore" -or
        $normalized -eq "db.sqlite3" -or
        $normalized -eq "NEXUS_DESCRIPTION.txt" -or
        $normalized -eq $scriptName -or
        $normalized.StartsWith(".git\", [StringComparison]::OrdinalIgnoreCase) -or
        $normalized.StartsWith(".github\", [StringComparison]::OrdinalIgnoreCase) -or
        $normalized.StartsWith("release\", [StringComparison]::OrdinalIgnoreCase) -or
        $normalized.StartsWith("tunes\__custom__", [StringComparison]::OrdinalIgnoreCase) -or
        (
            $normalized.StartsWith("tunes\", [StringComparison]::OrdinalIgnoreCase) -and
            $fileName.EndsWith(".json", [StringComparison]::OrdinalIgnoreCase) -and
            $fileName -ine "modded_default.json" -and
            $fileName -ine "Stage 3.json"
        ) -or
        $fileName.EndsWith(".log", [StringComparison]::OrdinalIgnoreCase)
    )
}

try {
    New-Item -ItemType Directory -Path $stagedModRoot -Force | Out-Null

    $files = Get-ChildItem -LiteralPath $modRoot -Recurse -File -Force |
        Where-Object {
            $relativePath = $_.FullName.Substring($modRoot.Length + 1)
            -not (Test-ExcludedFile $relativePath)
        }

    foreach ($file in $files) {
        $relativePath = $file.FullName.Substring($modRoot.Length + 1)
        $destination = Join-Path $stagedModRoot $relativePath
        $destinationDirectory = Split-Path $destination -Parent

        New-Item -ItemType Directory -Path $destinationDirectory -Force | Out-Null
        Copy-Item -LiteralPath $file.FullName -Destination $destination -Force
    }

    $outputDirectory = Split-Path $resolvedOutput -Parent
    New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null

    if (Test-Path -LiteralPath $resolvedOutput) {
        Remove-Item -LiteralPath $resolvedOutput -Force
    }

    Compress-Archive `
        -LiteralPath (Join-Path $stagingRoot "bin") `
        -DestinationPath $resolvedOutput `
        -CompressionLevel Optimal

    $fileCount = $files.Count
    $archiveSize = (Get-Item -LiteralPath $resolvedOutput).Length
    Write-Host "Created $resolvedOutput"
    Write-Host "Packaged $fileCount files ($archiveSize bytes)."
}
finally {
    if (Test-Path -LiteralPath $stagingRoot) {
        Remove-Item -LiteralPath $stagingRoot -Recurse -Force
    }
}
