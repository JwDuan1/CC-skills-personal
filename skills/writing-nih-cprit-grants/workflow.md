# Grant Writing Workflow — Collaboration Guide

## Collaboration Modes

Automatically determine the mode based on user input:

### Mode A — Start from Scratch

**Trigger:** User gives an idea, direction, or research question without written text.

```
User gives idea/direction
  → AI asks first-principles questions:
    - Why does this problem matter clinically?
    - What exists now and why is it insufficient?
    - What does your approach fundamentally change?
    - Who benefits and how?
  → Build Specific Aims skeleton together
  → Expand section by section
```

Do NOT accept the idea at face value. Challenge assumptions before writing starts.

### Mode B — Review and Rewrite

**Trigger:** User provides written sentences, paragraphs, or a draft section.

```
User provides text
  → Read and understand intent
  → Check FIRST: does this section's content belong here, or in a different aim/section?
  → Check: does this overlap with or contradict other sections already written?
  → Check: does the rationale explain WHY THE METHOD WORKS, not why the problem exists?
  → Critique against SKILL.md standards (arguments, jargon, scope, citations)
  → Propose specific rewrites with reasoning
  → Search literature to support or challenge claims
  → Verify terminology consistency across all existing sections
```

**Critical check for Approach sections:** Read the approach against the aim's stated sub-aims. Does approach (a) address sub-aim X.1? Does (b) address X.2? If not, the structure is misaligned.

### Mode C — Continue and Inspire

**Trigger:** User has unfinished text, says "help me continue", "what comes next", "give me ideas", or text ends mid-thought.

```
User provides incomplete text or asks for continuation
  → Analyze: what section is this? What's the rhetorical goal?
  → Generate 2-3 continuation directions (not one fixed answer)
  → Each direction: 1-2 sentence preview of where it leads
  → User picks a direction
  → AI writes full paragraph(s) following that direction
```

Continuation still follows all SKILL.md writing standards. "Inspiration" is not an excuse to lower quality.

## Critical Review Framework

### Level 1 — Direct Critique (Always On)

Every piece of text the user provides gets honest assessment:

- **Weak argument:** "This claim doesn't hold because [reason]. Consider: [alternative]"
- **Missing evidence:** "This needs a citation. Searching..." → provide literature
- **Scope problem:** "This reads as tool-specific. Reframe around the clinical problem."
- **Jargon overload:** "This sentence has 4 abbreviations. A non-physicist reviewer won't follow."
- **Logical gap:** "You jump from [A] to [C]. The reader needs [B] in between."

**Core principle: Do not assume the user is correct.** Use first-principles thinking. If a claim sounds reasonable but lacks justification, challenge it.

### Level 2 — Reviewer Simulation (On Request or at Final Stage)

Activate when user says "review this like a reviewer" or when a full section/draft is complete.

**NIH Study Section Simulation:**

| Criterion | Score (1-9) | Strengths | Weaknesses |
|-----------|-------------|-----------|------------|
| Significance | | | |
| Investigator | | | |
| Innovation | | | |
| Approach | | | |
| Environment | | | |
| **Overall Impact** | | | |

- 1 = exceptional, 9 = poor (NIH scale)
- Identify the 2-3 points a reviewer is most likely to attack
- Write a mock "Weaknesses" paragraph as a reviewer would

**CPRIT IIRA Additional Criteria:**
- Cancer relevance to Texas population
- Potential for clinical translation
- Innovation beyond current funded work

## Literature Search Protocol

When reading user's text:

1. **Identify claims that need citations** — any factual assertion, statistic, or "studies have shown" statement
2. **Search automatically** — use WebSearch for PubMed, Google Scholar
3. **Report findings in this format:**
   - Supporting literature found: "Author (Year), Journal — [key finding that supports your point]"
   - Contradicting literature found: "Warning: Author (Year) found [opposite result]. You should either cite and address this, or adjust your claim."
   - No literature found: "I can't find published support for this claim. Consider rephrasing as hypothesis rather than established fact."
4. **Suggest landmark citations** the user may have missed — especially AAPM Task Group reports, ESTRO guidelines, NRG Oncology trials relevant to the topic

## Section-by-Section Workflow

### Step 1: Specific Aims (Write First, Standalone Page)

- Critically discuss: Are the aims truly independent? If Aim 1 fails, do 2 and 3 still produce results?
- Verify hook starts with clinical problem, NOT technology
- Check: is the central hypothesis in ONE testable sentence?
- Search literature: is the stated gap actually a gap?

### Step 2: Significance + Innovation

- Apply Three-Level Significance Stack (see SKILL.md)
- Challenge scope: "Would a reviewer say this only matters for your specific tool?"
- Verify Innovation is framed at three levels (conceptual, methodological, translational)
- Search for competing work — are there groups doing similar things? Must acknowledge and differentiate.

### Step 3: Approach

- Check methodological rigor: sample size justification for every aim with patient data
- Verify contingency plans: "If [method] fails, we will [alternative]"
- Check timeline feasibility: can this realistically be done in the proposed period?
- Verify preliminary data supports feasibility without making the grant look like "just validation"

### Step 4: Consistency Check (After Multiple Sections Exist)

- Terminology consistent across all sections?
- Repeated information serves strategic purpose? (same conclusion, different angle)
- Narrative arc: does the story flow logically from Significance → Innovation → Approach?
- Aims in Specific Aims page match Aims in Approach exactly?

### Step 5: Reviewer Simulation (Final Stage)

- Run Level 2 review (score all criteria)
- Identify weakest 2-3 points
- Suggest specific fixes for each weakness
- Final pass: would YOU fund this grant? Why or why not?

## Resubmission Workflow

When user provides a summary statement for resubmission:

```
Input: summary statement PDF or text
  → Extract EVERY reviewer critique verbatim
  → Categorize each:
    [A] Must address — substantive scientific concern
    [B] Can address — reasonable suggestion, easy to fix  
    [C] Disagree — but must acknowledge respectfully
  → Draft Introduction to Resubmission (1 page):
    - "We thank the reviewers for their constructive feedback"
    - Address EACH point with specific page/section reference
    - Bold the changes: "We have now [specific action]"
  → Map each critique to specific text changes in Research Strategy
  → Verify: every single critique has a corresponding change or response
```

## Output Format Rules

When providing feedback or rewrites:

- **Critique:** Always explain WHY, not just what's wrong
- **Rewrite suggestions:** Show before/after so user can compare
- **Literature:** Provide enough detail to find the paper (author, year, journal, key finding)
- **Continuation options:** Number them (1, 2, 3) with brief preview of each direction
- **Reviewer simulation:** Use the table format above, be brutally honest
