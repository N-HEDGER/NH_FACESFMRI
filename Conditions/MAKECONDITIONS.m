if RUN~=4

%     For the first 3 blocks load the pre-determined trial order.
conditions=load('EventTable.mat');
conditions=conditions.output;

% Conditions(:3) is the ev number:
% 1 = Fear upright, 2 = Neutupright, 3 = Fear inverted 4 = neutral inverted
% 5 = Fear inverted inverted, 6 = neutral inverted inverted, 7 = Fear
% upright inverted 8= Neutral upright inverted, 9 = Fear scramble, 10 =
% neutral scramble. 

% Sort into strings that define which structure to look in

struct=zeros(length(conditions));
struct2type=cell(1,length(conditions));

 for j=1:length(conditions)
struct(j)=conditions(j,3);
if struct(j)==1 || struct(j)==2 ;
%     Upright
struct2type{j}='UU';
elseif struct(j)==3 || struct(j)==4;
%     Inverted
struct2type{j}='IN';
elseif struct(j)==5 || struct(j)==6;
%     Inverted Inverted
struct2type{j}='II';
elseif struct(j)==7 || struct(j)==8;
%     Upright Inverted
struct2type{j}='UI';
elseif struct(j)==9 || struct(j)==10;
%     Noise
struct2type{j}='NO';
elseif struct(j)==0;
%     Null trial
struct2type{j}='XX';
end;
end;

% Conditions (:,4) is the facial expression (1= fear, 2 = neutral)
conditions(:,4)=repmat(0,1,length(conditions));
for j=1:length(conditions)
    if ismember(conditions(j,3),[1 3 5 7 9])
        %     Fear
        conditions(j,4)=1;
    elseif ismember(conditions(j,3),[2 4 6 8 10])
        %     Neutral
        conditions(j,4)=2;
    elseif conditions(j,3)==0
        %     Null trial
        conditions(j,4)=0;
    end;
end;

structtype=char(struct2type);

% conditions(:,5) is the model.
conditions(:,5)=repmat(0,1,length(conditions));

% Assign models for each EV.
for j=1:10 
conditions(conditions(:,3)==j,5)=1:12;
end

%     The resulting matrix 'conditions' is 1) trial number, 2) time (assuming TR
%     of 2 secs 3) ev, 4) expression, 5) model.

elseif RUN==4

conditions=load('EventTable_LOCAL.mat');
conditions=conditions.output;

struct=zeros(length(conditions));
struct2type=cell(1,length(conditions));

% Conditions(:3) is the ev number:
% 1 = Face 2 = House

% Sort into strings that define which structure ev comes from.
 for j=1:length(conditions)
struct(j)=conditions(j,3);
if struct(j)==1 ;
struct2type{j}='FA';
elseif struct(j)==2;
struct2type{j}='HO';
elseif struct(j)==0;
struct2type{j}='XX';
end;
end;
structtype=char(struct2type);
% The cell for faces/ houses is only one level, since there are no
% expressions.

conditions(:,4)=repmat(1,1,length(conditions));

% Assign models.
conditions(:,5)=repmat(0,1,length(conditions));

for j=1:2
conditions(conditions(:,3)==j,5)=repmat(1:12,1,5);
end  
       
end


% Create a vector that determines when the fixation luminance switches.

% The luminance changes at these 24 points (one 10th of trials)
const.transientevents=sort(randsample(1:240,24));

% Start of with a starting luminance for all 240 trials
const.fixsequence=repmat(const.smallerfixcol,1,240);

% Between the intervals of the luminance changes, set this to have a
% different luminance.

for j=1:2:24
    const.fixsequence(const.transientevents(j):const.transientevents(j+1))=const.smallfixcol(1)-(const.lumdiff);
    
end

% The resulting fixsequence summarises the fixation luminance on each
% trial.

% If its a test, then abbreviate the condition matrix.
if istest==1;
conditions=conditions(1:10,:);
else
    conditions=conditions;
end


startclock=cell(1,length(conditions));
endclock=cell(1,length(conditions));
elapsedvec=zeros(1,length(conditions));



