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

%% Eccentricity from center (i.e., stim array radius)
%tan(vis. angle in radians) = stimulus radius in cm / screen distance in cm
visAngleRad = deg2rad(task.stimRadius);
%task.stimRadiusCm = tan(visAngleRad) * env.distFromScreen;
task.stimRadiusPixels = task.stimRadius * env.pixPerDegAvg;

%% Cue radius
visAngleRad = deg2rad(task.cueRadius);
task.cueRadiusCm = tan(visAngleRad) * env.distFromScreen;
task.cueRadiusPixels = task.cueRadius * env.pixPerDegAvg;

%% Fixation radius
visAngleRad = deg2rad(task.fixRadius);
task.fixRadiusCm = tan(visAngleRad) * env.distFromScreen;
task.fixRadiusPixels = round(task.fixRadius * env.pixPerDegAvg);

%% Stimulus size (simplified)
% We calculate the size of the stimulus in cm/pixels as if it were in the
% center. Since stimuli are presented within 5deg of visual field the
% difference between offset-based and center based calculation is
% sub-milimeter (hence "simplified" formula).
% tan ( vis. angle in rad.) = stim width in cm / screen distance in cm

% Width
visAngleRad = deg2rad(task.stimWidth);
task.stimWidthCm = tan(visAngleRad) * env.distFromScreen;
task.stimWidthPixels = task.stimWidth * env.pixPerDegAvg;

% Height
visAngleRad = deg2rad(task.stimHeight);
task.stimWidthCm = tan(visAngleRad) * env.distFromScreen;
task.stimHeightPixels = task.stimHeight * env.pixPerDegAvg;

%% 4afc response probes size (simplified)
% Width and height of each of the 4 probes (images) presented in the
% response array for 4AF choice response.

% Width
visAngleRad = deg2rad(task.responseProbeWidth);
task.responseProbeWidthCm = tan(visAngleRad) * env.distFromScreen;
task.responseProbeWidthPixels = task.responseProbeWidth * env.pixPerDegAvg;

% Height
visAngleRad = deg2rad(task.responseProbeHeight);
task.responseProbeHeightCm = tan(visAngleRad) * env.distFromScreen;
task.responseProbeHeightPixels = task.responseProbeHeight * env.pixPerDegAvg;

%% Determine number of pixels per centimeter for the given monitor
% At the moment not used 
%
% if length(env.screenSize) == 1 % If only a diagonal is provided
%     env.pixelsAcrossScreen = sqrt(env.screenRes(1)^2+env.screenRes(2)^2); % pixels in the diagonal
%     env.pixelsPerCm = (env.pixelsAcrossScreen/stim.screenSize); % pixels in the diagonal / diagonal in cm
%     
% elseif length(env.screenSize) == 2 % If width and length are provided
%     env.pixelsPerCm_x = env.screenRes(1) / env.screenSize(1);
%     env.pixelsPerCm_y = env.screenRes(2) / env.screenSize(2);
%     
%     if round(env.pixelsPerCm_x, 0) == round(env.pixelsPerCm_y, 0)
%         env.pixelsPerCm = round(env.pixelsPerCm_x);
%     else % If the calculation doesn't end up the same for width and height (should be same number of pixels per cm in both)
%         [env.pixelsPerCm_x env.pixelsPerCm_y]
%         error('Please make sure the entered ScreenSize values (in cm) are correct.')
%     end
%     
% end

end