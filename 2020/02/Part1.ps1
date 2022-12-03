$file = Get-Content $PSScriptRoot\input.txt

$i = 0

foreach ($line in $file) {
    $policy, $password = $line -split ': '
    $n1, $n2, $letter = -split $policy -split '-'
    $count = [regex]::Matches($password, $letter).Count

    if ($count -in $n1..$n2) {
        $i++
    }
}

$i
