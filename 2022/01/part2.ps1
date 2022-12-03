using namespace System.Collections.Generic
$all = [List[int]] @()
$total = [List[int]] @()

foreach ($item in (Get-Content .\input.txt -Raw) -split '\n\r\n') {
    $total.Clear()
    foreach ($value in $item -split '\n' -match '\d') {
        $total.Add($value)
    }
    $sum = ($total | Measure-Object -Sum).Sum
    $all.Add($sum)
}
(($all | Sort-Object -Descending)[0..2] | Measure-Object -Sum).Sum
