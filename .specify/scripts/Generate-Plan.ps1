# Generate-Plan.ps1
# Generates or updates an implementation plan from a specification

param(
    [Parameter(Mandatory=$true)]
    [string]$SpecPath,
    
    [switch]$Force
)

$ErrorActionPreference = "Stop"

# Validate spec path
if (-not (Test-Path $SpecPath)) {
    Write-Error "Spec path does not exist: $SpecPath"
    exit 1
}

$specFile = Join-Path $SpecPath "spec.md"
$planFile = Join-Path $SpecPath "plan.md"

# Check if spec.md exists
if (-not (Test-Path $specFile)) {
    Write-Error "spec.md not found in $SpecPath"
    exit 1
}

# Check if plan.md already exists
if ((Test-Path $planFile) -and -not $Force) {
    $response = Read-Host "plan.md already exists. Overwrite? (y/N)"
    if ($response -ne 'y') {
        Write-Host "Aborted." -ForegroundColor Yellow
        exit 0
    }
}

Write-Host "Generating implementation plan..." -ForegroundColor Green
Write-Host "Reading specification from: $specFile" -ForegroundColor Cyan

# Note: This script serves as a launcher for manual planning or AI-assisted planning
# In practice, you would:
# 1. Use GitHub Copilot Chat with the plan agent prompt
# 2. Or manually create the plan based on the spec
# 3. Or integrate with an LLM API

Write-Host "`nTo generate a plan, you can:" -ForegroundColor Yellow
Write-Host "  Option 1: Use GitHub Copilot Chat" -ForegroundColor Cyan
Write-Host "    - Open the spec.md file"
Write-Host "    - Use '@workspace /new' or '@workspace /explain'"
Write-Host "    - Reference .github/agents/plan.md for guidance"
Write-Host "    - Ask: 'Create an implementation plan for this specification'"
Write-Host ""
Write-Host "  Option 2: Manual Planning" -ForegroundColor Cyan
Write-Host "    - Open plan.md in your editor"
Write-Host "    - Follow the template structure from .specify/templates/plan.md"
Write-Host "    - Break down the spec into phases and tasks"
Write-Host ""
Write-Host "  Option 3: Use an LLM API" -ForegroundColor Cyan
Write-Host "    - Integrate this script with OpenAI, Anthropic, or similar"
Write-Host "    - Pass the spec content and plan agent prompt"
Write-Host "    - Generate plan automatically"

Write-Host "`nSpec path: $SpecPath" -ForegroundColor Green
