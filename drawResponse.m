function [] = drawResponse(window, whichObject, trial, thisTrial, env, task)

switch whichObject

    case 'PAS'
        % Draw PAS scale
        drawPAS(window, env, task)
        
        % Select what's current response
        cR = trial(thisTrial).respPos;
              
        % Draw rectangle around current location
        Screen('FrameRect', window, task.PASselectColour, task.PASresponses(cR, :), 10)
        Screen('DrawingFinished', window);
        Screen('Flip', window);
        
    case 'objective'
        %draw obj response
        drawobj(window, task)
        
        %select what's current response option
        cR_obj = trial(thisTrial).ObjRespPos;
        % Draw rectangle around current location
        Screen('FrameRect', window, task.PASselectColour, task.ObjResponses(cR_obj, :), 10)
        Screen('DrawingFinished', window);
        Screen('Flip', window);
        
    case 'feedback'
        %similar to respStim but creates GREEN square around correct resp
        
        texturePointers = trial(thisTrial).respArray;

        % Assign stimuli to respective locations
        destinationRects = trial(thisTrial).respDestinations;
        Screen('DrawTextures', window, texturePointers', [], destinationRects');

        cR = trial(thisTrial).corrPos;

        Screen('DrawLine', window, [0 1 0], destinationRects(cR, 1), destinationRects(cR, 2), destinationRects(cR, 3), destinationRects(cR, 2), lineWid);
        Screen('DrawLine', window, [0 1 0], destinationRects(cR, 1), destinationRects(cR, 2), destinationRects(cR, 1), destinationRects(cR, 4), lineWid);
        Screen('DrawLine', window, [0 1 0], destinationRects(cR, 1), destinationRects(cR, 4), destinationRects(cR, 3), destinationRects(cR, 4), lineWid);
        Screen('DrawLine', window, [0 1 0], destinationRects(cR, 3), destinationRects(cR, 2), destinationRects(cR, 3), destinationRects(cR, 4), lineWid);

        Screen('DrawingFinished', window);
        Screen('Flip', window);
        
end

end
        
