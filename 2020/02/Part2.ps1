$file = Get-Content $PSScriptRoot\input.txt

$i = 0

foreach ($line in $file) {
    $policy, $password = $line -split ': '
    $n1, $n2, $letter = -split $policy -split '-'
    $indices = [regex]::Matches($password, $letter).Index

    if ($n1 - 1 -in $indices -or $n2 - 1 -in $indices) {
        if ($n1 - 1 -in $indices -and $n2 - 1 -in $indices) {
            continue
        }

        $i++
    }
}

$i
