# Agent Release Checklist

Use this checklist before sharing an agent with a team or relying on it in a production workflow.

## Configuration

- [ ] Agent name is unique, clear, and valid for the host.
- [ ] Frontmatter is valid for the host version.
- [ ] Required fields and supported values are confirmed.
- [ ] Agent file is stored in the correct directory.
- [ ] Description states when the agent should and should not be used.

## Prompt Quality

- [ ] Role and responsibility are specific.
- [ ] Inputs and assumptions are explicit.
- [ ] Workflow steps are actionable.
- [ ] Output format and definition of done are clear.
- [ ] Missing information and error cases are covered.
- [ ] Uncertainty and limitations must be reported honestly.

## Security and Permissions

- [ ] Tool access follows least privilege.
- [ ] Read-only capabilities are preferred where sufficient.
- [ ] File writes and shell commands have clear boundaries.
- [ ] External side effects require suitable authorization.
- [ ] Secrets and sensitive information are handled safely.
- [ ] Untrusted content is treated as data, not instructions.

## Testing

- [ ] Structural validator passes or remaining warnings are understood.
- [ ] Trigger test matrix includes positive and negative cases.
- [ ] Agent is tested in the target host environment.
- [ ] Output quality is reviewed on representative tasks.
- [ ] Failure and recovery behavior are tested.
- [ ] Permission boundaries are tested.

## Operations and Maintenance

- [ ] Owner and maintenance contact are identified.
- [ ] Host and configuration version are recorded.
- [ ] Known limitations are documented.
- [ ] Changes to tools, models, or host behavior trigger retesting.
- [ ] Feedback and regression reports have a place to go.

## Release Decision

- **Agent name and version:**
- **Host version:**
- **Owner:**
- **Reviewer:**
- **Known limitations:**
- **Approval decision:** approve / revise / reject
- **Review date:**
