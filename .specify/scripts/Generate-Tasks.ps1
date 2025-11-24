# Generate-Tasks.ps1
# Generates or updates a task list from an implementation plan

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

$planFile = Join-Path $SpecPath "plan.md"
$tasksFile = Join-Path $SpecPath "tasks.md"

# Check if plan.md exists
if (-not (Test-Path $planFile)) {
    Write-Error "plan.md not found in $SpecPath. Generate a plan first using Generate-Plan.ps1"
    exit 1
}

# Check if tasks.md already exists
if ((Test-Path $tasksFile) -and -not $Force) {
    $response = Read-Host "tasks.md already exists. Overwrite? (y/N)"
    if ($response -ne 'y') {
        Write-Host "Aborted." -ForegroundColor Yellow
        exit 0
    }
}

Write-Host "Generating task list..." -ForegroundColor Green
Write-Host "Reading plan from: $planFile" -ForegroundColor Cyan

# Note: This script serves as a launcher for manual task breakdown or AI-assisted task generation
# In practice, you would:
# 1. Use GitHub Copilot Chat with the tasks agent prompt
# 2. Or manually create the tasks based on the plan
# 3. Or integrate with an LLM API

Write-Host "`nTo generate tasks, you can:" -ForegroundColor Yellow
Write-Host "  Option 1: Use GitHub Copilot Chat" -ForegroundColor Cyan
Write-Host "    - Open the plan.md file"
Write-Host "    - Use '@workspace /new' or '@workspace /explain'"
Write-Host "    - Reference .github/agents/tasks.md for guidance"
Write-Host "    - Ask: 'Create a detailed task list for this implementation plan'"
Write-Host ""
Write-Host "  Option 2: Manual Task Breakdown" -ForegroundColor Cyan
Write-Host "    - Open tasks.md in your editor"
Write-Host "    - Follow the template structure from .specify/templates/tasks.md"
Write-Host "    - Break down each phase into specific tasks"
Write-Host ""
Write-Host "  Option 3: Use an LLM API" -ForegroundColor Cyan
Write-Host "    - Integrate this script with OpenAI, Anthropic, or similar"
Write-Host "    - Pass the plan content and tasks agent prompt"
Write-Host "    - Generate tasks automatically"

Write-Host "`nSpec path: $SpecPath" -ForegroundColor Green
