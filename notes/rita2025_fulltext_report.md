Lima et al. 2025, RITA. I read the full text. PDF from https://seer.ufrgs.br/index.php/rita/article/download/143502/94909/649388, saved to /tmp/claude-1000/-home-marlon-marcon-workspace-Bee-tracker/12460409-83b2-46d3-83b6-bfcbe6892da6/scratchpad/rita/paper.pdf, text extracted with pdftotext to the same folder as paper.txt.

BIBLIOGRAPHIC (checked against Crossref)
- Title: "Analyzing Bee Behavior Through Video Tracking Using Computer Vision Techniques".
- Authors: Ian Carlos Rocha Lima, André Roberto Ortoncelli, Michele Potrich, Marlon Marcon (corresponding author), all at UTFPR.
- Venue: RITA vol. 32, no. 1, pp. 280-286, 2025. Crossref published date 2025-02-20.
- License: CC BY-NC-ND 4.0.
- Crossref lists the second author's family name as "Roberto Ortoncelli". Check how the existing .bib entry handles this.
- The PDF prints "Received: 23/10/2024, Accepted: 16/01/2024". That accepted date is earlier than the received date, so it is a typo in the PDF.

DETECTORS
- Framework: YOLO/Darknet, architectures taken from the AlexeyAB/darknet repository.
- Eight pretrained backbones/weights were fine-tuned (Table 2, convolutional layers in brackets):
  1. csdarknet53-omega.conv.105 "darknet-omega" [105]
  2. yolov4-p5.conv.232 [232]
  3. yolov4-p6.conv.289 [289]
  4. yolov4.conv.137 [137]
  5. yolov4-tiny.conv.29 [29]
  6. yolov7-tiny.conv.87 [87]
  7. yolov7.conv.132 [132]
  8. yolov7x.conv.147 [147]
- Training: 6,000 iterations each on 600 training images. The paper also says "six thousand epochs", which is inconsistent.
- Single class (bee).
- No input network size, batch size or other hyperparameters are reported.
- After comparison, the authors kept the top four by mAP for further study: yoloV4-p5, darknet-omega, yoloV4, yoloV7-tiny. YOLOv4 was chosen as best: fewest wasted detections and best video results. YOLOv7-tiny had high TP but many FP, which "generated inconsistencies in the route illustrations and heat map".

METRICS (Table 3)
- Settings: mAP at IoU 0.5; TP/FP/FN at the 0.25 Darknet default threshold. 1080 possible detections in the test set.
- No precision, recall, F1, mAP@0.5:0.95, speed/FPS or tracking metrics (MOTA, IDF1, etc.) are reported.

| Model | mAP | TP | FP | FN | Total detections |
|---|---|---|---|---|---|
| darknet-omega | 93.92% | 992 | 49 | 88 | 1988 |
| yoloV4-p5 | 93.29% | 966 | 69 | 114 | 1798 |
| yoloV4-p6 | 72.85% | 484 | 18 | 596 | 3526 |
| yoloV4 | 95.03% | 1013 | 36 | 67 | 1275 |
| yoloV4-tiny | 92.96% | 1020 | 81 | 60 | 1463 |
| yoloV7-tiny | 93.16% | 1018 | 123 | 62 | 2262 |
| yoloV7 | 90.70% | 1011 | 99 | 69 | 1474 |
| yoloV7-X | 88.51% | 930 | 99 | 150 | 2306 |

- Inconsistency: the Introduction and Conclusion say accuracy "up to 94.14%", but Table 3's best mAP is 95.03%. No 94.14% figure appears in any table. Cite the 95.03% mAP@0.5 from Table 3, not 94.14%.
- "Total of Detections" is larger than TP+FP for every model. It is not explained.

DATASET AND SPLIT
- 24 videos from the university's Biological Control group, each 10 min long.
- One bee per video, in a Petri dish. Treatment (material applied) varied by experiment.
- Recorded with smartphone cameras about 30 cm from the dish.
- Split by video: 7 videos kept for qualitative validation only, 17 used for quantitative work (labelled frames for train/val/test).
- Augmentation: synthetic mosaic videos tiling 4, 9 or 16 single-bee environments. The 9-bee mosaics use nine distinct 60 s excerpts; the 16-bee mosaics use 16 overlapping 60 s segments.
- Leakage control stated: the same video is not used in different sets, even inside mosaics.
- Table 1 (videos / bees per video / duration / frames / train / val / test):
  - Training block: 14/1/10:00/480/430/50/0; 4/4/1:30/120/90/30/0; 3/9/1:00/90/60/30/0; 1/16/1:00/30/20/10/0.
  - Testing block: 3/1/10:00/90/0/0/90; 2/4/1:30/60/0/0/60; 1/9/1:00/30/0/0/30; 1/16/1:00/30/0/0/30.
  - Total: 29 videos (including mosaics), 930 frames = 600 train / 120 val / 210 test.
- Frames were a selected subset per video. The selection rule (random or uniform) is not stated.
- Labelling: bounding boxes drawn in ImgLab (free web tool), exported as YOLO txt.
- Not stated: frame resolution, FPS, bee species. Species does not appear in the paper; the only species name is in a reference title (Scaptotrigona postica, ref [3]).

ASSAY
- Lab toxicology/behaviour setting: non-target effects of agricultural/biological control agents on bees.
- One isolated bee per Petri dish. Multi-bee scenes exist only as synthetic mosaics.

TOOL OUTPUTS
- Per-frame bounding-box centroid. A heat map accumulates counts within an 8-pixel radius of each centroid and is rendered with matplotlib.
- Walking/movement map coloured blue to red over time.
- Behavioural metrics: percentage of area explored, time spent moving, speed. Distance travelled is mentioned in the Introduction and Conclusion.
- No explicit tracker or identity association is described. It is detection plus centroid per frame, with one bee per arena.
- Figures 6 and 7 compare heat and walking maps from YOLOv4, YOLOv7-tiny, YOLOv4-p5 and darknet-omega on a 4-bee mosaic.

CODE / DEPLOYMENT
- Code: https://github.com/ICDI/bee-tracking (HTTP 200 when I checked).
- Data: no data availability statement.
- Deployment: the paper calls it a "tool"/"interface"/"script" that produces graphs and reports. It does not say whether it is desktop, web or local, and has no GUI or usability description.
- No hardware or runtime reported. Jetson and Raspberry Pi accelerators appear only in the background section.

LIMITATIONS STATED BY THE AUTHORS
1. Shadows and light reflections cause FN/FP (Fig. 4). They recommend a recording protocol that controls lighting.
2. Footage covered only isolated bees in Petri dishes, so interactions between bees could not be analysed. They propose extending the tool to real multi-bee videos.
3. None of the networks were designed for this problem. They suggest a task-specific network and other YOLO versions.
4. No evaluation of the tool by bee experts/researchers yet. They propose gathering expert feedback on reports and new features.

GAPS BEEMOVE CAN ADDRESS (my inference from the above, not stated by the authors)
- No tracker or identity handling; no MOT metrics.
- Only 930 frames from 17 videos, with mosaics as the only multi-bee data.
- Species, resolution, FPS and hyperparameters unreported.
- No speed or latency benchmarks.
- No validated behavioural endpoints against manual scoring.
- No GUI or usability study.
- Old Darknet-only models (YOLOv4/v7).
- The 94.14% vs 95.03% inconsistency means the 95.03% table value is the one to cite.

I did not open or edit any file in /home/marlon-marcon/workspace/BeeMove_Overleaf. This report comes only from the PDF.