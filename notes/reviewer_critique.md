# Crítica de completude (revisor simulado)

MTAP REVIEWER / COMPLETENESS CRITIQUE OF THE RELATED-WORK DRAFT (searched 2026-11-11)

=== 0. MOST SERIOUS FINDING (positioning risk) ===
- SLEAP (Pereira et al. 2022, Nat Methods, 10.1038/s41592-022-01426-1; DOI not re-checked) is missing from the text and the table. Yet its GUI already offers frame-suggestion methods very close to BeeMove's proposal criteria. Its legacy GUI guide (legacy.sleap.ai/guides/gui.html) lists four:
  - Sample (random or strided);
  - Image feature ("visually distinctive frames", i.e. diversity);
  - Prediction score (frames with more instances than expected and scores below a threshold, i.e. low confidence plus a count prior);
  - Velocity (instances that move more than usual, i.e. trajectory jumps).
  It also supports prediction-assisted labelling and retraining.
- So "proposes frames using low confidence + count prior + trajectory jumps + diversity" CANNOT be claimed as novel. A reviewer who knows SLEAP will catch it.
- Reframe the novelty around four things. Even then, state that the criteria are adapted from SLEAP-style heuristics.
  - (a) Box detection with modern Ultralytics detectors, not pose estimation.
  - (b) A per-dish count prior tied to the arena geometry (exactly one bee per dish).
  - (c) Toxicology endpoints delivered out of the box.
  - (d) A quantified, leakage-free, cross-setup evaluation of the loop against a random baseline. SLEAP never evaluated its suggestion heuristics this way.
- Cite SLEAP, and DeepLabCut itself (Mathis et al. 2018, 10.1038/s41593-018-0209-y), directly. Do not rely only on nath2019.

=== 1. MISSING WORKS / TOPICS A REVIEWER WOULD EXPECT ===
Verified by search unless marked.

Tracking-software reviews and comparable trackers:
- Panadeiro, Rodriguez, Henry, Wlodkowic & Andersson (2021), "A review of 28 free animal-tracking software applications: current features and limitations", Lab Animal 50(9):246–254, 10.1038/s41684-021-00811-1. Use it to back the feature table and the claims about the limits of free trackers.
- Sridhar, Roche & Gingins (2019), "Tracktor: image-based automated tracking of animal movement and behaviour", Methods Ecol Evol 10(6):815–820, 10.1111/2041-210X.13166. Open-source OpenCV tracker that outputs distance, speed and activity directly; a classical competitor to BeeMove.
- Geissmann et al. (2017), "Ethoscopes: an open platform for high-throughput ethomics", PLoS Biol 15(10):e2003026, 10.1371/journal.pbio.2003026. One insect per arena, low cost, open source; a close analogue for the "small lab, low cost" argument.
- Ctrax (Branson et al. 2009, Nat Methods, 10.1038/nmeth.1328; not re-verified). The classic arena-based walking-fly tracker.
- The DeepLabCut multi-animal paper (Lauer et al. 2022, Nat Methods, 10.1038/s41592-022-01443-0; not re-verified) is optional.

Bee locomotion assays measured with video tracking (strengthens the motivation):
- Charreton et al. (2015), "A locomotor deficit induced by sublethal doses of pyrethroid and neonicotinoid insecticides in the honeybee Apis mellifera", PLoS ONE, 10.1371/journal.pone.0144879. Walking deficits under thiamethoxam and pyrethroids; fipronil had no locomotor effect.
- Williamson et al. (2014), "Exposure to neonicotinoids influences the motor function of adult worker honeybees", Ecotoxicology, 10.1007/s10646-014-1279-4 (not re-verified).

Deep-learning bee and insect tracking (the reviewer will ask "why not these?"):
- Bozek, Hebert, Portugal, Mikheyev & Stephens (2021), "Markerless tracking of an entire honey bee colony", Nat Commun 12:1733, 10.1038/s41467-021-21769-1.
- Bjerge, Mann & Høye (2022), "Real-time insect tracking and monitoring with computer vision and deep learning", Remote Sens Ecol Conserv 8(3):315–327, 10.1002/rse2.245. YOLO plus tracking of insects on edge hardware; fits the MTAP edge/latency framing.
- BEEtag (Crall et al. 2015, PLoS ONE, 10.1371/journal.pone.0136487) and Boenisch et al. 2018 (Front Robot AI, 10.3389/frobt.2018.00035) are optional, for marker-based bee tracking (not re-verified).

