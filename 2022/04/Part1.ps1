$i = 0
$content = Get-Content .\input.txt
foreach ($group in $content) {
    $regex = [regex]::Matches($group, '(\d+)-(\d+),(\d+)-(\d+)')
    [int[]] $r = $regex.Captures.Groups[1..4].Value

    if ($r[0] -ge $r[2] -and $r[1] -le $r[3]) {
        $i++
    }
    elseif ($r[2] -ge $r[0] -and $r[3] -le $r[1]) {
        $i++
    }
}
$i
