function [env, trialData] = environmentSetup(window, windowRect, subjID, sessionID, environment)

%% Paths and data saving

% Subj ID & Paths


% Make file ID and directory and output file
env.subID = subjID;
env.fileID = ['SUB_', subjID, '_', num2str(sessionID)];
env.fileName = [env.fileID, '_', num2str(sessionID)];
%env.fileDir = fullfile('C:\Users\marvi\Documents\MATLAB\Masterarbeit\data', env.fileID);
env.fileDir = fullfile(pwd, 'data', env.fileID);
%env.ImageFolderLocation = fullfile('C:\Users\marvi\Documents\MATLAB\Masterarbeit\images\Rastergrafik.png');
env.ImageFolderLocation = fullfile(pwd, 'Rastergrafik.jpg');

if ~exist(env.fileDir,'dir')
    mkdir(env.fileDir);
end
env.outFile = fullfile(env.fileDir,[env.fileName, '.mat']);
if exist(env.outFile)>0
    error('Log file already exists! Select different subject number or session type.')
end

 %%
% Get the size of the on screen window
[env.screenXpixels, env.screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window
[env.xCenter, env.yCenter] = RectCenter(windowRect);

% Create a table for storing data
varNames = {'trial', 'SUB_ID', 'condition', 'corrStim', 'respStim', ...
    'PASresp', 'PracticeTrials', 'RTobj', 'RTpas'};
varTypes = {'double', 'double' 'string', 'double', 'double', 'double', 'double', 'double', 'double'};
size = [0, length(varNames)];
trialData = table('Size', size, 'VariableTypes', varTypes, 'VariableNames', varNames);
 
%% Define the environment
% Monitor settings for each environment
switch environment
    
    case 'MarvinHome'
        env.distFromScreen = 60;  % Manually enter distance in cm
        env.screenSize = [65, 29.9] ; % Manually enter screen size [x, y] in cm
        
    case 'officeBCCN'
        env.distFromScreen = 97; % Manually enter distance in cm
        env.screenSize = [52, 32.5]; % Manually enter screen size [x, y] in cm
    
end

% %% screen / monitor settings
% % Get monitor info
% env.whichScreen = max(Screens);
% screenInfo = Screen('Resolution', env.whichScreen);
% env.screenRes = [screenInfo.width, screenInfo.height];
% env.screenPixelSize = screenInfo.pixelSize; % color depth of a pixel in bits (bits per pixel, not spatial size)
% env.screenRefreshRate = screenInfo.hz;
% env.screenCenter = [env.screenRes(1)/2, env.screenRes(2)/2];

end