
function S = hand_signature(B)
%% centroid
stats = regionprops(B, 'Centroid');

%% boundaries
boundary = bwboundaries(B);

for k=1:length(stats)
 
    centroid = stats(k).Centroid; %center
    
    bound = boundary(k); %outer boundary
    
    % boundary coordinates
    x = bound{1,1}(:,2); 
    y = bound{1,1}(:,1); 
    
    %points centered on the centroid
    subx = x-centroid(1);
    suby = y-centroid(2);
    
    xy = [subx, suby];
end

%% rotated coordinates: based on a given angle
for a=0:359
	rotationMatrix = [cosd(a), -sind(a); sind(a), cosd(a)];
	xyRotated = xy * rotationMatrix;
    
    %find the x coordinates that is close to zero
    xx = xyRotated(:, 1);
    yy = xyRotated(:, 2);
    
    % if the xx is the same as the centroid: check for its position
    cx = round(xx) ==  0; 
    
    % get the y coordinate for the xx that has the same point as the centroid
    cy = yy(cx);
    
    % get the max cy
    maxim = max(cy);
    
    if maxim >= 0
        S(1, a+ 1) = maxim;
    else
        S(1, a + 1) = 0;
    end
    
end

return
