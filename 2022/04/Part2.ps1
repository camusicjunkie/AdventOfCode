$i = 0
$content = Get-Content .\input.txt
foreach ($group in $content) {
    $regex = [regex]::Matches($group, '(\d+)-(\d+),(\d+)-(\d+)')
    [int[]] $r = $regex.Captures.Groups[1..4].Value

    $first = $r[0]..$r[1]
    $second = $r[2]..$r[3]
    if ($first.Where({ $second -contains $_ })) {
        $i++
    }
}
$i
