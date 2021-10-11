clear all
close all
clc

Data = importdata('s4_s1.mat');
R=Data.recording(:,3:end-1);
Fs=256;
EE=[];
Ls=10*Fs;
X=R;
for i=1:length(X)/Ls
    S1=X(((i-1)*Ls)+1:(i*Ls),:);
    S2=X((i*Ls/2)+1:(i*Ls/2+Ls),:);
    S3=X((i*Ls/4)+1:(i*Ls/4+Ls),:);
    S4=X((i*Ls/5)+1:(i*Ls/5+Ls),:);
    S5=X((i*Ls/8)+1:(i*Ls/8+Ls),:);
    S6=X((i*Ls/10)+1:(i*Ls/10+Ls),:);
    EE=[EE S1 S6 S5 S4 S3 S2];
end

ns=size(EE,2);
TT=[];
for k=1:ns/14
    filename=sprintf('S4(%d).mat',k);
    T=EE(:,(k-1)*14+1:k*14);
    save(filename,'T');
end