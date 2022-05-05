function task = taskParameters(trialnum, env, sessionID, nTestTrials)

task.nTrials = trialnum;
task.nTrialsPractice = nTestTrials;

task.screenColour = 0.5; % [169, 169, 169]; %

% CIRCLE
% Make a base Rect of 200 by 250 pixels
task.baseRect = [0 0 250 250];

% For Ovals we set a miximum diameter up to which it is perfect for
task.maxDiameter = max(task.baseRect);

% Center the rectangle on the centre of the screen
task.centeredRect = CenterRectOnPointd(task.baseRect, env.xCenter, env.yCenter-325);

% Set the color of the rect to red
task.rectColor = [0 0 0];

%penWidth
task.penWidthPixels = 3;

%SQUARE
% Make a base Rect of 200 by 200 pixels
task.baseRect_square = [0 0 200 200];

% Screen X positions
task.squareXpos = env.screenXpixels * 0.25;


% Set the colors to Red, Green and Blue
task.Color = [0 0 0];

% Make our rectangle coordinates
task.centeredRect_square = CenterRectOnPointd(task.baseRect_square, env.xCenter-300, env.yCenter+200);

% Pen width for the frames
task.penWidthPixels_square = 3;

%TRIANGLE
% Number of sides for our polygon
task.numSides = 3;

% Angles at which our polygon vertices endpoints will be. We start at zero
% and then equally space vertex endpoints around the edge of a circle. The
% polygon is then defined by sequentially joining these end points.
task.anglesDeg = linspace(0, 360, task.numSides+1);
task.anglesRad = task.anglesDeg * (pi / 180);
task.radius = 150;

% X and Y coordinates of the points defining out polygon, centred on the
% centre of the screen
task.yPosVector = sin(task.anglesRad) .* task.radius + env.yCenter+200;
task.xPosVector = cos(task.anglesRad) .* task.radius + env.xCenter + 300;



task.penWidthPixels_tri = 3;

%DIAMOND
% Number of sides for our polygon
task.numSides_d = 4;

% Angles at which our polygon vertices endpoints will be. We start at zero
% and then equally space vertex endpoints around the edge of a circle. The
% polygon is then defined by sequentially joining these end points.
task.anglesDeg_d = linspace(0, 360, task.numSides_d+1);
task.anglesRad_d = task.anglesDeg_d * (pi / 180);
task.radius_d = 150;

% X and Y coordinates of the points defining out polygon, centred on the
% centre of the screen
task.yPosVector_d = sin(task.anglesRad_d) .* task.radius_d + env.yCenter;
task.xPosVector_d = cos(task.anglesRad_d) .* task.radius_d + env.xCenter;

% Set the color of the rect to red
task.diColor = [0 0 0];

% Cue to tell PTB that the polygon is convex (concave polygons require much
% more processing)
%isConvex = 1;

task.penWidthPixels_di = 3;

%% mask
task.centeredRect_m = CenterRectOnPointd(task.baseRect, env.xCenter, env.yCenter);
task.centeredRect_square_m = CenterRectOnPointd(task.baseRect_square, env.xCenter, env.yCenter);
task.yPosVector_m = sin(task.anglesRad) .* task.radius + env.yCenter;
task.xPosVector_m = cos(task.anglesRad) .* task.radius + env.xCenter;
task.yPosVector_d_m = sin(task.anglesRad_d) .* task.radius_d + env.yCenter;
task.xPosVector_d_m = cos(task.anglesRad_d) .* task.radius_d + env.xCenter;

%% PAS CONFIG
task.PASnResp = 4;

% COlour for pas scale
task.PASlineColour = [0 0 0];

% Colour for PAS selection
task.PASselectColour = [1 1 0];

% COORDINATES
% Make a base Rect of 200 by 200 pixels
baseRect_square = [0 0 600 1];
respRect_1 = [0 0 1 50];
    
% Make PAS coordinates
task.PAS_line = CenterRectOnPointd(baseRect_square, env.xCenter, env.yCenter);
task.PASrespLine1 = CenterRectOnPointd(respRect_1, env.xCenter-300, env.yCenter);
task.PASrespLine2 = CenterRectOnPointd(respRect_1, env.xCenter-100, env.yCenter);
task.PASrespLine3 = CenterRectOnPointd(respRect_1, env.xCenter+100, env.yCenter);
task.PASrespLine4 = CenterRectOnPointd(respRect_1, env.xCenter+300, env.yCenter);
task.PASresponses = [task.PASrespLine1; task.PASrespLine2; task.PASrespLine3; task.PASrespLine4];

