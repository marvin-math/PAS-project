%main

% Clear the workspace and the screen
sca;
close all;
clear;
Screen('Preference', 'SkipSyncTests', 1)

%% Insert values

nTrials = 5; %600;
%dataSavingLocation = fullfile('/home/karla/Research/projects/iconic-memory/IM_partialReport', 'data', [whichExperiment, '_', version]); 



%% SETUP
environment = 'MarvinHome'; % Where it's run: karlaHome, behavLabBCCN, officeBCCN, samHome

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);
 % Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

subjID = input('Enter subject ID: \n','s'); %e.g. 001 002 010 099
sessionID = input('Enter session type: \n', 's'); %e.g. 'pilot', 'testing'


%% call the functions
addpath(genpath('functions')); 


% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

[env, trialData] = environmentSetup(window, windowRect, subjID, sessionID);
task = taskParameters(nTrials, env);
trial = generateTrials(window,task, sessionID);
[time, timingData] = timeParameters(window,task, trial);

%drawPAS(window, env)


for thisTrial = 1:task.nTrials
   
    [timingData, timingDataTrial] = drawToScreen(window, task, trial, thisTrial, env, time, sessionID, timingData);
    WaitSecs(1)
    [trial, exit] = responseobj(window, trial, thisTrial, task, env);
    %WaitSecs(1)
    %[trial, exit] = responsePAS(window, trial, thisTrial, task, env);    
    
    if exit
        break;
        
    end

    % Wait for a key press
    %KbStrokeWait;
    %[trial, exit] = responsePAS(window, trial, thisTrial, task);
    
    %mask(window, task)
    % Wait for a key press
    %KbStrokeWait;
    
    
    
    
end

[trialData] = saveData(trial, task, time,env, trialData, sessionID, timingData);

sca;





