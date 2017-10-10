
% If it is a test then print the condition labels for debugging.
if istest==1
    WaitSecs(const.TR-(const.DUR+(slack*2)));
    if conditions(p,3)~=0
        
        fprintf('Trial_%d_Stimulus type_%s__%s_Model_%d_\n',p,structtype(p,:),txt.expressionlabel{conditions(p,4)},conditions(p,5))
    else
        fprintf('Trial_%d_NULLTRIAL\n',p)
    end
else
    
    [x,count]=fread(s2,1);
    
end

% Print to the log file when pulse is recieved.
log_txt=sprintf('Pulse recieved at %s',num2str(clock));
fprintf(log_text_fid,'%s\n',log_txt);