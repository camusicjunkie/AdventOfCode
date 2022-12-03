Get-Content $PSScriptRoot\input.txt |
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

        $row * 8 + $column
    } | Sort-Object | Select-Object -Last 1
