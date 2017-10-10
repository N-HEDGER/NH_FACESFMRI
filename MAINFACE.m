%% Add paths

addpath('Config','Data','Stimuli','Hardware','Conditions');

%% Constants

Const_config

%% Set up screen 

Scr_config

%% Prompt for subject inputs.

% Prompt for the block number.
RUN=input('Run number? [1-3 = experimental, 4 = localiser]');

% Prompt for asking whether this is a test. If it is a test, then 
% MATLAB doesnt wait for a Syncbox pulse and only runs 20 trials.
istest=input('Test?');

%% Set up text labels.

Text_config
Key_config

%% Make conditions.

MAKECONDITIONS

if RUN==1
    prompt='subject filename?';
    filename = input(prompt,'s');
end

mkdir(strcat('Data/',filename))
log_text=sprintf('Data/%s/BLOCK%dlog.txt',filename,RUN);
log_text_fid=fopen(log_text,'a+');

% Spit some initial information into a text file.
% log_text=sprintf('Data/%sBLOCK%dlog.txt',filename,RUN);
% log_text_fid=fopen(log_text,'a+');
log_txt=sprintf('Subject is doing block %d',RUN);
fprintf(log_text_fid,'%s\n',log_txt);

% If this is just a test, dont wait for the Syncbox.
 if istest==1
 else
    Syncbox_config
    fopen(s2);
 end

%% Initialize screen and textures;

Screen('CloseAll')
[scr.window, scr.rect] = Screen('OpenWindow', scr.main, [const.BGcol]);
priorityLevel=MaxPriority(scr.window);
Priority(priorityLevel);
slack = Screen('GetFlipInterval', scr.window);
PRELOADTEXTURES

%% Show initial instructions and wait for keyboard input

Screen('DrawText', scr.window, PROMPT,scr.x_mid, scr.y_mid);
Textpres=Screen('Flip', scr.window,[],[]);
KbWait(max(GetKeyboardIndices));

%% Begin experimental loop

 for p=1:length(conditions)
  

initpres=Screen('Flip', scr.window,[]);



%% Wait for Syncbox pulse.

GETPULSE
% Get timing of pulse.
startclock{p}=clock;
tic

%% If not a null trial, show the appropriate stimulus.


if conditions(p,3)~=0

Screen('DrawText', scr.window, num2str(p),40, 40);
Screen('DrawTexture', scr.window,STIMULI2.(structtype(p,:)){conditions(p,4),conditions(p,5)}, [], scr.stimrect,[]);
Screen('DrawDots',scr.window,scr.mid,const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.window,scr.mid,const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.window,scr.mid,const.smallerfixsize,[const.fixsequence(p) const.fixsequence(p) const.fixsequence(p)],[],1);

stimpres=Screen('Flip', scr.window,[]);
log_txt=sprintf('Stimulus flipped at %s',num2str(clock));
fprintf(log_text_fid,'%s\n',log_txt);

else
    
%% Otherwise just show the fixation cross
Screen('DrawDots',scr.window,scr.mid,const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.window,scr.mid,const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.window,scr.mid,const.smallerfixsize,[const.fixsequence(p) const.fixsequence(p) const.fixsequence(p)],[],1);
stimpres=Screen('Flip', scr.window,[]);
log_txt=sprintf('NULL EVENT at %s',num2str(clock));
fprintf(log_text_fid,'%s\n',log_txt);


end 
% Get response from observer
 while toc<(const.DUR-(slack*2))
    
    [keyIsDown, ~, keyCode] = KbCheck(min(GetKeyboardIndices));
    if keyIsDown
        if keyCode(Responsekey)
            % write in log/edf 
            log_txt = sprintf('Button press at %s',num2str(clock));
            fprintf(log_text_fid,'%s\n',log_txt);
        end
    end
 end
%% Get length of presentation.
Screen('DrawDots',scr.window,scr.mid,const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.window,scr.mid,const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.window,scr.mid,const.smallerfixsize,[const.fixsequence(p) const.fixsequence(p) const.fixsequence(p)],[],1);
endpres=Screen('Flip', scr.window,[],[]);
elapsedvec(p)=endpres-stimpres;
Screen('DrawDots',scr.window,scr.mid,const.bigfixsize,const.bigfixcol,[],1);
Screen('DrawDots',scr.window,scr.mid,const.smallfixsize,const.smallfixcol,[],1);
Screen('DrawDots',scr.window,scr.mid,const.smallerfixsize,[const.fixsequence(p) const.fixsequence(p) const.fixsequence(p)],[],1);

 end

Screen('CloseAll')

%% Data reduction

% Calculate the timings of each pulse relative to the first.
ntime=zeros(1,length(conditions));
for i=2:length(conditions);
    ntime(i)=etime(startclock{i},startclock{1});
end
    
% Make a matrix of the condition info, pulse timing and length of preparation 
allconds=horzcat(conditions(1:length(conditions),:),ntime',elapsedvec',ones(length(conditions),1));

%% Save data
STOREEVENTS
 if istest==1
 else
fclose(s2);
 end

 

