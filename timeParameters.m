function [time, timingData] = timeParameters(window, task, trial, thisTrial)
% Sets the timing parameters of the partial report task. 

%% flip rate

%% Estimate flip interval 
% 
%Priority(MaxPriority(window));
Screen('TextFont', window, 'Arial');
Screen('TextSize', window, 20);
% Fill screen with mid-grey background
Screen('FillRect', window, task.screenColour);

 % Measure flip interval (vertical refresh rate)
time.ifi = Screen('GetFlipInterval', window);
time.halfifi = time.ifi/2;
%% Stimulus
%time.stimExpTime = trial(thisTrial).stimExpTime;  % Stimulus array exposure time [s]

%% Mask
time.MOA = 0; % mask onset delay [s] -- this is used when cue timing is not manipulated
time.maskExpTime = 0.3; % Duration of cue [s]
%time.maskDelays = task.maskDelays; % In more cases - when cue timing is manipulated

%% Experiment
time.initGap = 1; % Time before first stimulus appears [ms], after instructions
time.itiGap = 1; % Inter trial interval [ms], time between response and next trial onset
time.respWait = 3.0; % How long to allow for the response
time.respGap = 0.2; % Gap before response



%% Breaks
% if devMode
%     time.breakShort = 3;
%     time.breakLong = 5;
%     time.breakWhen = 2; % After how many blocks there's a longer break
%     time.breakWhenShort = task.nTrials / 4; % Short break every 1/4 of the block
%     time.breakWhenShortV = [time.breakWhenShort, time.breakWhenShort*2, time.breakWhenShort*3];
% else
%     time.breakShort = 10;
%     time.breakLong = 60;
%     time.breakWhen = length(task.nPointsCondi); % After how many blocks there's a longer break
%     time.breakWhenShort = task.nTrials / 4; % Short break every 1/4 of the block
%     time.breakWhenShortV = [time.breakWhenShort, time.breakWhenShort*2, time.breakWhenShort*3];
% end

% %% Total time
% time.avgDelay = mean(abs(task.cueDelays));
% time.avgTrial = time.stimExpTime+time.avgDelay+time.respGap+time.respWait + time.itiGap;
%% Save flip info
varNames = {'TimeRealFlip','TimeExpected', 'WhichObject', 'manip. Duration', 'Trial'};
varTypes = {'double', 'double', 'string', 'double', 'double'};
size = [0, length(varNames)];
timingData = table('Size', size, 'VariableTypes', varTypes, 'VariableNames', varNames);

end