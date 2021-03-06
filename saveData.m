function [trialData] = saveData(trial,thisTrial, task, time, env, trialData, sessionID, timingData)

switch sessionID
    case 'narrowMOA'
        trialDataTmp = table([1:length(trial)]', ... % all trials
            repmat(sessionID,length(trial), 1), ... % condition, repeat nTrials times
            [trial.MOATime]', ... % Mask onset asynchrony
            [trial.nStimulus]', ...
            [trial.ObjRespPos]', ...
            repelem(NaN, length(trial))', ...
            [trial.respPos]', ...
            repelem(task.nTrialsPractice, length(trial))', ...
            [ [trial.RTobj], repelem(NaN, length(trial)-length([trial.RTobj]) )]', ...
            [ [trial.RTpas], repelem(NaN, length(trial)-length([trial.RTpas]) )]');
        trialDataTmp.Properties.VariableNames = trialData.Properties.VariableNames;
    case 'narrowlow'
        trialDataTmp = table([1:length(trial)]', ... % all trials
            repmat(sessionID,length(trial), 1), ... % condition, repeat nTrials times
            repmat(time.MOA, length(trial),1), ... % Mask onset asynchrony
            [trial.nStimulus]', ...
            [trial.ObjRespPos]', ...
            repelem(NaN, length(trial))', ...
            [trial.respPos]', ...
            repelem(task.nTrialsPractice, length(trial))', ...
            [ [trial.RTobj], repelem(NaN, length(trial)-length([trial.RTobj]) )]', ...
            [ [trial.RTpas], repelem(NaN, length(trial)-length([trial.RTpas]) )]');
        trialDataTmp.Properties.VariableNames = trialData.Properties.VariableNames;
    case 'narrowhigh'
        trialDataTmp = table([1:length(trial)]', ... % all trials
            repmat(sessionID,length(trial), 1), ... % condition, repeat nTrials times
            repmat(time.MOA, length(trial),1), ... % Mask onset asynchrony
            [trial.nStimulus]', ...
            [trial.ObjRespPos]', ...
            repelem(NaN, length(trial))', ...
            [trial.respPos]', ...
            repelem(task.nTrialsPractice, length(trial))', ...
            [ [trial.RTobj], repelem(NaN, length(trial)-length([trial.RTobj]) )]', ...
            [ [trial.RTpas], repelem(NaN, length(trial)-length([trial.RTpas]) )]');
        trialDataTmp.Properties.VariableNames = trialData.Properties.VariableNames;
    case 'wide'
        trialDataTmp = table([1:length(trial)]', ... % all trials
            repmat(sessionID,length(trial), 1), ... % condition, repeat nTrials times
            repmat(time.MOA, length(trial),1), ... % Mask onset asynchrony
            [trial.nStimulus]', ...
            [trial.ObjRespPos]', ...
            repelem(NaN, length(trial))', ...
            [trial.respPos]', ...
            repelem(task.nTrialsPractice, length(trial))', ...
            [ [trial.RTobj], repelem(NaN, length(trial)-length([trial.RTobj]) )]', ...
            [ [trial.RTpas], repelem(NaN, length(trial)-length([trial.RTpas]) )]');
        trialDataTmp.Properties.VariableNames = trialData.Properties.VariableNames;
end

% Add to previous data
trialData = [trialData; trialDataTmp];

%save timing data
writetable(timingData,fullfile(env.fileDir, 'timingLog.csv'),'Delimiter',',') 
%save trial data
writetable(trialData,fullfile(env.fileDir, 'rawData.csv'),'Delimiter',',')
save(env.outFile, 'env', 'task', 'time');