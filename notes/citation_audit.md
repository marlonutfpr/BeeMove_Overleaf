CITATION AUDIT, round-2 related work (BeeMove, MTAP)
Checked against: references_index.md, reviewer_critique.md, the new-references list, the claim checks and the RITA report. I also opened these sources myself: the Crossref abstracts of ToxTrac (10.1111/2041-210X.12874) and AnimalTA (10.1111/2041-210X.14115), the bioRxiv abstract of Api-TRACE (10.1101/2024.09.24.614513), ctrax.sourceforge.net, and docs.ultralytics.com/models/ plus /models/yolo12/ (HTTP 200). I edited no file in BeeMove_Overleaf.

A. KEYS NOT IN references.bib OR THE NEW-REFERENCES LIST
None. I compared every \cite key in /tmp/claude-1000/-home-marlon-marcon-workspace-Bee-tracker/12460409-83b2-46d3-83b6-bfcbe6892da6/scratchpad/rw_round2.tex with the keys in references.bib. Exactly 18 keys are missing from the .bib: pereira2022sleap, mathis2018deeplabcut, panadeiro2021review, sridhar2019tracktor, geissmann2017ethoscopes, branson2009highthroughput, charreton2015locomotor, williamson2014exposure, bozek2021markerless, bjerge2022realtime, norouzzadeh2021deep, beery2018recognition, cheng2024yoloworld, liu2024grounding, mclean2018trajr, bland1986statistical, kao2019localization, ozuberk2026prompt. All 18 are in the new-references list, so all must be added to the .bib before compiling.
Bib housekeeping:
- jocher2026ultralytics is defined twice. Remove one copy.
- tian2025yolov12 is still the arXiv @misc. Replace it with the NeurIPS 2025 entry.
- williamson2014exposure must use DOI 10.1007/s10646-014-1283-x. The critique's 10.1007/s10646-014-1279-4 returns 404.
- lima2025analyzing writes the name as "Ortoncelli, Andr{\'e} Roberto". That is correct. Crossref's split ("Roberto Ortoncelli" as family name) is the error; do not copy it.

B. PROBLEMS FOUND (most serious first)

1. [CONTRADICTED] Key: tzutalin2015labelimg.
Sentence: "Generic tools such as LabelImg~\cite{tzutalin2015labelimg}, CVAT~\cite{cvat2023computer} and Label Studio~\cite{tkachenko2020label} offer model-assisted pre-annotation."
Problem: the index and README describe LabelImg as a manual bounding-box tool. Nothing in any source says it offers model-assisted pre-annotation; only CVAT and Label Studio do (claim checks).
Corrected: "LabelImg~\cite{tzutalin2015labelimg} is a manual box-annotation tool, whereas CVAT~\cite{cvat2023computer} and Label Studio~\cite{tkachenko2020label} offer model-assisted pre-annotation."
Also fix references_index.md, which says LabelImg was "most likely the one used for the original 930 images". The RITA paper used ImgLab.

2. [UNSUPPORTED TABLE CELL] Key: erdem2026apitrace. Row: Api-TRACE, column "Walking-path endpoints" = partial.
Problem: the bioRxiv abstract says Api-TRACE outputs "stimulus exposure duration and learning profiles of each individual bee". It reports no distance, speed or other path endpoint.
Corrected: set the cell to n.r. (or --), and add the footnote "Outputs stimulus-exposure duration and learning profiles."

3. [PARTLY SUPPORTED] Key: mathis2018deeplabcut.
Sentence: "DeepLabCut extracts outlier frames from low likelihood, keypoint jumps or model-fit deviations, then refines, merges and retrains~\cite{mathis2018deeplabcut,nath2019using}"
Problem: the mathis2018 finding covers markerless pose estimation with about 200 labelled frames. The outlier criteria (uncertain, jump, fitting) and refine/merge come from the nath2019 protocol and the user guide. Nothing shows the 2018 paper contains them.
Corrected: "DeepLabCut~\cite{mathis2018deeplabcut} extracts outlier frames from low likelihood, keypoint jumps or model-fit deviations, then refines, merges and retrains~\cite{nath2019using}\footnote{...}."

