# Agent Design Brief

Complete this brief before writing an agent file. It makes the agent's scope and expected behavior explicit.

## 1. Identity and Purpose

- **Proposed agent name:**
- **One-sentence job statement:**
- **Primary user:**
- **Problem it solves:**
- **Why a separate agent is justified:**

## 2. Scope and Boundaries

- **Tasks it owns:**
- **Tasks it must not own:**
- **Related agents or workflows:**
- **When to hand work back to the main assistant:**
- **Required human approvals:**

## 3. Trigger Design

- **Direct requests that should trigger it:**
- **Implicit situations that should trigger it:**
- **Phrases or contexts that should not trigger it:**
- **Two to four representative positive examples:**
- **At least two negative examples:**

## 4. Inputs and Outputs

- **Required inputs:**
- **Optional inputs:**
- **Clarifications to request when inputs are missing:**
- **Expected output format:**
- **Definition of done:**
- **Error and uncertainty behavior:**

## 5. Tools and Permissions

| Tool / capability | Needed? | Reason | Restrictions |
|---|---|---|---|
| Read files | | | |
| Write files | | | |
| Shell / commands | | | |
| Network access | | | |
| External services | | | |

Grant the smallest tool set that can complete the task. Record write and external-action permissions explicitly.

## 6. Runtime Configuration

- **Host and version:**
- **Model setting:**
- **Color / UI setting, if supported:**
- **Tool field format supported by host:**
- **Agent file path:**

## 7. Acceptance Tests

- **Positive trigger test 1:**
- **Positive trigger test 2:**
- **Negative trigger test 1:**
- **Negative trigger test 2:**
- **Task-quality test:**
- **Permission-boundary test:**

## Approval

- **Owner:**
- **Reviewer:**
- **Date:**
- **Decision:** draft / revise / approved
