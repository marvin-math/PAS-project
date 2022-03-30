function countdown1(env, window, time, thisTrial, task)

text = ['Please take a longer break now.'...
    '\n\n\nFeel free to stretch, have a little walk, or just sit back and rest your eyes :)'];
DrawFormattedText(window, text, 'center', 'center');
for sec = 1:time.break
    DrawFormattedText(window, text, 'center', 'center');
    Screen('DrawText', window,num2str(sec), env.xCenter, env.yCenter - 200);
    Screen('Flip',window);
    WaitSecs(1);

end
    text = ['Next block: ',num2str(thisTrial/task.BlockSize+1), ...
        '\n\n\nWhen you are ready, press any key to start the block.'];
    DrawFormattedText(window, text, 'center', 'center');
    Screen('Flip',window);
    KbStrokeWait;