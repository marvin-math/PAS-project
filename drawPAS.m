function drawPAS(window, env, task)

% Make a base Rect of 200 by 200 pixels
baseRect_square = [0 0 600 1];
respRect_1 = [0 0 1 50];

% Make PAS coordinates
centeredRect_square = CenterRectOnPointd(baseRect_square, env.xCenter, env.yCenter);
resp_line1 = CenterRectOnPointd(respRect_1, env.xCenter+300, env.yCenter);
resp_line2 = CenterRectOnPointd(respRect_1, env.xCenter+100, env.yCenter);
resp_line3 = CenterRectOnPointd(respRect_1, env.xCenter-100, env.yCenter);
resp_line4 = CenterRectOnPointd(respRect_1, env.xCenter-300, env.yCenter);

% Pen width for the frames
penWidthPixels_square = 2;

% Draw the vertical lines to thescreen
Screen('FrameRect', window, task.PASlineColour, centeredRect_square, penWidthPixels_square);
Screen('FrameRect', window, task.PASlineColour, resp_line1, penWidthPixels_square);
Screen('FrameRect', window, task.PASlineColour, resp_line2, penWidthPixels_square);
Screen('FrameRect', window, task.PASlineColour, resp_line3, penWidthPixels_square);
Screen('FrameRect', window, task.PASlineColour, resp_line4, penWidthPixels_square);

%text
Screen('TextSize', window, 15);
DrawFormattedText(window, 'Absolutely clear image', env.xCenter+220,...
    env.screenYpixels*0.45, [1 1 1]);

Screen('TextSize', window, 15);
DrawFormattedText(window, 'Almost clear image', env.xCenter+20,...
    env.screenYpixels*0.45, [1 1 1]);

Screen('TextSize', window, 15);
DrawFormattedText(window, 'Brief glimpse', env.xCenter-150,...
    env.screenYpixels*0.45, [1 1 1]);

Screen('TextSize', window, 15);
DrawFormattedText(window, 'No experience', env.xCenter-360,...
    env.screenYpixels*0.45, [1 1 1]);

% Flip to the screen
%Screen('Flip', window);
