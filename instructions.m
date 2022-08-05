function instructions(env, window, task)
        screen1 = ['Thank you for participating in our study on perceptual awareness! ' ...
            '\n\n\nIn this experiment you will be very briefly shown a simple geometric shape,' ...
            '\n\nfollowed by a mask.' ...
            '\n\nYour task will be to pay close attention to the simple geometric shape, and to report the shape you have seen.' ...
            '\n\n\nYou will choose the geometric shape by pressing LEFT/RIGHT ARROWS, and give your report by pressing RETURN.'];
                    
        screen2 = ['After this you will be asked to indicate the clarity of the experience on the Perceptual Awareness Scale.' ...
            '\n\nYou can provide a rating from 1 to 4 on this scale.' ...
            '\n\nSee the table on the next screen to learn what these numbers stand for.']; 
        
        screen3 =['\n\n\nThere will be ' , num2str(task.BlockSize),  ' trials within one block.' ...
            '\n\nAfter each block there will be a break. Please use this break to rest your eyes for at least 30 seconds.'...
            '\n\n\nThere will be ', num2str(length(task.breaknr)+1), ' blocks in total.'];
        
        screen4 = ['Please keep the following instructions in mind:' ...
            '\n\n\n1) You should ALWAYS keep your eyes on the fixation dot when it is displayed.' ...
            '\n\n\n2) Please try to stay alert on every trial, and take as long breaks as you need.' ...
            '\n\n\n3) The task will seem very hard, but don''t be discouraged!' ...
            '\n\n   Even when you don''t know the answer, please make a guess.'];
        
        screen5 = ['You will now be given ', num2str(task.nTrialsPractice),' practice trials.' ...
            '\n\nAfter these practice trials there will be a break when you can ask questions.' ...
            '\n\n\n Press any key to start the practice run.'];
        
        % Read an image
        thisImage = imread(env.ImageFolderLocation);

        %thisImage=255-thisImage;
        
        % Make the image into a texture
        PASInstructionTex = Screen('MakeTexture', window, thisImage);
            
        instructionsColor = [0 0 0];
        
        % Screen1
        Screen('TextSize', window, 30);
        DrawFormattedText(window, screen1, 'center', 'center', instructionsColor);
        Screen('Flip', window);
        [~, ~, ~] = KbStrokeWait;
        % Screen2
        Screen('TextSize', window, 30);
        DrawFormattedText(window, screen2, 'center', 'center', instructionsColor);
        Screen('Flip', window);
        [~, ~, ~] = KbStrokeWait;
        % draw PAS explanation
        Screen('DrawTexture', window, PASInstructionTex, [0 0 1240 700]);
        Screen('Flip', window);
        [~, ~, ~] = KbStrokeWait;
        % Screen3
        Screen('TextSize', window, 30);
        DrawFormattedText(window, screen3, 'center', 'center', instructionsColor);
        Screen('Flip', window);
        [~, ~, ~] = KbStrokeWait;
        % Screen4
        Screen('TextSize', window, 30);
        DrawFormattedText(window, screen4, 'center', 'center', instructionsColor);
        Screen('Flip', window);
        [~, ~, ~] = KbStrokeWait;
        % Screen5
        Screen('TextSize', window, 30);
        DrawFormattedText(window, screen5, 'center', 'center', instructionsColor);
        Screen('Flip', window);
        [secs, ~, ~] = KbStrokeWait;