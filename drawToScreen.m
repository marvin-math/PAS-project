
function [timingData, timingDataTrial] = drawToScreen(window, task, trial, thisTrial, env, time, sessionID, timingData)

dotSizePix = 10;
%Screen('DrawDots', window, [env.xCenter, env.yCenter], dotSizePix, task.Color, [], 2);
%Screen('Flip', window);

% Timing data saving
timeRealFlip = zeros(4, 1); % 4 different objects are timed - fixITI, stimExp, maskExp, mask delay
timeExpectedFlip = zeros(4,1);
whichObject = strings(4, 1);
counter = 1;
expectedTime = 0;
%
MOA = time.MOA;
stimExp = trial(thisTrial).stimExpTime;
maskExp = time.maskExpTime;
ITI = time.itiGap;

% ITI - fixation dot
% Flip to sync us to the vertical retrace at the same time as drawing fixation point
Screen('DrawDots', window, [env.xCenter, env.yCenter], dotSizePix, task.Color, [], 2);
startTime =  Screen('Flip', window);
timeRealFlip(counter) = startTime - startTime;
timeExpectedFlip(counter) = expectedTime;
whichObject(counter) = 'initialFixation';
counter = counter + 1;
expectedTime = expectedTime + ITI; % Show next object after initGap

%Draw stimuli
if trial(thisTrial).nStimulus == 4
    Screen('FrameOval', window, task.Color, task.centeredRect_m, task.penWidthPixels)
elseif trial(thisTrial).nStimulus == 3
    Screen('FrameRect', window, task.Color, task.centeredRect_square_m, task.penWidthPixels_square);    
elseif trial(thisTrial).nStimulus == 2
    Screen('FramePoly', window, task.Color, [task.xPosVector_d_m; task.yPosVector_d_m]',task.penWidthPixels_di);
elseif trial(thisTrial).nStimulus == 1
    Screen('FramePoly', window, task.Color, [task.xPosVector_m; task.yPosVector_m]',task.penWidthPixels_tri);
end

Screen('DrawingFinished', window);
vbl = Screen('Flip', window, startTime + expectedTime - time.halfifi);
timeRealFlip(counter) = vbl - startTime;
timeExpectedFlip(counter) = expectedTime;
whichObject(counter) = 'stimulus';
counter = counter + 1;
expectedTime = expectedTime + stimExp;
%img = Screen('GetImage', window);
%imwrite(img, 'stimulus.png', 'PNG');

% Delay before mask
% Empty screen for delay
if MOA == 0 % If there's no cue delay
    % Save data
    timeRealFlip(counter) = nan;
    timeExpectedFlip(counter) = nan;
    whichObject(counter) = 'delay';
    counter = counter + 1;
else % Otherwise if there is some delay - draw fixation only
    Screen('DrawDots', window, [env.xCenter, env.yCenter], dotSizePix, task.Color, [], 2);
    Screen('DrawingFinished', window);
    vbl = Screen('Flip', window, startTime + expectedTime - time.halfifi);
    timeRealFlip(counter) = vbl - startTime;
    timeExpectedFlip(counter) = expectedTime;
    whichObject(counter) = 'delay';
    counter = counter + 1;
    %img = Screen('GetImage', window);
    %imwrite(img, 'fixation.png', 'PNG');
end
expectedTime = expectedTime + MOA;

% Draw the mask
Screen('FrameOval', window, task.Color, task.centeredRect_m, task.penWidthPixels);
Screen('FrameRect', window, task.Color, task.centeredRect_square_m, task.penWidthPixels_square);
Screen('FramePoly', window, task.Color, [task.xPosVector_d_m; task.yPosVector_d_m]',task.penWidthPixels_di);
Screen('FramePoly', window, task.Color, [task.xPosVector_m; task.yPosVector_m]',task.penWidthPixels_tri);

Screen('DrawingFinished', window);
vbl = Screen('Flip', window, startTime + expectedTime - time.halfifi);
timeRealFlip(counter) =vbl - startTime;
timeExpectedFlip(counter) = expectedTime;
whichObject(counter) = 'mask';
counter = counter + 1;
expectedTime = expectedTime + maskExp;
%img = Screen('GetImage', window);
%imwrite(img, 'cue.png', 'PNG');

% Wait before response
Screen('DrawDots', window, [env.xCenter, env.yCenter], dotSizePix, task.Color, [], 2);
Screen('DrawingFinished', window);
vbl = Screen('Flip', window, startTime + expectedTime - time.halfifi);
timeRealFlip(counter) = vbl - startTime;
timeExpectedFlip(counter) = expectedTime;
whichObject(counter) = 'maskoff';
WaitSecs(time.respGap);


%SAVE DATA
%% Save the data
whichTrial = repelem(thisTrial, length(timeRealFlip));
manDuration = repelem(trial(thisTrial).stimExpTime, length(timeRealFlip));
timingDataTrial = table(timeRealFlip, timeExpectedFlip, whichObject, manDuration', whichTrial');
timingDataTrial.Properties.VariableNames = timingData.Properties.VariableNames;
timingData = [timingData; timingDataTrial];
        
end




