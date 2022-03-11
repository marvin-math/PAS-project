function [trialData] = saveData(trial, task, time, env, trialData, sessionID, timingData)

trialDataTmp = table([1:length(trial)]', ... % all trials
    repmat(sessionID,length(trial), 1), ... % condition, repeat nTrials times
    repelem(time.MOA, length(trial))', ... % Mask onset asynchrony
    [trial.nStimulus]', ...
    [trial.ObjRespPos]', ...
    repelem(NaN, length(trial))', ...
    [trial.respPos]');
trialDataTmp.Properties.VariableNames = trialData.Properties.VariableNames;

% Add to previous data
trialData = [trialData; trialDataTmp];

%save timing data
writetable(timingData,fullfile(env.fileDir, 'timingLog.csv'),'Delimiter',',') 
%save trial data
writetable(trialData,fullfile(env.fileDir, 'rawData.csv'),'Delimiter',',')
save(env.outFile, 'env', 'task', 'time');