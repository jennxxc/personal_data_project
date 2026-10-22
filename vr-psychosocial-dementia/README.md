# VR-Based Psychosocial Interventions in Dementia Care

*An independent focused evidence review of mental well-being, social engagement, acceptability and safety*

## Project overview

This project explores how virtual reality (VR) has been used to support the psychological and social needs of people living with dementia.
It focuses on interventions such as VR reminiscence, relaxing or nature-based experiences, and socially facilitated activities. The aim is not to determine whether every form of VR "works", but to understand what has been studied, what outcomes have been reported, and where the evidence remains uncertain.
This is an independent portfolio project. It is not presented as a completed systematic review, a commissioned evidence assessment or a clinical recommendation.

## Why I chose this topic

The project developed from my existing research interests. My recent research has involved VR-based behavioural tasks and social interaction in healthy adults. Through an NTNU Discovery project, I also began exploring how interactive VR might eventually support social and cognitive experiences relevant to dementia care.
I wanted to understand how similar ideas have been investigated in clinical and care settings, and whether the available evidence supports further development. The project also gives me an opportunity to apply transferable skills in research design, reproducible data handling, critical reading and R analysis to evidence synthesis.

## Review question

What does the available evidence suggest about the effects, acceptability and safety of VR-based psychosocial interventions for people living with dementia?
The review considers four broad areas:

- mental well-being and behavioural or psychological symptoms;
- social interaction and engagement;
- quality of life;
- acceptability, practical use and safety.

## Scope

### Population

The review considers adults with a diagnosed dementia of any subtype or severity. Dementia type and severity are recorded when reported.

Studies involving only people with mild cognitive impairment are excluded. Mixed samples may be considered when findings for participants with dementia can be identified separately.

### VR interventions

Relevant interventions may include:

- personalised or general VR reminiscence;
- nature-based or relaxing VR experiences;
- activities supported by a caregiver, family member or facilitator;
- shared or multi-user virtual environments;
- other VR experiences intended to support mood, engagement or social interaction.

Interventions used only for physical exercise, navigation, diagnosis, cognitive assessment or technical testing are normally excluded unless they also have a clear psychosocial purpose or outcome.

### Outcomes

The review records:

- depression, anxiety, mood and affect;
- apathy, agitation, aggression and other behavioural symptoms;
- conversation, interaction, participation and social withdrawal;
- quality of life;
- acceptability, adherence and dropout;
- discomfort, dizziness, nausea, confusion and other adverse events.

These outcomes are not treated as interchangeable. For example, apathy, anxiety and aggression describe different problems and will not be combined into a single "mental well-being" result.

## What has been done

### Literature search

Searches were completed in PubMed/MEDLINE and Embase using broad terms for dementia and virtual reality.

| Database | Records retrieved |
|---|---:|
| PubMed/MEDLINE | 722 |
| Embase | 1,533 |
| **Total** | **2,255** |

PsycINFO, CINAHL and CENTRAL were explored, but complete exports were not available for this project. The review therefore does not claim to be a complete multi-database systematic search.

### Import and deduplication in R

The PubMed and Embase records were imported into R and matched using DOI, PMID and exact title.

| Stage | Records |
|---|---:|
| Before deduplication | 2,255 |
| After DOI matching | 2,223 |
| After PMID matching | 2,223 |
| After exact-title matching | 1,618 |

A total of 637 duplicate records were removed.

### Initial screening

Title and abstract screening used an assisted workflow combining keyword rules, AI-supported classification and reviewer checks. This was used to prioritize the large set of records; it does not replace independent screening by two reviewers.

The initial screen classified:

- 61 records as potentially relevant;
- 27 records as uncertain and requiring further verification;
- 1,530 records as unlikely to meet the scope.

These are working screening categories rather than final inclusion numbers. Full-text verification is still required.

### Full-text review

Two randomized studies have so far been reviewed in detail:

1. A randomized crossover study comparing immersive and non-immersive VR reminiscence.
2. A randomized trial comparing short VR sessions with usual care in an acute-care hospital.

The first study reported higher behavioural engagement during immersive reminiscence, but no clear improvement across overall engagement, social engagement or well-being. The second reported fewer aggressive behaviours in the VR group, but no clear differences in other behavioural symptoms or quality of life.

Both studies suggested that VR was generally acceptable for at least some participants, although sessions were often brief and minor discomfort or anxiety was reported.

The findings are preliminary and should not be interpreted as evidence that VR is broadly effective in dementia care.

## Analytical approach

R is used to:

- import and combine bibliographic records;
- standardize fields from different databases;
- identify duplicate records;
- organize screening decisions;
- group possible studies by intervention, outcome and design;
- prepare descriptive tables and figures.

The main synthesis will be a structured comparison of the included studies. A meta-analysis will only be considered if independent studies use sufficiently similar populations, interventions, comparators, outcomes and time points and report the numerical data required to calculate comparable effects.

The first two full-text studies were not suitable for a shared meta-analysis because they used different interventions, comparators, outcomes and data structures.

## Current status

- [x] Research question and initial scope developed
- [x] Working protocol prepared and revised after the pilot work
- [x] PubMed and Embase searches completed
- [x] Bibliographic records imported and deduplicated in R
- [x] Initial assisted title and abstract screening completed
- [x] Two full-text studies reviewed and extracted
- [ ] Potentially relevant and uncertain records verified by the reviewer
- [ ] Additional full texts assessed
- [ ] Study characteristics table completed
- [ ] Risk-of-bias assessment completed if the project continues to that stage
- [ ] Final narrative synthesis and evidence brief completed
- [ ] Meta-analysis conducted only if a defensible group of comparable studies is identified

## Limitations

This is a small, single-reviewer project. The search currently covers two databases, the assisted screening has not been independently duplicated, and full-text review is incomplete. Many studies also appear to use different VR formats, comparators and outcome measures.

The project is therefore best understood as a reproducible focused evidence review in progress. Its current value lies in documenting the research question, data workflow, screening decisions and methodological judgement, rather than providing a final answer about clinical effectiveness.

## Repository structure

```text
vr-psychosocial-dementia/
├── README.md
├── protocol.md
├── search_strategy.md
├── data/
│   ├── raw/
│   └── processed/
├── analysis/
└── outputs/
```

The current methods, scope changes and limitations are described in [`protocol.md`](protocol.md).
