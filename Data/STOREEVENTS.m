DATA.(sprintf('BLOCK%d',RUN))=allconds;

BLANKMAT=zeros(240,max(DATA.(sprintf('BLOCK%d',RUN))(:,3)));

for i =1:length(DATA.(sprintf('BLOCK%d',RUN)))
    if DATA.(sprintf('BLOCK%d',RUN))(i,3)==0
        fprintf('0')
    else 
        BLANKMAT(i,DATA.(sprintf('BLOCK%d',RUN))(i,3))=1;
    end
end

BLANKMAT2=sparse(BLANKMAT);

DATA.DESIGN{RUN}=BLANKMAT2;
imwrite(imresize(BLANKMAT,10),strcat('Data/',filename,'/','Design',num2str(RUN),'.png'));

A=strcat('Data/',filename,'/',filename);
save(A,'DATA','const','scr')


if RUN==4
    MAKEEVENTFILES
else
end






clearvars -except filename DATA STIMULI istest
