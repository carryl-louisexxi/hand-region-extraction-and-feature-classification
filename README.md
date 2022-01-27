# hand-region-extraction-and-feature-classification

Exercise 4A – ( 3% ) – Hand Region Extraction

We modify:
First, the hand_threshold function and make it be able to calculate the threshold of the binary image using the isothresh. Here, we do the following:

•	Compute the initial estimate of the overall image intensity
•	Initialize a variable with preferred convergence criterion
•	We do loop: check which indexes are above or lesser than the initial threshold, we then implement the isothresh formula, if the result of the isothresh is equal or has little difference to the initial estimate then return the initial estimate; if not then keep on looping up until the said condition is satisfied. 

Second, we modify the hand_extract function and make it be able to extract the hand gesture region from the binary image. Here, we do the following: 

•	Get the result of the thresholding using the hand_threshold function.
•	Scale the threshold (as suggested) to deal with the shadows in the palm.
•	We threshold the image – get those that are above the threshold. 
•	Perform hit or miss. 
•	Perform dilation for cleaning the image.
•	Perform closing of the narrow regions.
•	Fill the holes using ‘imfill’.
•	Label the hand region.

The resulting image:
Figure 1. Rock
![image](https://user-images.githubusercontent.com/69174836/151282640-8d69ad70-6400-40ef-b00d-8ce228b491db.png)


Figure 2. Paper
![image](https://user-images.githubusercontent.com/69174836/151282695-bb56c0f2-3026-415b-b582-8d0d0e8d7e00.png)


Figure 3. Scissor
![image](https://user-images.githubusercontent.com/69174836/151282720-efdaa9cc-27f9-4d63-ac91-11d43b71af10.png)


Comments:
The above process makes us able to come up with clean hand region. As we see, the corresponding binary image contain one connected region. One drawback of my cleaning process is that the resulting image looks a bit bigger than the original binary image. I think we can get a better result if we use a structuring element that is better fit for the image.


Exercise 4B – (4%) – Feature Classification

We modify the:

Hand_features function and make it able to obtain the feature measurement of the image using the suggested method (regionprops). This feature measurements is used to know the varying hand gestures (rock, paper, scissors) which could be used for the classification.  Here, we do the following:

•	Using the region props we calculate the ratio of the length to area and get the circularity of the object.
•	We then concatenate the resulting measurements. 

The resulting scatterplot and classification percentage:
![image](https://user-images.githubusercontent.com/69174836/151282853-4e9d2cbc-acd8-40c7-8fbc-e9ffcdaca460.png)

Comments:
As we see, we are able to get 218/244 correct matching which is basically over 85%. This implies that our algorithm for obtaining the feature measurements and the feature extraction works and is reasonable. I believe, we could achieve a better result if we improve our calculation of the feature measurements such as every class image must vary greatly from one another. 


Exercise 4C - (4%) – Signature Classification

Boundary signature classification is another type of classification method. It involves converting each object boundary into a 1D set of values representing the boundary contour as a function of distance and angle. Here, we are going to modify a function needed for this classification namely hand_signature. This function needs to estimate the boundary signature of the binary image obtained from the hand_extract. Given below is the process done (based from the suggested algorithm).

•	We use the regionprops to get the centroid.
•	Get the boundaries of the image.
•	Calculate the center of the image.
•	Calculate the outer boundaries.
•	Calculate the boundary coordinates.
•	Calculate the points centered on the centroid using the formula given.
•	Rotate the coordinates based on a given angle. 

Result using the signature_test script – testing.
![image](https://user-images.githubusercontent.com/69174836/151282884-b2902472-fc46-4d83-98ce-6a5a4e78430c.png)

Result using the signature_classify script.
![image](https://user-images.githubusercontent.com/69174836/151282933-610b36ec-e743-4936-a91e-84462d881992.png)


Comments:
As we see, we are able to get 94.9% final match score. This implies that our algorithms (hand signatures and hand_extract) works. The result also indicates that ‘Signature Classification’ is much better than ‘Feature Classification’ as it allows to differentiate more the image structure.  It is worth noting that one drawback here is that the corresponding signatures looks a little different with the example given on the pdf. I believe this factor does not affects the performance of the matching. 
