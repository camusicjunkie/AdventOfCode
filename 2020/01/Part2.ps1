$file = (Get-Content $PSScriptRoot\input.txt) -as [int[]]

:top for ($i = 0; $i -lt $file.Count; $i++) {
    for ($j = $i + 1; $j -lt $file.Count; $j++) {
        for ($k = $j + 1; $k -lt $file.Count; $k++) {
            if ($file[$i] -eq $file[$j] -or $file[$i] -eq $file[$k]) {
                break
            }

            $sum = $file[$i] + $file[$j] + $file[$k]
            if ($sum -eq 2020) {
                Write-Host ($file[$i] * $file[$j] * $file[$k])
                break top
            }
        }
    }
}
