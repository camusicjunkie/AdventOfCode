$value = [System.Collections.Generic.List[int]] @()

$choices = @{
    a = 1
    b = 2
    c = 3
    x = 1
    y = 2
    z = 3
}

$winner = @{
    1 = 3
    3 = 2
    2 = 1
}

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
