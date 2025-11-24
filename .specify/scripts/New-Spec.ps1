# New-Spec.ps1
# Creates a new specification folder from templates

param(
    [Parameter(Mandatory=$true)]
    [string]$SpecNumber,
    
    [Parameter(Mandatory=$true)]
    [string]$SpecName,
    
    [string]$SpecsRoot = "specs"
)

$ErrorActionPreference = "Stop"

# Validate spec number format (NNN or NNN-name)
if ($SpecNumber -notmatch '^\d{3}$') {
    Write-Error "Spec number must be a 3-digit number (e.g., 001, 042, 123)"
    exit 1
}

# Create folder name
$folderName = "$SpecNumber-$SpecName"
$specPath = Join-Path $SpecsRoot $folderName

# Check if spec already exists
if (Test-Path $specPath) {
    Write-Error "Spec folder already exists: $specPath"
    exit 1
}

Write-Host "Creating new specification: $folderName" -ForegroundColor Green

# Create the spec folder
New-Item -ItemType Directory -Path $specPath -Force | Out-Null

# Copy templates to new spec folder
$templatesPath = ".specify/templates"
$templates = @("spec.md", "plan.md", "tasks.md", "research.md", "constitution.md")

foreach ($template in $templates) {
    $sourcePath = Join-Path $templatesPath $template
    $destPath = Join-Path $specPath $template
    
    if (Test-Path $sourcePath) {
        $content = Get-Content $sourcePath -Raw
        
        # Replace placeholders
        $content = $content -replace '\[SPEC_NUMBER\]', $SpecNumber
        $content = $content -replace '\[SPEC_NAME\]', $SpecName
        $content = $content -replace '\[DATE\]', (Get-Date -Format "yyyy-MM-dd")
        
        Set-Content -Path $destPath -Value $content
        Write-Host "  Created: $template" -ForegroundColor Cyan
    } else {
        Write-Warning "  Template not found: $template"
    }
}

Write-Host "`nSpecification created successfully!" -ForegroundColor Green
Write-Host "Location: $specPath" -ForegroundColor Yellow
Write-Host "`nNext steps:" -ForegroundColor Cyan
Write-Host "  1. Edit spec.md to define the feature requirements"
Write-Host "  2. Run .\\.specify\scripts\Generate-Plan.ps1 -SpecPath '$specPath' (or use GitHub Copilot)"
Write-Host "  3. Edit plan.md to refine the implementation plan"
Write-Host "  4. Run .\\.specify\scripts\Generate-Tasks.ps1 -SpecPath '$specPath' (or use GitHub Copilot)"
Write-Host "  5. Start working through tasks.md"
