---
name: writing-nih-cprit-grants
description: Use when drafting, revising, structuring, or critically reviewing NIH (R01, R21) or CPRIT IIRA grant proposals in medical physics, radiation oncology, or AI safety in radiotherapy. Also use when brainstorming grant ideas, continuing unfinished writing, or analyzing reviewer feedback.
---

# Writing NIH & CPRIT Grants — Medical Physics / Radiation Oncology

## Overview

Guide for writing competitive NIH and CPRIT grants in radiation oncology and medical physics. Addresses the most common failure modes: weak significance framing, perceived limited scope, poor clinical connection, and innovation buried in validation language.

For step-by-step collaboration workflow (drafting, reviewing, continuing, literature search, resubmission), see workflow.md in this directory.

## How Jingwei Works — Collaboration Rules

These rules are learned from real grant-writing sessions. Follow them to avoid repeated corrections.

### 1. Discuss Direction Before Writing Text

Never jump to drafting a full section. When starting a new aim or section:
- First discuss the conceptual approach ("这个aim做什么，方法论是什么")
- Get alignment on scope, boundaries, and key decisions
- Only then write the prose

If Jingwei says "先讨论一下" — stop writing and discuss. If he says "你觉得呢" — he is asking for your honest opinion, not validation.

### 2. Ground Everything in Physics and Clinical Reality

Jingwei evaluates every claim against his domain expertise. Before writing any methodological claim:
- Ask: would a medical physicist accept this reasoning?
- Ask: does this align with how RT actually works (dose gradients, conformality, machine limitations)?
- Ask: is this clinically accurate (Dmax vs Dmean, serial vs parallel organs)?

**Do NOT propose methods that sound elegant but violate physics.** Example: "dose gradient should align with contour boundary" is wrong because gradient steepness is limited by MLC leaf width and beam energy, not by plan-contour consistency. Jingwei will catch this immediately.

### 3. Lead with Methodology, Support with Tools

Jingwei distinguishes between **methods** (the principle/approach) and **tools** (specific implementations). The method should come first to establish the reasoning; the tool then provides concrete detail.
- Lead with the method: "data-driven selection strategy based on morphological variability"
- Then give tools: "for example, by extracting high-dimensional shape features using PCA and selecting templates via clustering"
- Tools are important and should be mentioned — but the reader should understand the method even if they don't know the tool

**When describing preliminary work in Specific Aims or Significance:** focus on what the method does rather than tool names that reviewers won't recognize. In Approach sections, tool names and implementation details are appropriate and expected.

### 4. Check Aim Boundaries Obsessively

Jingwei catches aim overlap and scope problems faster than anything else. Before writing any aim:
- Verify it does NOT overlap with adjacent aims
- Verify content is in the RIGHT aim (e.g., dose consequence belongs with cross-component analysis, not single-output QA)
- Verify each aim's scope is appropriate (not too large, not too small)
- Ask: if I move this sub-aim to a different aim, does it fit better there?

Common boundary mistakes to avoid:
- Putting cross-component analysis in a single-component aim
- Putting consequence quantification in a detection aim
- Putting cross-institution validation in a methods development aim

### 5. Avoid AI-Sounding Writing

