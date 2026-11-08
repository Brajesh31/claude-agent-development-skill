# Agent Development Skill

A Claude skill for designing, creating, and validating AI agents.

## Contents

- `SKILL.md`: Original skill instructions.
- `examples/`: Agent creation prompt and complete agent examples.
- `references/`: Guidance for agent system prompts, prompt design, and triggering examples.
- `scripts/validate-agent.sh`: Agent validation script.

## License

MIT. See [LICENSE](LICENSE).

## Validation utilities

The repository includes `scripts/validate-agent.sh` and `scripts/test-agent-trigger.sh`. The first checks agent frontmatter and prompt structure. The second statically checks trigger examples; it does not invoke Claude or guarantee runtime triggering. Both require Bash and Python 3 for the trigger checker.
