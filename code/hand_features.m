
function F = hand_features(B)

stats = regionprops(B,'Area','ConvexArea', 'Circularity');

%% calculate the ratio of length to area
len = stats(1).Area / stats(1).ConvexArea;

%% get the circularity of the object
circularities = stats(1).Circularity;

%% concatenate
F = cat(2, len, circularities);
return


