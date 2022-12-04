$value = [System.Collections.Generic.List[int]] @()

foreach ($item in (Get-Content .\input.txt)) {
    $half = $item.Length / 2
    $left = $item.Substring(0, $half)
    $right = $item.Substring($half)

    $coParams = @{
        ReferenceObject = $left.ToCharArray()
        DifferenceObject = $right.ToCharArray()
        IncludeEqual = $true
        ExcludeDifferent = $true
    }
    $letter = (Compare-Object @coParams).InputObject | Sort-Object -Unique

    $priority = if ($letter -cmatch '[a-z]') {
        [byte][char] $letter - 96
    }
    else {
        [byte][char] $letter - 38
    }
    $value.Add($priority)
}
($value | Measure-Object -Sum).Sum
