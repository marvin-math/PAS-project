function [env, task] = visualAngleCalculation(env, task)
% We define relevant sizes (stimulus height and width, radius, etc.) and
% locations on screen in terms of visual angles, i.e. how many degrees from
% the fixation point is the relevant point on the screen. This ensures that
% the presentation scales correctly and automatically when presented on
% monitors of different size and resolution, or when placed at different
% distances.
%
% Here we convert degrees of visual field into number of pixels (given a
% setup defined by the 'env' variable). We save all relevant converted
% values in 'task' variable. 

% Some of the relevant values are:
% - env.pixPerDegAvg --> how many pixels in one visual degree (NB: this
%   changes with the increasing eccentricity from the fixation point, but for
%   our setup difference is negligible up to 10 degrees)
% - task.stimRadiusPixels --> radius of stimulus presentation in pixels
% - task.cueRadiusPixels --> radius of cue presentation in pixels
% - task.stimWidthPixels --> width of stimulus in pixels
% - task.stimHeighPixels --> height of stimulus in pixels

%% Whole screen
% Whole screen in radians
alphaRadX =  2 * atan( env.screenSize(1) / (2*env.distFromScreen) ); % width
alphaRadY =  2 * atan( env.screenSize(2) / (2*env.distFromScreen) ); % height

% Whole screen in degrees
env.screenVisDegX = rad2deg(alphaRadX);
env.screenVisDegY = rad2deg(alphaRadY);

% Pixels per degree of visual field
pixPerDegX = env.screenRes(1) / env.screenVisDegX;
pixPerDegY = env.screenRes(2) / env.screenVisDegY;

if round(pixPerDegX, 0) ~= round(pixPerDegY, 0)
    disp('Pixels per degree of visual field do not correspond.')
    disp(['Horizontal pixels per degree: ', num2str(pixPerDegX )])
    disp(['Vertical pixels per degree: ', num2str(pixPerDegY )])
end

% Average pixels per degree of visual field
env.pixPerDegAvg = round((pixPerDegX + pixPerDegY)/2, 0);




%% Stimulus size (simplified)
% We calculate the size of the stimulus in cm/pixels as if it were in the
% center. Since stimuli are presented within 5deg of visual field the
% difference between offset-based and center based calculation is
% sub-milimeter (hence "simplified" formula).
% tan ( vis. angle in rad.) = stim width in cm / screen distance in cm

% Width of the stim rectangle
visAngleRad = deg2rad(task.stimWidth);
task.stimWidthCm = tan(visAngleRad) * env.distFromScreen;
task.stimWidthPixels = task.stimWidth * env.pixPerDegAvg;

% Height
visAngleRad = deg2rad(task.stimHeight);
task.stimWidthCm = tan(visAngleRad) * env.distFromScreen;
task.stimHeightPixels = task.stimHeight * env.pixPerDegAvg;


end