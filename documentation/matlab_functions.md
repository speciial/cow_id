# MATLAB Functions

## Feature Detection and Extraction

https://uk.mathworks.com/help/vision/ug/local-feature-detection-and-extraction.html

Local features within images are patterns or distinct structures such as points, edges or images patches. These features differ from their immediate surroundings by texture, color or intensity but they hold no information as to what they represent. Local features are mainly used either for image stiching or as means of compact representation.

Good features include edges, __blobs__ and regions. They have these properties:
- Repeatable detections
- Distinctive
- Localizable

__Detection__: finding unique patterns in images for further processing

__Extraction__: computing a descriptor on a region around the detected feature, often represented by compact vector 

## Detection Funtions

- FAST
- Minimum eigenvalue algorithm
- Corner detector
- SURF
- KAZE
- BRISK
- MSER
- ORB