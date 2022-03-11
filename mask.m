function mask(window, task, trial)

if trial(thisTrial).nStimulus == 1
    WaitSecs(2)
    Screen('FrameOval', window, task.rectColor, task.centeredRect_m, task.penWidthPixels);
    Screen('FrameRect', window, task.Color, task.centeredRect_square_m, task.penWidthPixels_square);
    Screen('FramePoly', window, task.diColor, [task.xPosVector_d_m; task.yPosVector_d_m]',task.penWidthPixels_di);
    Screen('FramePoly', window, task.triColor, [task.xPosVector_m; task.yPosVector_m]',task.penWidthPixels_tri);
    
elseif trial(thisTrial).nStimulus == 2
    WaitSecs(2)
    Screen('FrameOval', window, task.rectColor, task.centeredRect_m, task.penWidthPixels);
    Screen('FrameRect', window, task.Color, task.centeredRect_square_m, task.penWidthPixels_square);
    Screen('FramePoly', window, task.diColor, [task.xPosVector_d_m; task.yPosVector_d_m]',task.penWidthPixels_di);
    Screen('FramePoly', window, task.triColor, [task.xPosVector_m; task.yPosVector_m]',task.penWidthPixels_tri);
    
elseif trial(thisTrial).nStimulus == 3
    WaitSecs(2)
    Screen('FrameOval', window, task.rectColor, task.centeredRect_m, task.penWidthPixels);
    Screen('FrameRect', window, task.Color, task.centeredRect_square_m, task.penWidthPixels_square);
    Screen('FramePoly', window, task.diColor, [task.xPosVector_d_m; task.yPosVector_d_m]',task.penWidthPixels_di);
    Screen('FramePoly', window, task.triColor, [task.xPosVector_m; task.yPosVector_m]',task.penWidthPixels_tri);
    
elseif trial(thisTrial).nStimulus == 4
    WaitSecs(2)
    Screen('FrameOval', window, task.rectColor, task.centeredRect_m, task.penWidthPixels);
    Screen('FrameRect', window, task.Color, task.centeredRect_square_m, task.penWidthPixels_square);
    Screen('FramePoly', window, task.diColor, [task.xPosVector_d_m; task.yPosVector_d_m]',task.penWidthPixels_di);
    Screen('FramePoly', window, task.triColor, [task.xPosVector_m; task.yPosVector_m]',task.penWidthPixels_tri);
    end


WaitSecs(2)
Screen('FrameOval', window, task.rectColor, task.centeredRect_m, task.penWidthPixels);
Screen('FrameRect', window, task.Color, task.centeredRect_square_m, task.penWidthPixels_square);
Screen('FramePoly', window, task.diColor, [task.xPosVector_d_m; task.yPosVector_d_m]',task.penWidthPixels_di);
Screen('FramePoly', window, task.triColor, [task.xPosVector_m; task.yPosVector_m]',task.penWidthPixels_tri);
WaitSecs(2)

Screen('Flip', window);
end