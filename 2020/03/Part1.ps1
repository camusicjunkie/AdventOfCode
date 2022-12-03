$file = Get-Content $PSScriptRoot\input.txt
$tree = 0
$slope = $pos = 3

$map = foreach ($line in $file) {
    $line * [math]::Ceiling($file.Count / [math]::Floor($line.Length / $slope))
}

for ($i = 1; $i -lt $map.Count; $i++) {
    $line = $map[$i]
    $char = $line[$pos]
    $pos += $slope

    if ($char -eq '#') {
        $tree++
    }
}

$tree