4. [PARTLY SUPPORTED] Key: pereira2022sleap.
Sentence: "The SLEAP interface suggests frames by sampling, image features, prediction score ... and velocity, and supports prediction-assisted labelling and retraining~\cite{pereira2022sleap}\footnote{SLEAP GUI guide...}."
Problem: the new-references finding says the four heuristics come from the GUI docs, not from the paper. The footnote covers this, but the \cite currently attributes the heuristics to the paper.
Corrected: "SLEAP~\cite{pereira2022sleap} supports prediction-assisted labelling and retraining, and its interface suggests frames by sampling, image features, prediction score (instance count and low scores) and velocity\footnote{SLEAP GUI guide, ...}."

5. [UNSUPPORTED INFERENCE] Key: lima2025analyzing.
Sentence: "The study used one setup and a single split."
Problem: the RITA paper never states that there was a single setup. It says videos were recorded with smartphone cameras (plural) and that treatments varied. "Single split" is supported (one 600/120/210 partition). "One setup" is our inference.
Corrected: "All data came from one group's recordings and a single train/validation/test split; the study did not test cross-setup generalisation or report variance across folds, and it offered no way to adapt the detector to a new laboratory."

6. [IMPRECISE] Keys: lima2025analyzing, bochkovskiy2020yolov4.
Sentence: "It fine-tuned eight Darknet backbones from the YOLOv4 and YOLOv7 families"
Problem: one of the eight weights is csdarknet53-omega (a CSPDarknet53 backbone), not a YOLOv4 or YOLOv7 detector config (RITA Table 2).
Corrected: "It fine-tuned eight pretrained Darknet models (YOLOv4 and YOLOv7 variants and a CSPDarknet53 backbone)".
The rest of that paragraph is supported: 930 frames, 600/120/210, 17 videos plus mosaics, no video in more than one set, 95.03% mAP@0.5, the outputs, and the four stated limitations.

7. [MISMATCH: SOFTWARE VERSION vs CLAIM] Key: jocher2023ultralytics.
Sentence: "The Ultralytics framework~\cite{jocher2023ultralytics} offers one training and inference interface for YOLOv8, YOLO11 ..., YOLOv12 ... and ... YOLO26"
Problem: the bib entry is version 8.0.0 (2023-01-10). That release predates YOLO11, YOLO12 and YOLO26, so the cited version cannot support the sentence. Ultralytics names the model "YOLO12" (docs.ultralytics.com/models/yolo12/ exists); "YOLOv12" is the paper's name.
Corrected: keep the sentence, but either drop the version field, or cite the version actually used in BeeMove with an access date. Write "YOLO12~\cite{tian2025yolov12}" when referring to it inside Ultralytics. Apply the same naming to the first contribution bullet.

8. [UNCITED / OVERSTATED]
Sentence: "Locomotion is one of the most frequently measured of these endpoints."
Problem: no source in the set reports how often endpoints are measured.
Corrected: "Locomotion is a common behavioural endpoint." Keep the examples that follow as support, or delete the sentence.

9. [UNCITED / OVERSTATED] Key: redmon2016you.
Sentence: "Single-stage detectors derived from YOLO~\cite{redmon2016you} dominate applied detection"
Problem: redmon2016 introduces YOLO. Neither it nor terven2023 or diwan2022 (as indexed) establishes dominance.
Corrected: "Single-stage detectors derived from YOLO~\cite{redmon2016you} are widely used in applied detection; their evolution is reviewed in~\cite{terven2023comprehensive,diwan2022object}."

10. [IMPRECISE] Key: fardergomes2024exposure.
Sentence: "In Neotropical stingless bees, pesticides reduced walking distance and velocity~\cite{fardergomes2024exposure}"
Problem: the study covers one species (Scaptotrigona postica) and three pesticides (imidacloprid, pyraclostrobin, glyphosate).
Corrected: "In the Neotropical stingless bee \textit{Scaptotrigona postica}, ingested pesticides reduced walking distance and velocity~\cite{fardergomes2024exposure}".

11. [MILD OVERSTATEMENT] Key: barascou2021pesticide.
Sentence: "behavioural endpoints are increasingly argued to belong in risk assessment"
Problem: a single position paper cannot support "increasingly".
Corrected: "behavioural endpoints have been argued to belong in risk assessment, next to the classical lethal tests~\cite{barascou2021pesticide}."

12. [PARTLY SUPPORTED] Key: antonelli2022fewshot.
Sentence: "plain fine-tuning of a pretrained detector is a strong few-label baseline~\cite{wang2020frustratingly,antonelli2022fewshot}"
Problem: the strong-baseline finding is wang2020's. antonelli2022 is a survey of few-shot object detection methods.
Corrected: "plain fine-tuning of a pretrained detector is a strong few-label baseline~\cite{wang2020frustratingly}, see also the survey in~\cite{antonelli2022fewshot}".

