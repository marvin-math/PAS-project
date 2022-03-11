function drawobj(window, task)

% Draw the stimuli
Screen('FrameOval', window, task.Color, task.centeredRect_r, task.penWidthPixels);
Screen('FrameRect', window, task.Color, task.centeredRect_square_r, task.penWidthPixels_square_r);
Screen('FramePoly', window, task.Color, [task.xPosVector_d_r; task.yPosVector_d_r]',task.penWidthPixels_di_r);
Screen('FramePoly', window, task.Color, [task.xPosVector_r; task.yPosVector_r]',task.penWidthPixels_tri_r);
        
