function [trial, exit] = responsePAS(window, trial, thisTrial, task, env)

keyName = '';
exit = 0;

%draws resp stimuli and choice rectangles
drawResponse(window, 'PAS', trial, thisTrial, env, task);

%Selection Loop: until a letter is selected (Return is pressed)
%tStart = GetSecs;
tStartPAS = GetSecs;
while(~strcmp(keyName,'Return')) 
    % Wait until Keyboard Input (Left, Right, Return, Escape)
    [~, keyCode, ~] = KbWait([],2);
    
    %Select response using arrows, or Esc to exit
    keyName = KbName(keyCode);
    if strcmp(keyName,'LeftArrow') & trial(thisTrial).respPos > 1
        % If you press left arrow and you're not already on the left-most
        % option
        trial(thisTrial).respPos = trial(thisTrial).respPos - 1;
        drawResponse(window, 'PAS', trial, thisTrial, env, task);
        keyName = '';
    elseif strcmp(keyName,'RightArrow') & trial(thisTrial).respPos < task.PASnResp
        trial(thisTrial).respPos = trial(thisTrial).respPos + 1;
        drawResponse(window, 'PAS', trial, thisTrial, env, task);
        keyName = '';
    elseif strcmp(keyName,'ESCAPE')        
        exit = 1;
        return;
    end     
end
tEndPAS = GetSecs;
trial(thisTrial).RTpas = tEndPAS - tStartPAS;



% Save data
% tEnd = GetSecs;
% trial(thisTrial).RT = tEnd - tStart;
% trial(thisTrial).choice = trial(thisTrial).respArray(trial(thisTrial).respPos);