 
% Make event files

B1=DATA.BLOCK1;
B2=DATA.BLOCK2;
B3=DATA.BLOCK3;
B4=DATA.BLOCK4;

B1=B1(B1(:,3)~=0,:);

B1UP=B1(B1(:,3)==1 | B1(:,3)==2,:);
B1INV=B1(B1(:,3)==3 | B1(:,3)==4,:);
B1UPINV=B1(B1(:,3)==5 | B1(:,3)==6,:);
B1INVINV=B1(B1(:,3)==7 | B1(:,3)==8,:);
B1SC=B1(B1(:,3)==9 | B1(:,3)==10,:);


B1UPFEAR=B1UP(B1UP(:,4)==1,:);
B1UPNEUT=B1UP(B1UP(:,4)==2,:);
B1INVFEAR=B1INV(B1INV(:,4)==1,:);
B1INVNEUT=B1INV(B1INV(:,4)==2,:);
B1INVINVFEAR=B1INVINV(B1INVINV(:,4)==1,:);
B1INVINVNEUT=B1INVINV(B1INVINV(:,4)==2,:);
B1UPINVFEAR=B1UPINV(B1UPINV(:,4)==1,:);
B1UPINVNEUT=B1UPINV(B1UPINV(:,4)==2,:);
B1SCFEAR=B1SC(B1SC(:,4)==1,:);
B1SCNEUT=B1SC(B1SC(:,4)==2,:);

B1UPFEARF=vertcat(B1UPFEAR(:,6:8));
B1UPNEUTF=vertcat(B1UPNEUT(:,6:8));

B1INVFEARF=vertcat(B1INVFEAR(:,6:8));
B1INVNEUTF=vertcat(B1INVNEUT(:,6:8));

B1INVINVFEARF=vertcat(B1INVINVFEAR(:,6:8));
B1INVINVNEUTF=vertcat(B1INVINVNEUT(:,6:8));

B1UPINVFEARF=vertcat(B1UPINVFEAR(:,6:8));
B1UPINVNEUTF=vertcat(B1UPINVNEUT(:,6:8));

B1SCFEARF=vertcat(B1SCFEAR(:,6:8));
B1SCNEUTF=vertcat(B1SCNEUT(:,6:8));

dlmwrite(strcat('Data/',filename,'/','B1UPFEAR.RUN001.txt'),B1UPFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B1UPNEUT.RUN001.txt'),B1UPNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B1INVFEAR.RUN001.txt'),B1INVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B1INVNEUT.RUN001.txt'),B1INVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B1INVINVFEAR.RUN001.txt'),B1UPINVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B1INVINVNEUT.RUN001.txt'),B1UPINVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B1UPINVFEAR.RUN001.txt'),B1INVINVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B1UPINVNEUT.RUN001.txt'),B1INVINVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B1SCFEAR.RUN001.txt'),B1SCFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B1SCNEUT.RUN001.txt'),B1SCNEUTF,'delimiter','\t');


%% 


B2=B2(B2(:,3)~=0,:);

B2UP=B2(B2(:,3)==1 | B2(:,3)==2,:);
B2INV=B2(B2(:,3)==3 | B2(:,3)==4,:);
B2UPINV=B2(B2(:,3)==5 | B2(:,3)==6,:);
B2INVINV=B2(B2(:,3)==7 | B2(:,3)==8,:);
B2SC=B1(B2(:,3)==9 | B2(:,3)==10,:);


B2UPFEAR=B2UP(B2UP(:,4)==1,:);
B2UPNEUT=B2UP(B2UP(:,4)==2,:);
B2INVFEAR=B2INV(B2INV(:,4)==1,:);
B2INVNEUT=B2INV(B2INV(:,4)==2,:);
B2INVINVFEAR=B2INVINV(B2INVINV(:,4)==1,:);
B2INVINVNEUT=B2INVINV(B2INVINV(:,4)==2,:);
B2UPINVFEAR=B2UPINV(B2UPINV(:,4)==1,:);
B2UPINVNEUT=B2UPINV(B2UPINV(:,3)==2,:);
B2SCFEAR=B2SC(B2SC(:,4)==1,:);
B2SCNEUT=B2SC(B2SC(:,4)==2,:);

B2UPFEARF=vertcat(B2UPFEAR(:,6:8));
B2UPNEUTF=vertcat(B2UPNEUT(:,6:8));

B2INVFEARF=vertcat(B2INVFEAR(:,6:8));
B2INVNEUTF=vertcat(B2INVNEUT(:,6:8));

B2INVINVFEARF=vertcat(B2INVINVFEAR(:,6:8));
B2INVINVNEUTF=vertcat(B2INVINVNEUT(:,6:8));

