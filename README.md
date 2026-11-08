# claude-agent-development-skill

A Claude Code skill for designing, creating, configuring, and validating specialized AI agents.

## Overview

An agent is useful when a task needs a focused system prompt, defined tools, clear triggering conditions, and independent execution boundaries. This skill explains how to structure agent definitions, write effective descriptions, choose tools, and test whether an agent activates for the intended requests.

## What It Covers

- Agent file structure and YAML frontmatter.
- Naming and description design.
- Triggering conditions and example prompts.
- System prompt organization.
- Tool permissions and capability boundaries.
- Model and presentation configuration where supported.
- Agent examples and reusable patterns.
- Validation and trigger testing.

## Agent Design Principles

### Define a Narrow Responsibility

An agent should have a clear job and an understandable boundary. Avoid descriptions that overlap with every other agent in the project.

### Write Specific Trigger Conditions

Describe the tasks, user phrases, and contexts that should activate the agent. Include examples that distinguish it from adjacent agents.

### Make the System Prompt Operational

Specify the workflow, expected inputs, output format, constraints, and failure behavior. Avoid vague instructions such as "be an expert" without concrete expectations.

### Limit Tool Access

Grant only the tools required for the agent's responsibilities. Treat file writes, shell commands, network actions, and destructive operations as explicit capabilities.

### Validate Before Deployment

Check frontmatter, required fields, prompt structure, and representative trigger cases.

## Installation

```bash
git clone https://github.com/Brajesh31/claude-agent-development-skill.git ~/.claude/skills/agent-development
```

## Usage

Invoke the skill when creating or improving an agent:

```text
/agent-development
```

Provide the agent's intended responsibility, target users, trigger examples, available tools, and expected output.

## Agent Development Workflow

1. Define the task the agent should own.
2. Identify tasks it must not handle.
3. Write a concise, discriminative description.
4. Define the agent's operating procedure.
5. Select the minimum required tools.
6. Add examples for expected activation and non-activation.
7. Validate the configuration.
8. Test trigger behavior with representative prompts.
9. Review output quality and tool boundaries.
10. Refine the description and prompt based on observed failures.

## Example Agent Structure

```text
agents/
└── specialist.md
```

A typical agent file contains YAML frontmatter followed by a Markdown system prompt. Exact fields and supported values depend on the agent host and its version.

## Validation Utilities

The repository includes scripts for checking agent definitions and trigger examples:

```bash
bash scripts/validate-agent.sh
bash scripts/test-agent-trigger.sh
```

These checks help identify structural problems. Static validation does not prove that an agent will activate correctly or behave reliably at runtime.

## Repository Contents

- `SKILL.md`: Main agent-development guidance.
- `examples/`: Agent definitions and creation examples.
- `references/`: Prompt, structure, and trigger guidance.
- `scripts/validate-agent.sh`: Agent structure validation.
- `scripts/test-agent-trigger.sh`: Static trigger-example checks.
- `README.md`: Workflow and installation guidance.

## Quality Checklist

- Agent responsibility is narrow and explicit.
- Trigger description is specific.
- System prompt defines inputs, steps, and outputs.
- Tool permissions follow least privilege.
- Risky actions have suitable approval boundaries.
- Examples cover both positive and negative triggers.
- Configuration passes structural validation.
- Runtime behavior is tested before relying on the agent.
