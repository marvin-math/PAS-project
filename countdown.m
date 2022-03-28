function countdown(env, window)

Screen('TextSize', window, 20);

rng('shuffle');


nominalFrameRate = Screen('NominalFrameRate', window);

presSecs = [sort(repmat(1:10, 1, nominalFrameRate), 'descend') 0];


for i = 1:length(presSecs)
    DrawFormattedText(window, 'Time to take a 10 seconds break.', env.xCenter-200,...
        env.yCenter-200, [1 1 1]);
    %Screen('Flip', window);
    
    % Convert our current number to display into a string
    numberString = num2str(presSecs(i));

    % Draw our number to the screen
    DrawFormattedText(window, numberString, 'center', 'center', [1 1 1]);

    % Flip to the screen
    Screen('Flip', window);

end

DrawFormattedText(window, 'Time to take a 10 seconds break.\n\n Press any key to resume', env.xCenter-200,...
    env.yCenter-200, [1 1 1]);
Screen('Flip', window);
KbStrokeWait;