%% OBJECTIVE TASK CONFIG
task.ObjnResp = 4;

% Colour for objective task stimuli
task.ObjTaskColour = [0 0 0];

% Colour for objective task selection
task.ObjSelectColour = [1 1 0];

% COORDINATES AND SHAPES

% CIRCLE
% Make a base Rect of 200 by 250 pixels
task.baseRect_r = [0 0 100 100];
task.baseRect_obj_r = [0 0 200 200];
% For Ovals we set a miximum diameter up to which it is perfect for
task.maxDiameter = max(task.baseRect_r);
% Center the rectangle on the centre of the screen

% SQUARE
%Square
% Make a base Rect of 200 by 200 pixels
task.baseRect_square_r = [0 0 100 100];
% Screen X positions of our three rectangles
task.squareXpos_r = env.screenXpixels * 0.25;
% Pen width for the frames
task.penWidthPixels_square_r = 3;

% TRIANGLE
% Angles at which our polygon vertices endpoints will be. We start at zero
% and then equally space vertex endpoints around the edge of a circle. The
% polygon is then defined by sequentially joining these end points.
task.anglesDeg_r = linspace(0, 360, task.numSides+1);
task.anglesRad_r = task.anglesDeg_r * (pi / 180);
task.radius_r = 75;
task.penWidthPixels_tri_r = 3;

% DIAMOND
% Angles at which our polygon vertices endpoints will be. We start at zero
% and then equally space vertex endpoints around the edge of a circle. The
% polygon is then defined by sequentially joining these end points.
task.anglesDeg_d_r = linspace(0, 360, task.numSides_d+1);
task.anglesRad_d_r = task.anglesDeg_d_r * (pi / 180);
task.radius_d_r = 75;
task.penWidthPixels_di_r = 3;

% something here seems to be used somewhere else and thus needed, so don't
% delete
task.centeredRect_r = CenterRectOnPointd(task.baseRect_r, env.xCenter+600, env.yCenter);
%task.centeredRect_r2 = CenterRectOnPointd(task.baseRect_r, env.xCenter+200, env.yCenter);
%task.centeredRect_r3 = CenterRectOnPointd(task.baseRect_r, env.xCenter-200, env.yCenter);
%task.centeredRect_r4 = CenterRectOnPointd(task.baseRect_r, env.xCenter-600, env.yCenter);
task.centeredRect_square_r = CenterRectOnPointd(task.baseRect_square_r, env.xCenter+200, env.yCenter);
task.yPosVector_r = sin(task.anglesRad_r) .* task.radius_r + env.yCenter;
task.xPosVector_r = cos(task.anglesRad_r) .* task.radius_r + env.xCenter-600;
task.triangle = [task.xPosVector_r; task.yPosVector_r]';
task.yPosVector_d_r = sin(task.anglesRad_d_r) .* task.radius_d_r + env.yCenter;
task.xPosVector_d_r = cos(task.anglesRad_d_r) .* task.radius_d_r + env.xCenter-200;
task.diamond = [task.xPosVector_d_r; task.yPosVector_d_r]';

%actual objective response positions
task.ObjRespCircle = CenterRectOnPointd(task.baseRect_obj_r, env.xCenter+600, env.yCenter);
task.ObjRespSquare = CenterRectOnPointd(task.baseRect_obj_r, env.xCenter+200, env.yCenter);
task.ObjRespDiamond = CenterRectOnPointd(task.baseRect_obj_r, env.xCenter-200, env.yCenter);
task.ObjRespTriangle = CenterRectOnPointd(task.baseRect_obj_r, env.xCenter-600, env.yCenter);
task.ObjResponses = [task.ObjRespTriangle; task.ObjRespDiamond; task.ObjRespSquare; task.ObjRespCircle];

