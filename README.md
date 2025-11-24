# SpecKit Starter Template

A comprehensive starter template for managing software projects using the SpecKit methodology. This template provides a structured approach to feature development through specifications, planning, task management, and GitHub Copilot agents.

## 📋 Overview

This template helps you:
- **Specify** features with detailed requirements and acceptance criteria
- **Plan** implementations with phased approaches and risk assessment
- **Track** work with granular, actionable tasks
- **Research** and document technical decisions
- **Define** project principles and constraints with a constitution
- **Automate** spec creation and management with PowerShell scripts
- **Leverage** GitHub Copilot agents for AI-assisted development

## 🗂️ Repository Structure

```
spec-kit-starter/
├── .github/
│   └── agents/                    # GitHub Copilot agent prompts
│       ├── specify.md            # Specification creation agent
│       ├── plan.md               # Implementation planning agent
│       ├── tasks.md              # Task breakdown agent
│       └── analyze.md            # Code analysis agent
│
├── .specify/
│   ├── scripts/                  # PowerShell automation scripts
│   │   ├── New-Spec.ps1         # Create new specification
│   │   ├── Generate-Plan.ps1    # Generate implementation plan
│   │   ├── Generate-Tasks.ps1   # Generate task breakdown
│   │   └── List-Specs.ps1       # List all specifications
│   │
│   └── templates/                # Document templates
│       ├── spec.md              # Specification template
│       ├── plan.md              # Planning template
│       ├── tasks.md             # Task list template
│       ├── research.md          # Research document template
│       └── constitution.md      # Project constitution template
│
└── specs/                        # All project specifications
    └── 000-example/              # Example specification
        ├── spec.md              # Feature requirements
        ├── plan.md              # Implementation plan
        ├── tasks.md             # Task breakdown
        ├── research.md          # Research & analysis
        └── constitution.md      # Project guidelines
```

## 🚀 Getting Started

### Starting a New Feature

#### Option 1: Using PowerShell Scripts (Recommended)

1. **Create a new specification:**
   ```powershell
   .\.specify\scripts\New-Spec.ps1 -SpecNumber "001" -SpecName "user-profile"
   ```
   This creates a new folder `specs/001-user-profile/` with all template files.

2. **Edit the specification:**
   Open `specs/001-user-profile/spec.md` and fill in the feature requirements.

3. **Generate an implementation plan:**
   ```powershell
   .\.specify\scripts\Generate-Plan.ps1 -SpecPath "specs/001-user-profile"
   ```
   Follow the guidance to create your plan (manually or with GitHub Copilot).

4. **Generate task breakdown:**
   ```powershell
   .\.specify\scripts\Generate-Tasks.ps1 -SpecPath "specs/001-user-profile"
   ```
   Break down the plan into actionable tasks.

5. **List all specifications:**
   ```powershell
   .\.specify\scripts\List-Specs.ps1
   ```

#### Option 2: Manual Creation

1. Create a new folder: `specs/XXX-feature-name/`
2. Copy templates from `.specify/templates/` to your new folder
3. Fill in each document following the template structure

#### Option 3: Using GitHub Copilot

1. Open GitHub Copilot Chat
2. Reference the agent prompts: `.github/agents/specify.md`
3. Ask: "Help me create a specification for [feature description]"
4. Copilot will guide you through the specification process

### Workflow

The SpecKit workflow follows these phases:

```
1. SPECIFY → 2. PLAN → 3. TASK BREAKDOWN → 4. IMPLEMENT → 5. REVIEW
```

#### 1. **Specify Phase** 📝
Define what you're building and why.

**Document**: `spec.md`  
**Agent**: `.github/agents/specify.md`  
**Includes**:
- Overview and goals
- User stories
- Technical requirements
- API design
- Security considerations
- Acceptance criteria

**Tip**: Use the Specify agent in GitHub Copilot to ask clarifying questions and ensure completeness.

#### 2. **Plan Phase** 🗺️
Determine how to build it.

**Document**: `plan.md`  
**Agent**: `.github/agents/plan.md`  
**Includes**:
- Architecture overview
- Implementation phases
- Testing strategy
- Risk assessment
- Timeline estimates

**Tip**: Break work into small, shippable increments. Identify the "smallest valuable feature" first.

#### 3. **Task Breakdown Phase** ✅
Create actionable work items.

**Document**: `tasks.md`  
**Agent**: `.github/agents/tasks.md`  
**Includes**:
- Granular tasks (hours to 1 day each)
- Acceptance criteria per task
- Dependencies and sequencing
- Progress tracking

**Tip**: Each task should be independently testable and reviewable.

#### 4. **Implementation Phase** 💻
Build the feature.

- Work through tasks sequentially
- Update task status as you progress
- Run tests continuously
- Document decisions and changes

**Tip**: Use GitHub Copilot agents to help with code generation and problem-solving.

#### 5. **Review & Analysis Phase** 🔍
Analyze and improve.

**Document**: `research.md`  
**Agent**: `.github/agents/analyze.md`  
**Includes**:
- Code quality review
- Performance analysis
- Security review
- Lessons learned
- Recommendations

**Tip**: Use this phase to document decisions and improve future implementations.

## 📚 Document Templates

### spec.md - Feature Specification
Comprehensive document defining what needs to be built.

**Key Sections**:
- Overview & Goals
- User Stories
- Technical Requirements (Frontend, Backend, Data Model)
- API Design
- Security & Performance Requirements
- Acceptance Criteria

