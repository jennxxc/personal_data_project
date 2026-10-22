# Project Protocol

**Project title:** VR-Based Psychosocial Interventions in Dementia Care: A Focused Evidence Review  
**Review type:** Independent focused evidence review  
**Status:** Search, deduplication and initial screening completed; full-text review in progress  
**Last updated:** 2026-08-08  
**Reviewer:** Single-reviewer project

## 1. Background and purpose

This project examines how virtual reality (VR) has been used to support the psychological and social needs of people living with dementia.
The topic builds on my previous research with VR-based behavioural tasks and social interaction, as well as an NTNU Discovery project that explored possible applications of interactive VR relevant to dementia care. 
The review allows me to extend this work by learning how VR interventions have been studied in clinical and care settings.

The project also applies transferable skills from my research background, including study design, reproducible data handling, critical reading and quantitative analysis in R.
This is an independent portfolio project. It is not presented as a commissioned health assessment or a completed systematic review.

## 2. Review question

What does the available evidence suggest about the effects, acceptability and safety of VR-based psychosocial interventions for people living with dementia?

The review focuses on the following areas:
- mental well-being and behavioural or psychological symptoms;
- social interaction and engagement;
- quality of life;
- acceptability, practical use and safety.

## 3. Scope

### Population

Studies may include adults with a diagnosed dementia of any subtype or severity. Dementia type and severity will be recorded when reported.
Studies involving only people with mild cognitive impairment will be excluded. Mixed samples may be considered when the findings for participants with dementia can be identified separately.

### Interventions
Eligible interventions use immersive or semi-immersive VR, including 360-degree environments presented through a head-mounted display, for a psychosocial purpose.
Examples include:
- personalised or general reminiscence;
- nature-based or relaxing experiences;
- shared activities involving a caregiver, family member or facilitator;
- virtual environments intended to support mood, engagement or social interaction.

Interventions used only for physical exercise, navigation, diagnosis, cognitive assessment or technical testing will normally be excluded unless they also include a clear psychosocial purpose or outcome.
A conventional two-dimensional screen is not treated as the VR intervention, although it may be used as a comparator.

### Comparators
Possible comparators include usual care, no intervention, a non-VR activity, non-immersive presentation of the same content, or another active intervention.

### Outcomes
The main outcome groups are:
1. **Mental well-being and behavioural symptoms:** for example depression, anxiety, mood, apathy, agitation or aggression.
2. **Social engagement:** for example conversation, interaction, participation or withdrawal.
3. **Quality of life.**
4. **Implementation and safety:** for example acceptability, adherence, dropout, discomfort, dizziness, nausea, confusion or other adverse events.

Cognitive outcomes may be recorded when reported, but they are not the main focus of the project.
Different outcomes will not be combined simply because they belong to the same broad category. For example, depression, anxiety, apathy and agitation describe different problems and will be considered separately.

### Study designs

Controlled intervention studies will be used to examine comparative effects. These may include randomized parallel trials, randomized crossover trials and non-randomized controlled studies.
Uncontrolled pilot or feasibility studies may be used to describe acceptability, practical delivery and safety, but not to estimate comparative effectiveness.

Reviews, protocols and trial registrations may help identify relevant primary studies, but they will not be treated as intervention results unless adequate outcome data are available.

## 4. Literature search

Searches were completed in:
- PubMed/MEDLINE;
- Embase.

The searches combined terms for dementia or Alzheimer disease with terms for virtual reality. Broad outcome terms were not required because they could exclude relevant studies using different terminology.
Other databases were explored, including PsycINFO, CINAHL and CENTRAL, but complete exports were not available for this project. This is reported as a limitation rather than presented as a complete multi-database search.
The search log records the database, search date, number of records retrieved and exported file.

## 5. Record management and screening