%% CONDITIONS
switch sessionID
    case 'narrowlow'
        task.stimdur_narrowlow = [0.016, 0.048, 0.08];%[0.016, 0.032, 0.048, 0.064, 0.08, 0.096, 0.112, 0.128, 0.144, 0.16, 0.176, 0.192, 0.208, 0.224, 0.24, 0.256, 0.272, 0.288, 0.304, 0.32];
        task.stimdur_narrowlow_complete = repelem(task.stimdur_narrowlow, 200); %no hard coding! this should be repeated depending on how many trials there will be
        task.stimdur_narrowlow_shuffled = Shuffle(task.stimdur_narrowlow_complete);
        task.stimExpTimesNarrowlow = task.stimdur_narrowlow_shuffled;
        task.randElem = randi(length(task.stimExpTimesNarrowlow)-task.nTrialsPractice);
        task.PracticeNarrowlow = task.stimExpTimesNarrowlow(task.randElem:task.randElem+task.nTrialsPractice-1);
    case 'wide'
        task.stimdur_wide = [0.016, 0.08, 0.144];
        task.stimdur_wide_complete = repelem(task.stimdur_wide, 200); %no hard coding! this should be repeated depending on how many trials there will be
        task.stimdur_wide_shuffled = Shuffle(task.stimdur_wide_complete);
        task.stimExpTimesWide = task.stimdur_wide_shuffled;
        task.randElem = randi(length(task.stimExpTimesWide)-task.nTrialsPractice);
        task.PracticeWide = task.stimExpTimesWide(task.randElem:task.randElem+task.nTrialsPractice-1);
    case 'narrowhigh'
        task.stimdur_narrowhigh = [0.08, 0.112, 0.144];%[0.016, 0.032, 0.048, 0.064, 0.08, 0.096, 0.112, 0.128, 0.144, 0.16, 0.176, 0.192, 0.208, 0.224, 0.24, 0.256, 0.272, 0.288, 0.304, 0.32];
        task.stimdur_narrowhigh_complete = repelem(task.stimdur_narrowhigh, 200); %no hard coding! this should be repeated depending on how many trials there will be
        task.stimdur_narrowhigh_shuffled = Shuffle(task.stimdur_narrowhigh_complete);
        task.stimExpTimesNarrowhigh = task.stimdur_narrowhigh_shuffled;
        task.randElem = randi(length(task.stimExpTimesNarrowhigh)-task.nTrialsPractice);
        task.PracticeNarrowhigh = task.stimExpTimesNarrowhigh(task.randElem:task.randElem+task.nTrialsPractice-1);
    case 'narrowMOA'
        task.MOA_narrow = [0.016, 0.032, 0.048, 0.064, 0.08, 0.096, 0.112, 0.128, 0.144, 0.16, 0.176, 0.192, 0.208, 0.224, 0.24, 0.256, 0.272, 0.288, 0.304, 0.32];
        task.MOA_narrow_complete = repelem(task.MOA_narrow, 30); %no hard coding! this should be repeated depending on how many trials there will be
        task.MOA_narrow_shuffled = Shuffle(task.MOA_narrow_complete);
        task.MOAnarrow = task.MOA_narrow_shuffled;
        task.randElem = randi(length(task.MOAnarrow)-task.nTrialsPractice);
        task.PracticeMOAnarrow = task.MOAnarrow(task.randElem:task.randElem+task.nTrialsPractice-1);
end

task.BlockSize = 75;
task.breaknr = [task.BlockSize+task.nTrialsPractice, task.BlockSize*2+task.nTrialsPractice, task.BlockSize*3+task.nTrialsPractice, task.BlockSize*4+task.nTrialsPractice, task.BlockSize*5+task.nTrialsPractice, task.BlockSize*6+task.nTrialsPractice, task.BlockSize*7+task.nTrialsPractice];

% Fonts and environment setup
task.fontsizeInstruction = 1; % Font size for instructions [deg of visual field]
task.fixRadius = 0.25; % Radius of fixation dot [deg of visual field]

%% Visual setup

% Stimulus array
task.stimRadius = 5; % Distance of items from fix [deg of visual field]

% Size of stimulus image
task.stimHeight = 1.2;
task.stimWidth = 1.2; 

% Cue
task.cueRadius = 4; % Distance of cue from fix [deg of visual field]
task.cueWidth = 5; % Must be between [1:7] --> why this exact range only PTB knows

% Response probe
task.responseProbeWidth = 2; % Size of response probe in deg of visual field
task.responseProbeHeight = 2; % Size of response probe in deg of visual field
task.nResp = 4;
task.respCorrectProp = 0; %for objectiveResponse, when 0 equal proportion of correct and incorrect stim, otherwise 0.01-1 of response trials will contain correct response

end