Jingwei flags these patterns immediately. Do NOT:
- Overuse em dashes (—). Use periods and short sentences instead.
- Write Step 1/Step 2/Step 3 formatting. Use narrative prose (learn from Josh Niedzielski's K23 style).
- Overclaim: "the first systematic basis" → "a systematic basis". "no method exists" → "no broadly applicable method currently exists"
- Write rationale that restates the Background. Rationale should say WHY THIS METHOD WORKS, not why the problem is important.
- Use "patient-specific" and "reference-free" in ways that contradict each other. Pick consistent terminology.

**Preferred style:** Narrative flow where method description is embedded in reasoning. Each paragraph should advance the argument, not list features. Write like a scientist explaining to a colleague, not like a manual.

### 6. Significance and Innovation Must Not Repeat Each Other

Significance = WHY this problem matters (the gap, the need).
Innovation = HOW your approach is different from existing work.

If both sections say the same thing in different words, Jingwei will flag it. The fix: write Innovation as ONE paragraph describing the paradigm shift, not as aim-by-aim bullet points that mirror Significance.

### 7. Preliminary Data Strategy

How to present preliminary data depends on the grant format and agency requirements. Options include:
- **Embedded in the relevant aim:** Rationale → Preliminary data → Open questions → Approach (works well when preliminary data directly supports a specific aim)
- **Standalone section before aims:** when preliminary data supports multiple aims or the agency format calls for it
- **In the Hypothesis section:** brief mention with details later

Regardless of placement:
- Describe the METHOD of preliminary work, not just cite a paper name
- Include specific numbers (e.g., 6.7% flagged, 88.6% confirmed) — reviewers want quantitative evidence
- Explicitly state limitations of preliminary work → these naturally motivate the proposed aims
- If preliminary data comes from a different institution, note that cross-institutional validation is needed

### 8. Pitfalls Must Be Real and Actionable

Do NOT write generic pitfalls like "sample size may be insufficient." Jingwei wants:
- Pitfalls that reflect genuine methodological risks specific to this approach
- Mitigations that are concrete actions, not vague promises
- If a "pitfall" has an obvious solution, it's not a real pitfall — think harder
- If a pitfall can be reframed as a feature (e.g., "low sensitivity in low-gradient regions is self-correcting because clinical consequence is also low there"), do so

### 9. References — Find Them, Don't Guess

When a claim needs a citation:
- Search for it immediately, don't write "[refs]" as placeholder
- Provide author, journal, year, and one-line relevance
- Prefer high-impact journals (Med Phys, IJROBP, Radiother Oncol) and AAPM TG reports
- When published literature supports your feasibility (like KBP validates anatomy-dose learnability), explicitly say "these results directly validate the core feasibility of our approach"

### 10. When Jingwei Asks a Question, Answer It Honestly

When Jingwei asks "你觉得呢" or "这个有问题吗" — give your honest assessment, not agreement. If you think his suggestion has a flaw, say so with reasoning. He corrects you when you're wrong, but he also changes his mind when your argument is sound.

When Jingwei says something you don't understand or disagree with, ask for clarification rather than silently incorporating it.

## When to Use

- Drafting Specific Aims, Significance, Innovation, or Approach sections
- Revising a grant after reviewer feedback (summary statement analysis)
- Switching between NIH and CPRIT formats
- Structuring preliminary data presentation
- Writing or rewriting significance to avoid "good method, limited scope" critique

## NIH vs CPRIT Key Differences

| Aspect | NIH R01/R21 | CPRIT IIRA |
|--------|-------------|------------|
| Page limit (Research Strategy) | R01: 12 pages; R21: 6 pages | 10 pages |
| Review focus | Scientific rigor, significance, innovation | Cancer relevance, TX impact, innovation |
| Significance framing | Broad public health + mechanistic gap | Cancer burden in Texas + clinical translation |
| Budget | R01: ~$250K/yr direct; R21: ~$275K total | Up to $300K/yr |
| Preliminary data | Expected for R01; optional for R21 | Strongly encouraged |
| Timeline | R01: 5 yr; R21: 2 yr | 3 yr |

## The "Scope Problem" — Your #1 Failure Mode

Reviewers say: *"Good method, but scope is limited"* or *"research is not extremely novel, mostly validation."*

**Root cause:** You write about YOUR TOOL instead of THE PROBLEM IT SOLVES.

**Fix — The Three-Level Significance Stack:**

| Level | What to write | Example for ContourQA |
|-------|--------------|----------------------|
| **L1: Clinical crisis** | Epidemiology + patient harm | "AI-generated contours are increasingly adopted in RT planning, yet no systematic QA framework exists. Contouring errors directly impact dose delivery and patient outcomes." |
| **L2: Systemic gap** | Why current solutions fail | "Current QA relies on manual review by physicians — subjective, time-consuming, and unsustainable as AI adoption scales. FDA clearance does not guarantee per-patient safety." |
| **L3: Your solution's broader impact** | Beyond your specific tool | "A reference-free QA platform establishes the foundation for safe clinical deployment of ANY AI tool in RT, analogous to how IMRT QA transformed treatment delivery safety." |

**Key rule: L1 and L2 should be 60% of your Significance. L3 is 40%. Never lead with your tool.**

## Specific Aims Page — The 1-Page Sales Pitch

Structure (strictly follow this order):

```
Paragraph 1: HOOK (2-3 sentences)
- Start with clinical crisis, not technology
- Quantify: patients affected, error rates, harm
- End with: "yet no [X] exists"

Paragraph 2: GAP (3-4 sentences)  
- What has been tried and why it failed
- Use "However," "Despite," "While X has shown promise, Y remains"
- End with knowledge gap statement

Paragraph 3: YOUR APPROACH (3-4 sentences)
- "To address this critical gap, we propose..."
- State central hypothesis in ONE sentence
- Long-term goal vs. this grant's objective

Paragraph 4: AIMS (structured list)
- Aim 1: Foundational / characterization (can stand alone)
- Aim 2: Builds on Aim 1, more complex
- Aim 3: Clinical translation / validation
- Each aim: ONE sentence, starts with active verb

Paragraph 5: IMPACT (2-3 sentences)
- What changes if this works
- Scope BEYOND your specific disease/tool
- "This work will establish..." (paradigm language)
```

## Aim Design Rules

**Every aim must be independently achievable.** If Aim 1 fails, Aims 2-3 should still produce publishable results.

**Progressive complexity pattern (from K23 example):**
- Aim 1: Characterize/establish baseline → foundational
- Aim 2: Develop/validate biomarker or method → builds on Aim 1 data
- Aim 3: Demonstrate clinical application → translational

**Aim boundary rules (from CPRIT session):**
- Each aim should have ONE clear job. If an aim does three things, consider splitting.
- Content belongs in the aim where it is METHODOLOGICALLY natural, not where it was first mentioned.
  - Example: "dose consequence quantification" requires cross-component analysis (contour → dose), so it belongs in a cross-component aim, not a single-component QA aim.
- Significance paragraphs should map 1:1 to aims. If Significance has 4 paragraphs but you have 3 aims, two paragraphs are overlapping.
- When writing expected outcomes for Aim N, explicitly state what outputs feed into Aim N+1. This makes the data flow visible to reviewers.

**Data flow between aims must be explicit.** For each aim, state:
- What it receives from prior aims (inputs)
- What it produces (outputs)
- What the next aim will use from those outputs

## Writing Patterns That Work

### 1. Gap-Bridge-Impact (use in every section)
- **Gap:** "Current contouring QA relies on [limitation]..."
- **Bridge:** "We propose a reference-free approach that [mechanism]..."
- **Impact:** "enabling systematic QA for [broader scope]..."

### 2. Proactive Concern Addressing
Don't wait for reviewers to find weaknesses. State them first:
- "While our prior work at [institution] demonstrated feasibility (Reference X), the current proposal extends this by [specific new contribution]"
- "A potential limitation is [X]. We address this through [contingency]"

### 3. Distinguish Prior Work from New Contribution
**This was a critical failure in your Sabin review.** Reviewer wrote: *"Harder to understand what previous development has been completed"* and *"unclear relationship to previously completed analysis."*

**Fix:** Add a clear "Preliminary Data" or "Prior Work" subsection that explicitly states:
- What was done before (with citations to your own work)
- What is NEW in this proposal (use bold or italics)
- Why prior data supports feasibility but does NOT answer the new question

### 4. Quantified Precision
Replace vague language with numbers:
- ❌ "We will recruit a large cohort"
- ✅ "We will enroll 200 patients over 3 years (power analysis: N=150 for 80% power at α=0.05)"

### 5. Accessible Writing — The Jargon Balance

**Rule: Write for a smart scientist outside your subfield.**

- First mention: full term + abbreviation → "radiation-induced lung injury (RILI)"
- After that: abbreviation only
- One technical concept per sentence max
- If a sentence has >2 abbreviations, rewrite it
- Use analogies for novel concepts: "analogous to how TPS commissioning ensures beam accuracy"

**Test:** Can a radiation oncologist (not a physicist) understand your Significance section? If not, simplify.

## Avoiding Repetition While Emphasizing Key Points

**Problem:** You repeat information across sections without strategic purpose.

**Rule: Repeat the CONCLUSION, not the DETAILS.**

| Section | What to say about your QA platform |
|---------|-----------------------------------|
| Specific Aims | "reference-free QA platform for safe AI deployment" (1 sentence) |
| Significance | WHY it matters (clinical impact, no existing solution) |
| Innovation | HOW it's different (reference-free, generalizable, real-time) |
| Approach | WHAT you'll do (methods, validation, endpoints) |

**Same core message, different angle each time.** The reviewer should hear "AI safety QA" echoing through every section, but never feel they're re-reading the same paragraph.

## Innovation Section — Don't Let Them Call It "Just Validation"

**From your Sabin review:** *"Research is not extremely novel as candidate has largely completed the innovative part"*

**Fix: Frame innovation at THREE levels:**

1. **Conceptual innovation:** "First reference-free QA framework for AI contouring" (the idea)
2. **Methodological innovation:** "Novel [specific method] that enables [specific capability]" (the how)
3. **Translational innovation:** "First systematic approach to [clinical workflow change]" (the impact)

**Never frame your grant as "validating" existing work. Frame it as "establishing" a new paradigm.**

- ❌ "We will validate our previously developed software"
- ✅ "We will establish a prospective, multi-site QA framework — the first of its kind for AI-assisted contouring in clinical RT"

## Figure Strategy

Grants need 3-5 key figures. Plan these:

| Figure | Purpose | Placement |
|--------|---------|-----------|
| **Fig 1: Overview schematic** | Show the whole framework at a glance | Specific Aims or early Approach |
| **Fig 2: Preliminary data** | Prove feasibility | Approach, after methods description |
| **Fig 3: Study design / timeline** | Show rigor and planning | Approach |
| **Fig 4: Expected outcomes** | Help reviewer visualize success | Late Approach |
| **Fig 5: Clinical workflow** | Show how this integrates into real practice | Innovation or Approach |

**Figure design principles:**
- One message per figure — if you need a paragraph to explain it, redesign
- Label panels (A), (B), (C) with descriptive captions
- Use consistent color scheme across all figures
- Clinical images (CT, dose distributions) ground the work in reality

## Literature Search Strategy

**For finding supporting citations efficiently:**

1. **Start with review articles** in your subfield → mine their reference lists
2. **Key search terms for AI safety in RT:**
   - "quality assurance artificial intelligence radiation therapy"
   - "auto-segmentation quality assurance"
   - "AI commissioning radiotherapy"
   - "contour quality metrics"
3. **Use Google Scholar "Cited by"** to find newer work citing landmark papers
4. **Track competing groups:** Know who else is working on AI QA (e.g., groups at UPenn, UCSF, Michigan)
5. **AAPM Task Group reports** are authoritative citations for QA standards

## Reviewer Feedback Response Checklist

When revising after a summary statement:

- [ ] List EVERY critique verbatim
- [ ] Categorize: (A) must address, (B) can address, (C) disagree but must acknowledge
- [ ] For each Category A item, write the specific text change
- [ ] For resubmission: write Introduction addressing EACH point
- [ ] Have a colleague read your response — did you actually address it or just restate your position?

## Approach Section — Writing Style

**Write like Josh Niedzielski's K23, not like a protocol manual.**

Each aim's approach should read as narrative prose:
- Rationale and method woven together, not separated into labeled subsections
- Shared methodology (cohort, data, processing) in an Overview section before all aims
- Preliminary data embedded in the relevant aim, not in a standalone section
- Figures placed inline next to the text they support

**Structure within each aim:**
```
Aim X.Y: [Title]

Rationale. WHY THIS METHOD WORKS (not why the problem is important).
[1-2 sentences grounding the method in clinical practice or physics]

Preliminary data. [If applicable — method description + results + limitations]
[Limitations → naturally transition to "the proposed work will address..."]

Approach. [Narrative description of what you will do]
[Can use (a), (b), (c) if there are truly distinct methodological components,
but each should read as a paragraph, not a bullet point]

Expected outcomes. [1-2 sentences]

Potential pitfalls and alternatives. [Numbered, each with specific mitigation]
```

**Rationale is NOT Background.** A common mistake: writing "Auto-segmentation is widely adopted in RT but errors remain a problem" as Aim 1.1 rationale. This restates Background. Instead, rationale should explain the METHODOLOGICAL BASIS: "Clinically acceptable contours conform to anatomical conventions learnable from cohort data. A contour that deviates from this learned range is flagged for the same reason a reviewer would flag it."

**When your method overlaps conceptually with existing work (e.g., KBP):** Consider whether the distinction needs to be made explicit. If a reviewer is likely to ask "how is this different from X?", address it proactively. The level of detail depends on how close the overlap is — sometimes a sentence suffices, sometimes a dedicated paragraph is warranted.

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Leading with your tool instead of the problem | Start every section with clinical need |
| "Validation" language | Use "establish," "demonstrate," "define" |
| Aims that depend on each other | Each aim must produce results independently |
| Significance = literature review | Significance = why this matters NOW + what changes |
| Same preliminary data described twice | Reference figure once, interpret differently per section |
| Jargon-heavy opening paragraph | First paragraph: zero unexplained abbreviations |
| Missing power analysis | Every aim with patient data needs sample size justification |
| No contingency plans | Each aim needs "if X fails, we will Y" |
| CPRIT without Texas cancer burden | CPRIT wants TX-specific impact — add it |
| Rationale restates Background | Rationale = why the method works, not why the problem exists |
| Step 1/2/3 formatting in Approach | Use narrative prose, not numbered steps |
| Overclaiming ("the first", "no method exists") | Soften: "a systematic basis", "no broadly applicable method" |
| Generic pitfalls ("may not generalize") | Write specific pitfalls tied to the actual method, with concrete mitigation |

## Quick Reference: Section Word Budgets (R01, 12 pages)

| Section | Approximate Budget | Priority |
|---------|-------------------|----------|
| Specific Aims | 1 page (standalone) | Highest — reviewers form opinion here |
| Significance | 2-2.5 pages | High — your #1 weakness, invest here |
| Innovation | 1-1.5 pages | Medium-High |
| Approach | 7-8 pages | High — bulk of the science |
| Preliminary Data | 1-2 pages (within Approach) | High for R01 |
