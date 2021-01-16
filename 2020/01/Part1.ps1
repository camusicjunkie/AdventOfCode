$file = (Get-Content $PSScriptRoot\input.txt) -as [int[]]

:top for ($i = 0; $i -lt $file.Count; $i++) {
    for ($j = $i + 1; $j -lt $file.Count; $j++) {
        if ($file[$i] -eq $file[$j]) {
            break
        }

        $sum = $file[$i] + $file[$j]
        if ($sum -eq 2020) {
            Write-Host ($file[$i] * $file[$j])
            break top
        }
    }
}
