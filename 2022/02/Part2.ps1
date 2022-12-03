$value = [System.Collections.Generic.List[int]] @()
. .\hashes.ps1

foreach ($item in (Get-Content .\input.txt)) {
    $you, $round = -split $item
    switch ($round) {
        'x' {$value.Add($winner[$choices[$you]])}
        'y' {$value.Add($choices[$you] + 3)}
        'z' {$value.Add($loser[$choices[$you]] + 6)}
    }
}
($value | Measure-Object -Sum).Sum
