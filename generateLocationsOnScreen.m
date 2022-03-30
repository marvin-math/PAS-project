function [rectDestinations, cueDestinations, respDestinations] = generateLocationsOnScreen(env, task, nPoints)
% Calculates locations of stimuli and cues.
% These remain constant througout the block.
% Locations only vary with nPoints and task.stimRadius (which is
% usually constant).

%% Determine middle of the screen in pixels
xCenter= env.screenCenter(1);
yCenter= env.screenCenter(2);

%% Calculate nPoints number of angles where stimuli will be shown.
degreePoints = 360 / nPoints;
startPos = degreePoints / 2; % offset from cardinal orientations
endPos = startPos + (degreePoints * (nPoints - 1) ); 
anglesDeg = startPos : degreePoints : endPos; % Count from 0 to 360 in increments of degreePoints (equivalent to np.arrange)
angles = (anglesDeg * pi) / 180; % Convert to points of circle in radians

%% Calculate locations as (x,y) coordinates
rectLocation = zeros(nPoints, 2);
cueDestinations = zeros(nPoints, 2);
for x =1:length(angles) % For each angle
    deg = angles(x);
    
    % posRadial will give x and y coordinates on the circle defined by
    % task.stimRadius. posRadial will be in the same units as
    % task.stimRadius is.
    posRadial_x = task.stimRadiusPixels * cos(deg); % x-coordinate
    posRadial_y = task.stimRadiusPixels * sin(deg); % y-coordinate
    
    % posRadialCue will calculate the x and y coordinate of where the cue
    % line needs to end, defined by a radius of a smaller circle than the
    % radius of the stimulus circle.
    posRadialCue_x = (task.cueRadiusPixels - 1) * cos(deg);
    posRadialCue_y = (task.cueRadiusPixels - 1) * sin(deg);
    
    % rectLocation is a matrix (nPoints, 2) with (:,1) being x-coordinates
    % and (:, 2) being y-coordinates of stimuli locations.
    % We need to offset the calculated location to center them at screen
    % center rather than at 0,0 (which is uppper left of the screen in PTB)
    rectLocation(x, 1) = posRadial_x + xCenter;
    rectLocation(x, 2) = posRadial_y + yCenter;
    
    % cueDestination is a matrix (nPoints, 2) with (:,1) being x-coordinates
    % and (:, 2) being y-coordinates of cue ending locations.
    cueDestinations(x, 1) = posRadialCue_x + xCenter;
    cueDestinations(x, 2) = posRadialCue_y + yCenter;
    
end

%% Convert (x,y) coordinates into rectangles (x-up-left, y-up-left,
% x-down-right, y-down-right)

% Make a base destination rectangle
baseRect = [0 0 task.stimWidthPixels task.stimHeightPixels];

% Next center the rect on a particular location of the screen.
rectDestinations = zeros(nPoints, 4);
for x =1:length(rectDestinations) % For each location
    positionX = rectLocation(x, 1);
    positionY = rectLocation(x, 2);
    rectDest = CenterRectOnPointd(baseRect, positionX, positionY);
    
    rectDestinations(x, :) = rectDest;
    
end

%% Calculating Locations and size of response stimuli

respDestinations = zeros(task.nResp, 4);

% resp displayed at 6/10th of the screen
posRespY = yCenter + 1/10*env.screenSize(2);

% calculate positions such that stimuli are seperated by 1 radius
ptRespEdgeX = xCenter - task.stimWidthPixels*2*3.5;
posRespX = zeros(task.nResp);
for x = 1:task.nResp
    posRespX(x) = ptRespEdgeX + (x-1)*task.stimWidthPixels*2*2;
    respDestinations(x, :) = [posRespX(x), posRespY, posRespX(x)+task.stimWidthPixels*2, posRespY+task.stimHeightPixels*2];
end

end