The PubMed and Embase searches produced 2,255 records in total:
- PubMed: 722;
- Embase: 1,533.
Records were imported into R and matched using DOI, PMID and exact title. After removing 637 duplicate records, 1,618 records remained.
Title and abstract screening used an assisted workflow. Keyword rules and AI-supported classification were used to help identify clearly irrelevant records and prioritize potentially relevant records. The screening decisions are therefore treated as an initial rapid screen, not as independent dual-reviewer screening.
Potentially relevant and uncertain records require reviewer verification. Full texts are then checked against the population, intervention, outcome and study-design criteria. Multiple publications from the same underlying study are linked to avoid double counting.

## 6. Data extraction
For studies that pass full-text screening, the following information will be recorded:
- author, year, country and setting;
- study design and sample size;
- dementia diagnosis and severity;
- VR equipment, content and level of immersion;
- session duration and frequency;
- comparator;
- outcome measures and assessment time points;
- main numerical findings;
- acceptability, dropout and adverse events;
- important study limitations.

The extraction table will be kept in a structured format that can be read and analysed in R.

## 7. Evidence synthesis
The main approach will be a structured narrative synthesis. Studies will be compared by intervention type, study design, comparator and outcome.
A meta-analysis will be considered only if at least two independent studies provide sufficiently comparable:
- populations;
- intervention purposes;
- comparator conditions;
- outcome constructs and time points;
- study designs and numerical data.

The presence of two or more studies is not, by itself, enough reason to combine them. A forest plot may be used to show individual study estimates without calculating a pooled result.
If the project continues to a formal appraisal stage, the main controlled studies will be assessed using a risk-of-bias tool appropriate to their design. This assessment has not yet been completed.

## 8. Current progress
At the time of this update:
- searching and deduplication have been completed for PubMed and Embase;
- initial assisted title and abstract screening has been completed;
- full-text screening and data extraction have started;
- two randomized studies have been examined in detail;
- the first two studies were not suitable for a shared meta-analysis because their interventions, comparators, outcomes and data structures differed.

The current findings should therefore be regarded as preliminary.

## 9. Limitations
The main limitations are:
- the project is conducted by one reviewer;
- the search currently includes only PubMed and Embase;
- initial screening was assisted and has not been independently duplicated;
- many records had limited or missing abstract information;
- full-text review and data extraction are incomplete;
- the available interventions and outcome measures appear heterogeneous;
- formal risk-of-bias and certainty assessments have not yet been completed.

These limitations will be reported directly and will be considered when interpreting the findings.

## 10. Changes made during the project
The pilot work showed that the original scope was too narrow and that some planned methods were not feasible within this independent project.
| Date | Change | Reason |
|---|---|---|
| 2026-08-06 | Initial protocol drafted before searching. | Establish an initial project structure. |
| 2026-08-08 | Population broadened from Alzheimer disease and mild-to-moderate dementia to diagnosed dementia of any subtype or severity. | Relevant studies included mixed dementia diagnoses and a wider range of severity. |
| 2026-08-08 | Intervention scope broadened beyond explicitly interpersonal VR. | Relevant psychosocial interventions also included reminiscence, nature-based and relaxation experiences. |
| 2026-08-08 | The completed search was limited to PubMed and Embase. | Complete records could not be exported from all originally planned databases. |
| 2026-08-08 | Screening described as a single-reviewer assisted rapid screen. | This accurately reflects the workflow used and avoids implying independent dual screening. |
| 2026-08-08 | Narrative synthesis made the main approach; meta-analysis made conditional. | The first full-text studies differed substantially in intervention, comparator, outcomes and reported data. |

## 11. Methodological guidance

The project was informed by general guidance from the Norwegian Institute of Public Health (FHI) and the Cochrane Handbook. These sources were used to structure the research question, search, study selection and interpretation, but the project does not claim full compliance with a commissioned FHI or Cochrane review process.
- [FHI methods for evidence and decision support](https://www.fhi.no/ku/kunnskaps-og-beslutningsstotte/metodeboka/)
- [Cochrane Handbook](https://www.cochrane.org/authors/handbooks-and-manuals/handbook/current)
