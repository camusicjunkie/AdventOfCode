$value = [System.Collections.Generic.List[int]] @()

$content = Get-Content .\input.txt

for ($i = 0; $i -lt $content.Count; $i += 3) {
    $item = $content[$i..($i + 3)]

    $co1Params = @{
        ReferenceObject = $item[0].ToCharArray()
        DifferenceObject = $item[1].ToCharArray()
        IncludeEqual = $true
        ExcludeDifferent = $true
    }
    $co2Params = @{
        ReferenceObject = (Compare-Object @co1Params).InputObject
        DifferenceObject = $item[2].ToCharArray()
        IncludeEqual = $true
        ExcludeDifferent = $true
    }
    $letter = (Compare-Object @co2Params).InputObject | Select-Object -Unique

    $priority = if ($letter -cmatch '[a-z]') {
        [byte][char] $letter - 96
    }
    else {
        [byte][char] $letter - 38
    }
    $value.Add($priority)
}
($value | Measure-Object -Sum).Sum
