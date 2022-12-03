$max = 0
foreach ($item in (Get-Content .\input.txt -Raw) -split '\n\r\n') {
    $total = 0
    foreach ($value in $item -split '\n' -match '\d') {
        $total += $value
    }
    if ($total -gt $max) {
        $max = $total
    }
}
$max