Active learning in ecology and domain shift (directly relevant to the cross-setup claim):
- Norouzzadeh et al. (2021), "A deep active learning system for species identification and counting in camera trap images", Methods Ecol Evol 12(1):150–161, 10.1111/2041-210X.13504. AL plus detector crops, more than 99.5% label reduction; the closest ecology AL precedent besides AIDE.
- Beery, Van Horn & Perona (2018), "Recognition in Terra Incognita", ECCV, 10.1007/978-3-030-01270-0_28. Performance drops at unseen locations; it justifies leave-one-setup-out evaluation and cross-setup splits better than generic leakage papers do.

Foundation and open-vocabulary models (an MTAP reviewer in 2026 will ask "why fine-tune at all?"):
- YOLO-World (Cheng et al., CVPR 2024, pp. 16901–16911).
- Grounding DINO (Liu et al., ECCV 2024; arXiv 2303.05499).
- SAM 2 (Ravi et al., ICLR 2025; arXiv 2408.00714).
- Ideally add a zero-shot baseline row in the benchmark. At minimum, discuss these models as an alternative pre-labelling route.

Trajectory and endpoint analysis:
- McLean & Skowron Volponi (2018), "trajr: an R package for characterisation of animal trajectories", Ethology 124(6):440–448, 10.1111/eth.12739.
- Benhamou 2004 is in the reference list but never cited. Either use it, together with trajr, when defining speed, stops and tortuosity, or drop it.

Agreement statistics for the "error on locomotion metrics" claim:
- Reviewers will expect Bland–Altman analysis (Bland & Altman 1986, Lancet) and/or ICC against manual or reference trajectories. No method reference is currently given.

AL for detection, possibly missing:
- Kao et al. 2018, "Localization-aware active learning for object detection" (ACCV).
- Temporal-consistency / video AL work, to underpin the trajectory-jump criterion.
- Not verified here; search before citing.

MTAP venue fit:
- Several applied refs are said to be "in this journal". Verify which ones are actually MTAP, and add 2–3 MTAP papers on insect or animal video analytics if possible.

=== 2. CLAIMS NOT SUPPORTED BY THE REFERENCE FINDINGS ===
lima2025 (own prior work):
- "detected bees with YOLOv4": the finding says only "YOLO/Darknet, eight pretrained models". Confirm YOLOv4 from the PDF.
- "splits not built to keep frames from the same recording out of both sets" and "single detector family": the landing page alone does not support these. Self-criticism of your own prior work must be checked against the PDF.
- Mention that the same 930 images are reused. It matters for the leakage argument.
- Using lima2025 as the source for "bees as bioindicators" and "manual scoring slow/error-prone" is not in the finding. Cite primary sources instead, or verify in the PDF.

Ecotoxicology studies:
- hernandez2026, "Africanized bees": not in the finding. The finding also gives the product (Confidor 350 CS), not "imidacloprid"; state the active ingredient only once it is confirmed.
- fardergomes2024, piovesan2020, ruizsanchez2026 were checked from metadata only:
  - "comparable sublethal effects on behaviour" and "locomotor effects" are not established for piovesan or ruizsanchez;
  - "Brazilian/Neotropical" is unverified for ruizsanchez.
- "Many of these bioassays use a walk test with one bee per arena" is unsupported. tosi2017 used a vertical illuminated arena.
- "each bee placed alone in a Petri dish ... as in the Bee-Move protocol~libardoni" is unsupported. The finding says only that a walk test was analysed with Bee-Move.
- tosi2017, "later impaired motor function": the timing ("later") is not in the finding.

Classical trackers and commercial systems:
- "[ToxTrac/AnimalTA] popular in ecotoxicology ... depend on background contrast and stable lighting" is unsupported, and so is the intro line "lose accuracy when lighting, arena material or camera change". Cite Panadeiro 2021 or show it in your own experiment, e.g. run AnimalTA or Tracktor on the wood vs plastic sessions.
- "licence cost and closed pipelines ... Global South": lim2023 only compares ANY-maze and EthoVision. Cost is not supported.
- "These [bee] systems need dedicated acquisition hardware": this is unsupported for Api-TRACE (metadata only) and wrong for knauer2022, which is software. Knauer targets nesting and foraging; also cite it with its actual title ("Bee Tracker").

Annotation tools:
- "LabelImg, CVAT, Label Studio ... do not close the loop with a task-specific model" is factually weak. The Label Studio ML backend explicitly supports pre-annotation, interactive labelling, model training and active learning, including a YOLOv8 backend with video tracking. The fully automated AL loop is an Enterprise feature; Community users mimic it manually. CVAT also has model-assisted auto-annotation. Rephrase: they provide generic model hooks but no assay-specific frame proposal, endpoints or evaluated adaptation loop.

