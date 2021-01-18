#requires -version 7.0

$file = Get-Content $PSScriptRoot\input.txt -Raw
$nl = [System.Environment]::NewLine
$passports = $file -split "$nl$nl"

$i = 0

foreach ($passport in $passports) {
    $hash = @{}
    foreach ($item in (-split $passport)) {
        $hash += ($item | ConvertFrom-StringData -Delimiter ':')
    }

    if ($hash.Count -eq 8) { $i++; continue }
    elseif (-not $hash.ContainsKey('cid') -and $hash.Count -eq 7) {$i++; continue}
}

$i
