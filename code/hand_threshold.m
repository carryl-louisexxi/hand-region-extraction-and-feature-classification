
function T = hand_threshold(I)

if (isa(I,'uint8'))
  I=double(I)/255;
end

%% initial t : initial estimate of the overall average image intensity
T = (min(min(I)) + max(max(I)))/2;

%% covergence criterion 
deltaT = 0.001;

%% condition for the loop
done = false;

%% looping
while ~done
    g = I >= T; %checking which indexes are above or lesser than initial threshold
    
    currentT = (mean(I(g)) + mean(I(~g))) / 2; %formula for isothresh 
    
    done = abs(T - currentT) < deltaT; %break loop if T and currentT is equal or has little difference, return  T;
    
    T = currentT;
end


