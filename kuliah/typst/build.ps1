$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
$sourceDirectory = Join-Path $projectRoot "kuliah"
$chapterDirectory = Join-Path $PSScriptRoot "chapters"
$bookSource = Join-Path $PSScriptRoot "buku-kuliah.typ"
$outputDirectory = Join-Path $projectRoot "output\pdf"
$outputPdf = Join-Path $outputDirectory "buku-kuliah-teknologi-cerdas.pdf"

New-Item -ItemType Directory -Force -Path $chapterDirectory | Out-Null
New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null

$sources = Get-ChildItem $sourceDirectory -Filter "k-*.qmd" | Sort-Object Name
if ($sources.Count -ne 15) {
    throw "Diharapkan 15 sumber kuliah, ditemukan $($sources.Count)."
}

foreach ($source in $sources) {
    $target = Join-Path $chapterDirectory ($source.BaseName + ".typ")
    & quarto pandoc $source.FullName --from markdown --to typst --wrap=preserve --output $target
    if ($LASTEXITCODE -ne 0) {
        throw "Konversi gagal: $($source.Name)"
    }
}

& quarto typst compile $bookSource $outputPdf
if ($LASTEXITCODE -ne 0) {
    throw "Kompilasi buku Typst gagal."
}

Write-Output "Buku berhasil dibuat: $outputPdf"
