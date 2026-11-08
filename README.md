# Agent Development Skill

A Claude Code skill for designing, creating, testing, and refining specialized agents. It covers agent file structure, YAML frontmatter, trigger descriptions, system prompts, tool permissions, examples, and practical validation.

The goal is to create agents with a narrow responsibility, clear activation conditions, minimum necessary access, and behavior that can be tested.

## What This Skill Covers

- Agent file layout and host-specific frontmatter.
- Naming conventions and discriminative descriptions.
- Trigger examples, including positive and negative cases.
- System prompt structure, workflows, and output contracts.
- Model, color, and tool configuration where supported.
- Agent creation patterns and reusable examples.
- Static validation and trigger-example checks.
- Prompt refinement based on observed activation and output failures.

## When to Use It

Use this skill when creating or improving Claude Code agents or subagents, writing an agent definition, designing a system prompt, refining when-to-use descriptions, restricting tool permissions, or testing whether an agent activates in appropriate situations.

This repository documents a particular agent configuration format. Confirm which fields, model identifiers, colors, and tool names are supported by the host application version being used. A passing local check does not prove that a host will accept every field or that an LLM will select the agent correctly.

## Installation

~~~bash
git clone https://github.com/Brajesh31/claude-agent-development-skill.git ~/.claude/skills/agent-development
~~~

Invoke the skill in Claude Code:

~~~text
/agent-development
~~~

## Recommended Development Workflow

1. **Write the job statement.** Describe the one responsibility the agent should own.
2. **Set boundaries.** List adjacent tasks that should remain with the main assistant or another agent.
3. **Draft the trigger description.** Make it specific enough to distinguish the agent from alternatives.
4. **Add representative examples.** Include direct requests, realistic variations, and cases where the agent should not activate.
5. **Design the system prompt.** Define role, required inputs, operating procedure, quality standards, output structure, and failure handling.
6. **Apply least privilege.** Give the agent only the tools needed for its job.
7. **Validate configuration.** Check frontmatter, required fields, identifiers, and prompt presence.
8. **Test activation.** Run positive and negative scenarios in the actual host environment.
9. **Inspect behavior.** Check task completion, tool use, accuracy, and adherence to constraints.
10. **Revise based on evidence.** Fix observed false positives, false negatives, or output failures.

## Agent Design Principles

### Keep the Scope Narrow

An agent that claims to handle everything is difficult to trigger reliably and difficult to evaluate. Define a clear primary job and make exclusions explicit.

### Make Triggers Discriminative

Use examples that reflect actual user language. Include both requests that should trigger the agent and nearby requests that should not. Avoid generic examples that could describe several agents.

### Make Prompts Operational

A useful system prompt explains what to inspect, which steps to follow, how to handle missing information, what tools may be used, and what a complete result looks like.

### Follow Least Privilege

Prefer read-only tools for analysis tasks. Add write, shell, network, or destructive capabilities only when the responsibility genuinely requires them. Approval and confirmation requirements should be explicit for consequential actions.

### Test Runtime Behavior

Static checks can detect malformed files. They cannot establish whether the host loads the agent, whether the description triggers correctly, or whether the agent performs well on real tasks.

## Validation Scripts

Run the structural validator against an agent definition:

~~~bash
bash scripts/validate-agent.sh agents/example-agent.md
~~~

Run the static trigger-example check:

~~~bash
bash scripts/test-agent-trigger.sh agents/example-agent.md
~~~

Both scripts accept a path to an agent Markdown file. The trigger script checks that the description contains at least two structured examples. Neither script invokes Claude or performs a live trigger test.

## Included Resources

- [Agent design brief](resources/agent-design-brief.md): define scope, users, triggers, tools, inputs, and outputs before drafting.
- [Trigger test matrix](resources/trigger-test-matrix.md): build positive, negative, and ambiguous activation scenarios.
- [Agent release checklist](resources/agent-release-checklist.md): review configuration, permissions, runtime behavior, and maintenance before sharing.

## Existing Examples and References

| Path | Purpose |
|---|---|
| [examples/agent-creation-prompt.md](examples/agent-creation-prompt.md) | Reusable prompt for AI-assisted agent creation |
| [examples/complete-agent-examples.md](examples/complete-agent-examples.md) | Full agent examples and patterns |
| [references/agent-creation-system-prompt.md](references/agent-creation-system-prompt.md) | Agent creation system prompt reference |
| [references/system-prompt-design.md](references/system-prompt-design.md) | Prompt structure and writing guidance |
| [references/triggering-examples.md](references/triggering-examples.md) | Trigger example patterns and common mistakes |
| [scripts/validate-agent.sh](scripts/validate-agent.sh) | Static structure and field checks |
| [scripts/test-agent-trigger.sh](scripts/test-agent-trigger.sh) | Static checks for trigger example structure |

## Repository Structure

~~~text
claude-agent-development-skill/
├── SKILL.md
├── README.md
├── LICENSE
├── examples/
│   ├── agent-creation-prompt.md
│   └── complete-agent-examples.md
├── references/
│   ├── agent-creation-system-prompt.md
│   ├── system-prompt-design.md
│   └── triggering-examples.md
├── resources/
│   ├── agent-design-brief.md
│   ├── agent-release-checklist.md
│   └── trigger-test-matrix.md
└── scripts/
    ├── test-agent-trigger.sh
    └── validate-agent.sh
~~~

## Quality Checklist

- The agent has one clear primary responsibility.
- Its description distinguishes it from related agents.
- Trigger examples cover expected and unexpected activation.
- The system prompt defines inputs, process, output, and failure handling.
- Tool access follows least privilege.
- Risky actions have explicit authorization boundaries.
- Configuration passes static validation.
- Positive and negative activation tests are run in the actual host.
- Runtime output is reviewed before the agent is relied upon.

## License

Released under the MIT License. Copyright (c) 2026 Brajesh Kumar. See the root LICENSE file for the complete terms.
