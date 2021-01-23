$seats = Get-Content $PSScriptRoot\input.txt |
    Where-Object { $_ -match '^(?<row>.+?)(?<column>.{3})$' } |
    ForEach-Object {
        $rows = 0..127
        switch ($Matches.row.ToCharArray()) {
            { $true } { $l = ($rows.Count / 2) - 1 }
            'F' { $rows = $rows[0..$l] }
            'B' { $rows = $rows[($l + 1)..($rows.Count - 1)] }
        }
        $row = $rows[0]

        $columns = 0..7
        switch ($Matches.column.ToCharArray()) {
            { $true } { $l = ($columns.Count / 2) - 1 }
            'L' { $columns = $columns[0..$l] }
            'R' { $columns = $columns[($l + 1)..($columns.Count - 1)] }
        }
        $column = $columns[0]

        [pscustomobject] @{
            Row    = $row
            Column = $column
            Id     = $row * 8 + $column
        }
    }

$firstRow = $seats.Row | Sort-Object | Select-Object -First 1
$lastRow = $seats.Row | Sort-Object | Select-Object -Last 1
$myRow = ($seats | Group-Object Row | Where-Object { $_.Count -ne 8 -and $_.Name -ne $firstRow -and $_.Name -ne $lastRow }).Group

$hash = @{}
$expected = 0..7
$list = $myRow.Column

$count = $expected.Count
for ($idx = 0; $idx -lt $count; $idx += 1) {
    $item = $expected[$idx]
    $hash.$item = 0
}

$count = $list.Count
for ($idx = 0; $idx -lt $count; $idx += 1) {
    $item = $list[$idx]
    $hash.$item += 1
}

$mySeat = $hash.GetEnumerator().Where({$_.Value -eq 0}).Name
($myRow | Where-Object column -eq ($mySeat - 1)).Id + 1
