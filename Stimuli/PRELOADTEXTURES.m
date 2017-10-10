
% Load in the .mat file of face stimuli
load('FACESTIM.mat');

% Make textures - also make them the right size so they dont have to be
% resized when flipping.
for i=1:12
    STIMULI2.UU{1,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.UU{1,i},[NaN const.stimsize]));
     STIMULI2.UU{2,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.UU{2,i},[NaN const.stimsize]));

end

for i=1:12
    STIMULI2.IN{1,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.IN{1,i},[NaN const.stimsize]));
    STIMULI2.IN{2,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.IN{2,i},[NaN const.stimsize]));

end

for i=1:12
    STIMULI2.II{1,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.II{1,i},[NaN const.stimsize]));
     STIMULI2.II{2,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.II{2,i},[NaN const.stimsize]));

end

for i=1:12
    STIMULI2.UI{1,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.UI{1,i},[NaN const.stimsize]));
    STIMULI2.UI{2,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.UI{2,i},[NaN const.stimsize]));

end

for i=1:12
    STIMULI2.NO{1,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.NO{1,i},[NaN const.stimsize]));
    STIMULI2.NO{2,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.NO{2,i},[NaN const.stimsize]));

end


for i=1:12
    STIMULI2.FA{1,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.FA{1,i},[NaN const.stimsize]));
     STIMULI2.HO{1,i}=Screen('MakeTexture',scr.window,imresize(STIMULI.HO{1,i},[NaN const.stimsize]));

end


