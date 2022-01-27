
function B = hand_extract(I)

if (nargin<1)
  error('This function requires an image as input');
end
if (isa(I,'uint8'))
  I = double(I(:,:,1))/255;
end

%% result of the thresholding
threshold = hand_threshold(I); 

%% scaling the threshold
threshK = 0.20;
thresh = threshK * threshold;
    
%% getting those that are above the threhold
I = I > thresh;

%% perform hit or miss for cleaning the image
    
% structuring element
t1 = ones(10, 7);

% set
set =  t1;

% unset
unset = imcomplement(set);

% image complement
IC = imcomplement(I);

% erosion 
erosion1 = imerode(I, set);
erosion2 = imerode(IC, unset);
I = erosion1 & erosion2;

%% perform dilation for cleaning the image, se = t1;
I = imdilate(I, t1);

%% perform closing of the narrow regions , se = disk;
t2 = strel('disk', 5);
I = imclose(I, t2);

%% filling the holes in the image
I = imfill(I, 'holes');

%% labelling the hand region
B = bwlabel(I);
return