Detection and AL literature:
- haussmann2020, "pools derived from video": the finding says driving data. Acceptable, but say "large driving datasets".
- wang2020 and antonelli2022 concern few-shot detection of NOVEL classes. Using them to support fine-tuning for a domain/setup shift of the SAME class is a mismatch. Cite domain-adaptation or transfer work, or qualify the sentence.
- "Applied studies in this journal": the venue of mira2024, nnadozie2023, lee2021 and suto2023 was not given in the findings. Verify.

Reference-list issues:
- kapoor2023 is marked "not re-read"; verify before citing.
- jocher2026ultralytics appears twice; deduplicate the key.
- jocher2023ultralytics: cite it as software v8.0.0 for YOLOv8, separately from the YOLO26 paper.
- zhao2024detrs: cite the CVPR 2024 version, "DETRs Beat YOLOs on Real-time Object Detection", not only arXiv.
- tian2025yolov12: check the final venue.

=== 3. WEAK SPOTS IN POSITIONING ===
Overall:
- The novelty statement "no single tool combines all three" is fragile. SLEAP and DeepLabCut both combine a deep model, local GUI use, prediction-assisted correction and retraining. TRex 2.0 now runs Ultralytics YOLO detection, segmentation and keypoint models, per its GitHub README. So "deep detector partial" for TRex is outdated.
- The defensible gap is narrower. It is the combination of:
  - an assay-specific multi-dish pipeline with toxicology endpoints;
  - frame proposal tuned to that geometry;
  - zero-ML-expertise Docker deployment;
  - an empirical, leakage-free demonstration of how many frames it takes to adapt to a new setup, and of the effect on locomotion metrics.
  Make the evaluation, not the feature list, the main contribution.

NeuroAdaptTrainer:
- Verified: Eraso-Casas, Villarroya-Pique, Serrano-Pertierra, Fernández-Sánchez, Novelli, Rio-Alvarez & González, "NeuroAdaptTrainer: A Fiji/ImageJ plugin for YOLO-based neuron segmentation, interactive correction and transfer learning", SoftwareX 36:103150 (2026).
- It is the closest "YOLO + user correction + transfer learning in one end-user tool" precedent, but it is not in the table. Add a row.
- The contrasts are: still microscopy images vs video; segmentation vs detection plus trajectories; no reported frame-selection or AL strategy (verify in full text); no endpoint analytics.
- Do not claim it lacks AL without reading it.

DeepLabCut / SLEAP:
- The table gives DLC "Per-arena identity --". With single-animal DLC on cropped per-dish videos, that is arguably achievable, so a reviewer may contest it.
- Argue with costs instead: keypoint labelling vs one box, GPU-oriented training, no built-in pesticide endpoints, multi-dish handling left to the user. The SLEAP row (see section 0) needs to be added honestly. User fine-tuning / AL should be ✓ or at least partial.

AIDE:
- Table says "Local/offline partial". AIDE is self-hostable and its docs suggest Docker deployment, so it is likely ✓ (verify).
- The real contrast is image-level tooling vs a video plus trajectory plus endpoint pipeline, and AIDE's server/multi-user orientation vs a single-lab desktop tool.

Bee Tracker (Knauer 2022, 10.1002/ece3.8575):
- It is cited in the text but absent from the table, and it is the most obviously "bee + open-source ML video" competitor. Add a row.
- Distinguish it by behaviour (nest occupancy and foraging of solitary bees at nest boxes vs walking in a dish) and by the absence of a fine-tuning loop (verify).

EthoVision XT:
- Noldus documents deep-learning body-point detection since version 16, extended in versions 17 and 17.5. It is for rodents only and needs a GPU. "Deep detector partial" is therefore defensible; add the footnote "rodent-only DL module".

Table cells:
- ToxTrac and AnimalTA open-source status is still unverified.
- Lima et al. "Local/offline --" and "Open source --" need confirming; otherwise they look like strawmanning your own work.
- Consider adding "CPU-only inference" and "No ML expertise required" columns, where BeeMove differs most clearly.

Evaluation framing:
- Add a cross-setup comparison against a classical tracker (AnimalTA or Tracktor) on the same wood/plastic sessions. Without it, the claim "classical trackers break down" is unsupported.
- Consider a zero-shot open-vocabulary baseline (YOLO-World or Grounding DINO), to justify the need for AL.

Sources: legacy.sleap.ai/guides/gui.html; api.crossref.org/works/10.1016/j.softx.2026.103150; labelstud.io/guide/ml; github.com/mooch443/trex; noldus.com (EthoVision XT 17 "what's new"); plus the DOI landing and index pages for each work verified above.