% Make sparse design matrix;

FILE=uigetfile()
load (FILE)

BLANKMAT=zeros(240,10);

for i =1:length(DATA.BLOCK1)
    if DATA.BLOCK1(i,3)==0
        fprintf('0')
    else 
        BLANKMAT(i,newdat.BLOCK1(i,3))=1;
    end
end

BLANKMAT2=sparse(BLANKMAT);

