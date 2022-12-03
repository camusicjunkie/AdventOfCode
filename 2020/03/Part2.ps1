$file = Get-Content $PSScriptRoot\input.txt

$j = 1

$trees = foreach ($slope in @(1, 3, 5, 7, 1)) {
    $tree = 0
    $pos = $slope

    $map = foreach ($line in $file) {
        $line * [math]::Ceiling($file.Count / [math]::Floor($line.Length / $slope))
    }

    if ($j -le 4) {
        for ($i = 1; $i -lt $map.Count; $i++) {
            $line = $map[$i]
            $char = $line[$pos]
            $pos += $slope

            if ($char -eq '#') {
                $tree++
            }
        }
    }
    else {
        for ($i = 2; $i -lt $map.Count; $i += 2) {
            $line = $map[$i]
            $char = $line[$pos]
            $pos += $slope

            if ($char -eq '#') {
                $tree++
            }
        }
    }

    $j++
    $tree
}

$trees
Invoke-Expression ($trees -join '*')
