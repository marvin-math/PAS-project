function [trial, exit] = responseobj(window, trial, thisTrial, task, env)

keyName = '';
exit = 0;
%draws resp stimuli and choice rectangles
drawResponse(window, 'objective', trial, thisTrial, env, task);

%Selection Loop: until a letter is selected (Return is pressed)
%tStart = GetSecs;
while(~strcmp(keyName,'Return')) 
    % Wait until Keyboard Input (Left, Right, Return, Escape)
    [~, keyCode, ~] = KbWait([],2);
    
    %Select response using arrows, or Esc to exit
    keyName = KbName(keyCode);
    if strcmp(keyName,'LeftArrow') & trial(thisTrial).ObjRespPos > 1
        % If you press left arrow and you're not already on the left-most
        % option
        trial(thisTrial).ObjRespPos = trial(thisTrial).ObjRespPos - 1;
        drawResponse(window, 'objective', trial, thisTrial, env, task);
        keyName = '';
    elseif strcmp(keyName,'RightArrow') & trial(thisTrial).ObjRespPos < task.ObjnResp
        trial(thisTrial).ObjRespPos = trial(thisTrial).ObjRespPos + 1;
        drawResponse(window, 'objective', trial, thisTrial, env, task);
        keyName = '';
    elseif strcmp(keyName,'ESCAPE')
        Screen('close');
        sca;
        exit = 1;
        return;
    end     
end
