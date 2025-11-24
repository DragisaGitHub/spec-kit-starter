# List-Specs.ps1
# Lists all specifications with their status

param(
    [string]$SpecsRoot = "specs",
    [ValidateSet("All", "InProgress", "Completed", "NotStarted")]
    [string]$Status = "All"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $SpecsRoot)) {
    Write-Warning "Specs directory not found: $SpecsRoot"
    exit 0
}

Write-Host "Specifications in $SpecsRoot`:" -ForegroundColor Green
Write-Host ""

$specs = Get-ChildItem -Path $SpecsRoot -Directory | Sort-Object Name

if ($specs.Count -eq 0) {
    Write-Host "No specifications found." -ForegroundColor Yellow
    exit 0
}

foreach ($spec in $specs) {
    $specPath = $spec.FullName
    $specName = $spec.Name
    
    # Check for key files
    $hasSpec = Test-Path (Join-Path $specPath "spec.md")
    $hasPlan = Test-Path (Join-Path $specPath "plan.md")
    $hasTasks = Test-Path (Join-Path $specPath "tasks.md")
    
    # Determine status
    $statusText = "Not Started"
    $statusColor = "Gray"
    
    if ($hasTasks) {
        # Check if tasks are completed
        $tasksContent = Get-Content (Join-Path $specPath "tasks.md") -Raw
        if ($tasksContent -match '✅|Completed') {
            $statusText = "Completed"
            $statusColor = "Green"
        } else {
            $statusText = "In Progress"
            $statusColor = "Cyan"
        }
    } elseif ($hasPlan) {
        $statusText = "Planning"
        $statusColor = "Yellow"
    } elseif ($hasSpec) {
        $statusText = "Specifying"
        $statusColor = "Yellow"
    }
    
    # Filter by status if specified
    if ($Status -ne "All") {
        if ($Status -eq "InProgress" -and $statusText -ne "In Progress") { continue }
        if ($Status -eq "Completed" -and $statusText -ne "Completed") { continue }
        if ($Status -eq "NotStarted" -and $statusText -ne "Not Started") { continue }
    }
    
    # Display spec info
    Write-Host "📋 $specName" -ForegroundColor White
    Write-Host "   Status: $statusText" -ForegroundColor $statusColor
    Write-Host "   Files:  Spec:$hasSpec | Plan:$hasPlan | Tasks:$hasTasks"
    Write-Host ""
}

Write-Host "Total specifications: $($specs.Count)" -ForegroundColor Green