13. [PARTLY SUPPORTED] Keys: wang2016robust, cheng2018obtaining.
Sentence: "... and fish in tanks~\cite{wang2016robust,cheng2018obtaining}"
Problem: wang2016 is a CNN head-identification tracker for fish schools. The index has only its title and metadata, and no tank setting is stated. The tank setting comes from cheng2018.
Corrected: "... and fish schools and fish in tanks~\cite{wang2016robust,cheng2018obtaining}".

14. [TABLE CELL, IMPRECISE] Key: erasocasas2026neuroadapttrainer. Column "Deep detector" = checkmark.
Problem: the tool does YOLO instance segmentation, not box detection.
Corrected: keep the checkmark and add a footnote: "YOLO instance segmentation on still images."

15. [OK, BUT KEEP THE TODO] Key: ozuberk2026prompt.
Sentence: "A recent study in this journal compared prompt robustness, fine-tuning and generalisation of such models"
Problem: only the title and metadata were verified. The models compared are YOLO-World, YOLO-World v2 and YOLOE, so "such models" must not be read as including Grounding DINO.
Corrected: "A recent study in this journal compared prompt robustness, fine-tuning and generalisation of YOLO-World and YOLOE variants~\cite{ozuberk2026prompt}."

C. CHECKED AND SUPPORTED (no change needed)
- Motivation: lima2025 (bioindicators; visual scoring time-consuming and prone to failures), charreton2015, williamson2014, graefffilho2026, piovesan2020, libardoni2021 (one bee per Petri dish, 10 min, four endpoints), lim2023, panadeiro2021 (4 tools export metrics; 11 updated in 2019-2021), beery2018, suto2023.
- Bees subsection: tosi2017 (vertical arena illuminated from the top; 30 vs 60 min), hernandez2026 (Confidor 350 CS, Africanized bees, Colombia, body-segment and group motion), fardergomes/piovesan for Brazil and ruizsanchez for Mexico, charreton fipronil, benhamou2004 with mclean2018, kimura2014.
- Ctrax/branson2009: ctrax.sourceforge.net states the package is described in "High-Throughput Ethomics in Large Groups of Drosophila" (Branson et al., 2009), so the name is justified.
- Other trackers: geissmann2017; rodriguez2018 (the abstract confirms multiple organisms in multiple arenas plus exported statistics and heat maps, so the ToxTrac walking-path checkmark holds); sridhar2019; chiara2023 (the abstract confirms correction of camera tremors and light changes, multi-arena tracking, and speed, distance and explored-surface outputs, so its table cells hold); panadeiro2021 (3 tools with calibration; 5 that track multiple unmarked animals); romeroferrero2019; walter2021 with the TRex README footnote.
- Bee and insect systems: bozek2021, bjerge2022, erdem2026 (shock-avoidance apparatus), parkinson2026acoustic (the bib DOI matches the bioRxiv; YOLO is per the repos), knauer2022.
- Detectors and tracking: zhao2024 with carion2020, lin2014, everingham2010, khanam2024, tian2025, jocher2026 and hidayatullah2026 (NMS-free), all MTAP applied refs (venue verified), cheng2024 (35.4 AP on LVIS), liu2024, the tracking-by-detection and MOT metric refs.
- Active learning and tools: settles, ren, mosqueirarey, brust, haussmann (driving datasets), kao2019, yuan, choi, yoo, sener, yang, chandra, berg, pachitariu, kellenberger (self-hostable, images), beery2019 x2, norouzzadeh2021 (over 99.5% less labelling), lorbach2019 (MTAP), goodwin2024, bohnslav2021, the Label Studio and CVAT footnotes.
- Evaluation: munjal, mittal, luth, kapoor with roberts, bouthillier, bland1986, boettiger2015.

D. TABLE CELLS STILL UNVERIFIED (already marked TODO; I did not check them)
- Tracktor: per-arena support and licence.
- EthoVision: per-arena support.
- idtracker.ai and TRex: per-arena, endpoint and retraining cells.
- SLEAP: licence.
- Bee Tracker: local deployment.
- BEEhaviourLab: per-chamber identity.
- AnimalTA "Deep detector --": the abstract says nothing either way.