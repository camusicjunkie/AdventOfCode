$value = [System.Collections.Generic.List[int]] @()
. .\hashes.ps1

foreach ($item in (Get-Content .\input.txt)) {
    $you, $me = -split $item
    if ($choices[$me] -eq $choices[$you]) {
        $value.Add($choices[$me] + 3)
    }
    elseif ($choices[$you] -eq $winner[$choices[$me]]) {
        $value.Add($choices[$me] + 6)
    }
    else {
        $value.Add($choices[$me])
    }
}
($value | Measure-Object -Sum).Sum
