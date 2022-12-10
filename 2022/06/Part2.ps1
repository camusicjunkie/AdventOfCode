$content = Get-Content .\input.txt -Raw

for ($i = 0; $i -lt $content.Length; $i++) {
    $letters = $content[$i..($i + 13)]

    $duplicates = $letters | Group-Object -NoElement | Where-Object Count -ge 2
    if (-not $duplicates) {
        $i + 14
        break
    }
}