### plan.md - Implementation Plan
Detailed plan for how to implement the specification.

**Key Sections**:
- Architecture Overview
- Implementation Phases with Tasks
- Testing Strategy
- Deployment Considerations
- Risk Assessment
- Timeline Estimates

### tasks.md - Task List
Granular breakdown of work into actionable tasks.

**Key Sections**:
- Task Details (ID, Category, Complexity, Dependencies)
- Acceptance Criteria per Task
- Files to Create/Modify
- Testing Requirements
- Progress Tracking

### research.md - Research & Analysis
Documentation of research findings and analysis.

**Key Sections**:
- Research Questions
- Key Findings
- Alternative Approaches Considered
- Performance & Security Analysis
- Recommendations

### constitution.md - Project Constitution
Principles, constraints, and decision-making framework.

**Key Sections**:
- Core Principles
- Design Constraints
- Quality Standards
- Decision Framework
- Non-Negotiables
- Success Criteria

## 🤖 GitHub Copilot Agents

This template includes four specialized agents to assist with different phases:

### Specify Agent
**Location**: `.github/agents/specify.md`  
**Purpose**: Help create comprehensive feature specifications  
**Use when**: Starting a new feature or defining requirements

### Plan Agent
**Location**: `.github/agents/plan.md`  
**Purpose**: Transform specifications into implementation plans  
**Use when**: Breaking down a spec into phases and tasks

### Tasks Agent
**Location**: `.github/agents/tasks.md`  
**Purpose**: Create detailed, actionable task lists  
**Use when**: Converting a plan into granular work items

### Analyze Agent
**Location**: `.github/agents/analyze.md`  
**Purpose**: Analyze code and identify improvements  
**Use when**: Reviewing code, finding issues, suggesting optimizations

### How to Use Agents

In GitHub Copilot Chat:
```
@workspace Reference .github/agents/specify.md and help me create 
a specification for [your feature description]
```

Or reference them in your prompts:
```
Using the guidance in .github/agents/plan.md, create an 
implementation plan for the feature in specs/001-user-profile/spec.md
```

## 🛠️ PowerShell Scripts

### New-Spec.ps1
Creates a new specification folder with all template files.

```powershell
.\.specify\scripts\New-Spec.ps1 -SpecNumber "042" -SpecName "search-feature"
```

**Parameters**:
- `SpecNumber`: 3-digit number (e.g., 001, 042, 123)
- `SpecName`: Short kebab-case name
- `SpecsRoot`: (Optional) Path to specs folder (default: "specs")

### Generate-Plan.ps1
Helps generate or update an implementation plan.

```powershell
.\.specify\scripts\Generate-Plan.ps1 -SpecPath "specs/001-feature"
```

**Parameters**:
- `SpecPath`: Path to the specification folder
- `Force`: (Optional) Overwrite existing plan without prompting

### Generate-Tasks.ps1
Helps generate or update task breakdown.

```powershell
.\.specify\scripts\Generate-Tasks.ps1 -SpecPath "specs/001-feature"
```

**Parameters**:
- `SpecPath`: Path to the specification folder
- `Force`: (Optional) Overwrite existing tasks without prompting

### List-Specs.ps1
Lists all specifications with their status.

```powershell
.\.specify\scripts\List-Specs.ps1 -Status "InProgress"
```

**Parameters**:
- `SpecsRoot`: (Optional) Path to specs folder (default: "specs")
- `Status`: (Optional) Filter by status: All, InProgress, Completed, NotStarted

## 📖 Example Specification

Check out `specs/000-example/` for a complete example of a user authentication system specification, including:
- Full specification with API design and security requirements
- Multi-phase implementation plan with risk assessment
- Detailed task breakdown with 12+ tasks
- Research document with library comparisons and security analysis
- Project constitution with principles and quality standards

This example demonstrates best practices and serves as a reference for your own specifications.

## 💡 Best Practices

### Specification
- Be specific and unambiguous
- Include examples and diagrams
- Consider edge cases and error scenarios
- Define clear acceptance criteria
- Keep specifications as living documents

### Planning
- Break work into small, shippable increments
- Identify dependencies early
- Plan for testing at each phase
- Consider rollback strategies
- Be realistic with estimates

### Task Management
- Make tasks independently testable
- Include clear acceptance criteria
- Update status regularly
- Document blockers immediately
- Celebrate completed tasks

### Research & Analysis
- Document decisions and rationale
- Compare alternatives objectively
- Consider long-term implications
- Share learnings with the team
- Update as you learn

### Using AI Agents
- Provide context in your prompts
- Review and validate AI suggestions
- Iterate on the output
- Use agents as assistants, not replacements
- Learn from the AI's reasoning

## 🤝 Contributing

This is a personal starter template. Feel free to:
- Fork and customize for your needs
- Adapt the templates to your workflow
- Add new scripts or agents
- Share improvements back

## 📄 License

This template is provided as-is for personal and commercial use. Customize freely for your projects.

## 🎯 Quick Start Checklist

- [ ] Clone this repository
- [ ] Review the example specification in `specs/000-example/`
- [ ] Create your first spec: `.\.specify\scripts\New-Spec.ps1 -SpecNumber "001" -SpecName "my-feature"`
- [ ] Fill in the specification document
- [ ] Generate a plan using the Plan Agent or script
- [ ] Break down into tasks
- [ ] Start implementing!

---

**Happy Specifying!** 🚀

For questions or improvements, open an issue or submit a pull request.
