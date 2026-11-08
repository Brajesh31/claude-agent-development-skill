#!/usr/bin/env bash
# Lightweight offline checks for whether an agent description contains useful trigger examples.
# This does not invoke Claude or prove that a model will select the agent.
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <path/to/agent.md>" >&2
  exit 2
fi
file="$1"
[[ -f "$file" ]] || { echo "File not found: $file" >&2; exit 1; }

python3 - "$file" <<'PY'
from pathlib import Path
import re, sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")
parts = text.split("---", 2)
if len(parts) < 3 or parts[0].strip():
    raise SystemExit("FAIL: expected YAML frontmatter bounded by ---")
frontmatter, body = parts[1], parts[2]
description_match = re.search(r"(?ms)^description:\s*(.*?)(?=^[A-Za-z0-9_-]+:|\Z)", frontmatter)
description = description_match.group(1) if description_match else ""
examples = re.findall(r"<example>(.*?)</example>", description, flags=re.S)
errors = []
if not re.search(r"(?i)use this agent when", description):
    errors.append("description should state when the agent is used")
if len(examples) < 2:
    errors.append(f"expected at least 2 trigger examples, found {len(examples)}")
for index, example in enumerate(examples, 1):
    for field in ("Context:", "user:", "assistant:"):
        if field.lower() not in example.lower():
            errors.append(f"example {index} is missing {field}")
if len(body.strip()) < 20:
    errors.append("system prompt body is missing or too short")
if errors:
    for error in errors:
        print("FAIL:", error)
    raise SystemExit(1)
print(f"PASS: {path} contains {len(examples)} structured trigger examples and a system prompt.")
print("Note: this is a static check, not a live Claude trigger evaluation.")
PY