B2UPINVFEARF=vertcat(B2UPINVFEAR(:,6:8));
B2UPINVNEUTF=vertcat(B2UPINVNEUT(:,6:8));

B2SCFEARF=vertcat(B2SCFEAR(:,6:8));
B2SCNEUTF=vertcat(B2SCNEUT(:,6:8));

dlmwrite(strcat('Data/',filename,'/','B2UPFEAR.RUN002.txt'),B2UPFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B2UPNEUT.RUN002.txt'),B2UPNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B2INVFEAR.RUN002.txt'),B2INVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B2INVNEUT.RUN002.txt'),B2INVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B2INVINVFEAR.RUN002.txt'),B2UPINVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B2INVINVNEUT.RUN002.txt'),B2UPINVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B2UPINVFEAR.RUN002.txt'),B2INVINVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B2UPINVNEUT.RUN002.txt'),B2INVINVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B2SCFEAR.RUN002.txt'),B2SCFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B2SCNEUT.RUN002.txt'),B2SCNEUTF,'delimiter','\t');


%% 

B3=B3(B3(:,3)~=0,:);

B3UP=B3(B3(:,3)==1 | B3(:,3)==2,:);
B3INV=B3(B3(:,3)==3 | B3(:,3)==4,:);
B3UPINV=B3(B3(:,3)==5 | B3(:,3)==6,:);
B3INVINV=B3(B3(:,3)==7 | B3(:,3)==8,:);
B3SC=B1(B3(:,3)==9 | B3(:,3)==10,:);


B3UPFEAR=B3UP(B3UP(:,4)==1,:);
B3UPNEUT=B3UP(B3UP(:,4)==2,:);
B3INVFEAR=B3INV(B3INV(:,4)==1,:);
B3INVNEUT=B3INV(B3INV(:,4)==2,:);
B3INVINVFEAR=B3INVINV(B3INVINV(:,4)==1,:);
B3INVINVNEUT=B3INVINV(B3INVINV(:,4)==2,:);
B3UPINVFEAR=B3UPINV(B3UPINV(:,4)==1,:);
B3UPINVNEUT=B3UPINV(B3UPINV(:,3)==2,:);
B3SCFEAR=B3SC(B3SC(:,4)==1,:);
B3SCNEUT=B3SC(B3SC(:,4)==2,:);

B3UPFEARF=vertcat(B3UPFEAR(:,6:8));
B3UPNEUTF=vertcat(B3UPNEUT(:,6:8));

B3INVFEARF=vertcat(B3INVFEAR(:,6:8));
B3INVNEUTF=vertcat(B3INVNEUT(:,6:8));

B3INVINVFEARF=vertcat(B3INVINVFEAR(:,6:8));
B3INVINVNEUTF=vertcat(B3INVINVNEUT(:,6:8));

B3UPINVFEARF=vertcat(B3UPINVFEAR(:,6:8));
B3UPINVNEUTF=vertcat(B3UPINVNEUT(:,6:8));

B3SCFEARF=vertcat(B3SCFEAR(:,6:8));
B3SCNEUTF=vertcat(B3SCNEUT(:,6:8));

dlmwrite(strcat('Data/',filename,'/','B3UPFEAR.RUN002.txt'),B3UPFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B3UPNEUT.RUN002.txt'),B3UPNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B3INVFEAR.RUN002.txt'),B3INVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B3INVNEUT.RUN002.txt'),B3INVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B3INVINVFEAR.RUN002.txt'),B3UPINVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B3INVINVNEUT.RUN002.txt'),B3UPINVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B3UPINVFEAR.RUN002.txt'),B3INVINVFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B3UPINVNEUT.RUN002.txt'),B3INVINVNEUTF,'delimiter','\t');

dlmwrite(strcat('Data/',filename,'/','B3SCFEAR.RUN002.txt'),B3SCFEARF,'delimiter','\t');
dlmwrite(strcat('Data/',filename,'/','B3SCNEUT.RUN002.txt'),B3SCNEUTF,'delimiter','\t');




%% 
 
B4=B4(B4(:,3)~=0,:);

 B4F=B4(B4(:,3)==1,:);
 B4H=B4(B4(:,3)==2,:);
% % 
% % 
 B4FF=vertcat(B4F(:,6:8));
 B4HF=vertcat(B4H(:,6:8));
% % 
 dlmwrite(strcat('Data/',filename,'/','F.RUN004.txt'),B4FF,'delimiter','\t');
 dlmwrite(strcat('Data/',filename,'/','H.RUN004.txt'),B4HF,'delimiter','\t');

