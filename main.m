%main


% Clear the workspace and the screen
sca;
close all;
clear;
Screen('Preference', 'SkipSyncTests', 1)

%% Insert values

nTrials = 600;
nTestTrials = 20;
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
sessionID = input('Enter session type: \n'); %e.g. 'pilot', 'testing'
dataSaveMode = input('save data?: \n');


%% call the functions
addpath(genpath('functions')); 


% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);
HideCursor(window);

[env, trialData] = environmentSetup(window, windowRect, subjID, sessionID, environment);
task = taskParameters(nTrials, env, sessionID, nTestTrials);
trial = generateTrials(task, sessionID);
[time, timingData] = timeParameters(window,task, trial, sessionID);

%drawPAS(window, env)
instructions(env, window, task)


for thisTrial = 1:length(trial) 
    if ismember(thisTrial, task.breaknr)
        countdown1(env, window, time, thisTrial, task)   
    end
    
    if thisTrial == nTestTrials+1
        screen6 = ['The practice section is now over. \n\n\n' ...
            'Feel free to ask questions about the task if you have any!\n\n\n' ...
            'If not, press any key to start the experiment.'];
        DrawFormattedText(window, screen6, 'center', 'center', [0 0 0]);
        Screen('Flip', window);
        [~, ~, ~] = KbStrokeWait;
    end

    [timingData, timingDataTrial] = drawToScreen(window, task, trial, thisTrial, env, time, sessionID, timingData);
    %WaitSecs(1)
    [trial, exit] = responseobj(window, trial, thisTrial, task, env);
    if exit
        break;
    end
    
    %WaitSecs(1)
    [trial, exit] = responsePAS(window, trial, thisTrial, task, env);    
    
    if exit
        break; 
    end

end

switch dataSaveMode
    case 1
        [trialData, timingData] = saveData(trial, thisTrial, task, time,env, trialData, sessionID, timingData);
        screen7 = ['The experiment is now over. \n\n\n' ...
            'Thank you very much for your participation!\n\n\n'];
        DrawFormattedText(window, screen7, 'center', 'center', [0 0 0]);
        Screen('Flip', window);
        [~, ~, ~] = KbStrokeWait;
        sca;
    case 0
        screen8 = ['The experiment is now over. \n\n\n' ...
            'Thank you very much for your participation!\n\n\n'];
        DrawFormattedText(window, screen8, 'center', 'center', [0 0 0]);
        Screen('Flip', window);
        [~, ~, ~] = KbStrokeWait;
        sca;
end





