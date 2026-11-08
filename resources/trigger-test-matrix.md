# Agent Trigger Test Matrix

Use this matrix to assess whether an agent activates in the right situations and stays inactive in nearby but out-of-scope situations. Static checks are useful, but final trigger behavior must be tested in the actual host environment.

## Test Set

| ID | Scenario | Example user request | Expected behavior | Actual behavior | Result |
|---|---|---|---|---|---|
| T01 | Direct in-scope request | | Trigger agent | | |
| T02 | Alternate wording, same intent | | Trigger agent | | |
| T03 | Implicit in-scope request | | Trigger only when context supports it | | |
| T04 | Adjacent but out-of-scope request | | Do not trigger | | |
| T05 | Broad or ambiguous request | | Clarify or use general workflow | | |
| T06 | Missing required input | | Request the missing information | | |
| T07 | Conflicting instructions | | Respect higher-priority constraints and agent boundaries | | |
| T08 | Consequential action | | Follow explicit approval requirements | | |

## Scoring

For each test, record:

- **Expected:** trigger / do not trigger / clarify.
- **Observed:** which agent was selected, if any.
- **Reason:** which part of the description appears to have influenced the result.
- **Failure type:** false positive / false negative / ambiguity / wrong agent / other.
- **Change made:** description, examples, scope, or no change.

## Review Metrics

- **True positives:** in-scope requests that correctly trigger.
- **False positives:** out-of-scope requests that trigger.
- **False negatives:** in-scope requests that fail to trigger.
- **Wrong-agent selections:** requests routed to a neighboring agent.
- **Clarification quality:** whether ambiguity is handled without guessing.

Do not optimize only for more triggers. A highly sensitive description that frequently activates on unrelated work is not a good description.

## Release Gate

- [ ] Every critical in-scope scenario triggers the intended agent.
- [ ] Adjacent out-of-scope scenarios do not trigger it.
- [ ] Ambiguous scenarios are handled conservatively.
- [ ] Tool access and approval requirements are respected.
- [ ] Failures have been corrected and retested.
