function trial = generateTrials(window, task, sessionID)


counter = 1;
for thisTrial = 1:task.nTrials
    trial(thisTrial).nStimulus = randsample(1:4,1);
    trial(thisTrial).respPos = randi(task.PASnResp);
    trial(thisTrial).ObjRespPos = randi(task.ObjnResp);
    counter = counter + 1
    switch sessionID
        case 'wide'
            trial(thisTrial).stimExpTime = task.stimExpTimesWide(counter-1);
            
        case 'narrow'
            trial(thisTrial).stimExpTime = task.stimExpTimesNarrow(counter-1);
end

  %  response = ['one'];
    %DrawFormattedText(window, response, 'center', 'center');
    %Screen('Flip', myWin);
    
    % Stimuli to be presented in response sequence
  %  trial(thisTrial).respArray = Shuffle([trial(thisTrial).DrawFormattedText(window, response, 'center', 'center'), trial(thisTrial).DrawFormattedText(window, response, 'center', 'center'), trial(thisTrial).DrawFormattedText(window, response, 'center', 'center'), trial(thisTrial).DrawFormattedText(window, response, 'center', 'center')]);
   % trial(thisTrial).respPos = 1;
   % trial(thisTrial).corrPos = find(trial(thisTrial).respArray == trial(thisTrial).corrStim);
    
    % Stimuli and cue locations
    %trial(thisTrial).rectDestinations = rectDestinations;
    %trial(thisTrial).cueDestinations = cueDestinations;
    %trial(thisTrial).respDestinations = respDestinations;
    
    
    
    
    
    
    
end
    