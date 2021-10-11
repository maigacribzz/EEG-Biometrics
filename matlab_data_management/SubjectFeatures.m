close all
clear all
clc

tic
fs=256; % Sampling Frequency

%% Subject 1 Class
FT=[];
path='Subject 1'; % Path for Subject 1 Class
label=1; % Label = 1 for Subject 1 Class
dirListing = dir(fullfile(path, '*.mat')); % List of files in the folder 
for i = 1:length(dirListing) % Loop through the files in the folder
fileName = fullfile(path,dirListing(i).name); % Extracting the full file name of the ith EEG file
x=importdata(fileName); % Import EEG data from the loaded ith file
FF=[];
for j=1:14 % Loop through the EEG Channels (1 to 14)
    rs=x(:,j); % The jth Column
    %% Preprocessing
    d1= designfilt('highpassiir','FilterOrder',4, ...
         'PassbandFrequency',0.5,'PassbandRipple',0.2, ...
         'SampleRate',fs);
    ps = filtfilt(d1,rs);
    %% Feature Extraction
    sfeat = ExtractStatisticalFeatures(ps); % Extraction of features of length 4 from the denoised jth EEG Channel
    FF=[FF sfeat]; 
end
FT=[FT;FF]; 
disp('************')
disp('Subject 1')
disp(i)
disp('************')
end
FT1=[FT label*ones(i,1)]; % Appending Label as last Column


%% Subject 2 Class
FT=[];
path='Subject 2'; % Path for Subject 2 Class
label=2; % Label = 2 for Subject 2 Class
dirListing = dir(fullfile(path, '*.mat')); % List of files in the folder 
for i = 1:length(dirListing) % Loop through the files in the folder
fileName = fullfile(path,dirListing(i).name); % Extracting the full file name of the ith EEG file
x=importdata(fileName); % Import EEG data from the loaded ith file
FF=[];
for j=1:14 % Loop through the EEG Channels (1 to 14)
    rs=x(:,j); % The jth Column
    %% Preprocessing
    d1= designfilt('highpassiir','FilterOrder',4, ...
         'PassbandFrequency',0.5,'PassbandRipple',0.2, ...
         'SampleRate',fs);
    ps = filtfilt(d1,rs);
    %% Feature Extraction
    sfeat = ExtractStatisticalFeatures(ps); % Extraction of features of length 4 from the denoised jth EEG Channel
    FF=[FF sfeat]; % Serial Concatenation of all features extracted from preprocessed jth EEG Channels
end
FT=[FT;FF]; % Vertical Concatenation of all ith EEG Data files 
disp('************')
disp('Subject 2')
disp(i)
disp('************')
end
FT2=[FT label*ones(i,1)]; % Appending Label as last Column


%% Subject 3 Class
FT=[];
path='Subject 3'; % Path for Subject 1 Class
label=3; % Label = 3 for Subject 3 Class
dirListing = dir(fullfile(path, '*.mat')); % List of files in the folder 
for i = 1:length(dirListing) % Loop through the files in the folder
fileName = fullfile(path,dirListing(i).name); % Extracting the full file name of the ith EEG file
x=importdata(fileName); % Import EEG data from the loaded ith file
FF=[];
for j=1:14 % Loop through the EEG Channels (1 to 14)
    rs=x(:,j); % The jth Column
    %% Preprocessing
    d1= designfilt('highpassiir','FilterOrder',4, ...
         'PassbandFrequency',0.5,'PassbandRipple',0.2, ...
         'SampleRate',fs);
    ps = filtfilt(d1,rs);
    %% Feature Extraction
    sfeat = ExtractStatisticalFeatures(ps); % Extraction of features of length 4 from the denoised jth EEG Channel
    FF=[FF sfeat]; 
end
FT=[FT;FF]; 
disp('************')
disp('Subject 3')
disp(i)
disp('************')
end
FT3=[FT label*ones(i,1)]; % Appending Label as last Column



%% Subject 4 Class
FT=[];
path='Subject 4'; % Path for Subject 4 Class
label=4; % Label = 3 for Subject 3 Class
dirListing = dir(fullfile(path, '*.mat')); % List of files in the folder 
for i = 1:length(dirListing) % Loop through the files in the folder
fileName = fullfile(path,dirListing(i).name); % Extracting the full file name of the ith EEG file
x=importdata(fileName); % Import EEG data from the loaded ith file
FF=[];
for j=1:14 % Loop through the EEG Channels (1 to 14)
    rs=x(:,j); % The jth Column
    %% Preprocessing
    d1= designfilt('highpassiir','FilterOrder',4, ...
         'PassbandFrequency',0.5,'PassbandRipple',0.2, ...
         'SampleRate',fs);
    ps = filtfilt(d1,rs);
    %% Feature Extraction
    sfeat = ExtractStatisticalFeatures(ps); % Extraction of features of length 4 from the denoised jth EEG Channel
    FF=[FF sfeat]; 
end
FT=[FT;FF]; 
disp('************')
disp('Subject 4')
disp(i)
disp('************')
end
FT4=[FT label*ones(i,1)]; % Appending Label as last Column


%% Subject 5 Class
FT=[];
path='Subject 5'; % Path for Subject 5 Class
label=5; % Label = 3 for Subject 5 Class
dirListing = dir(fullfile(path, '*.mat')); % List of files in the folder 
for i = 1:length(dirListing) % Loop through the files in the folder
fileName = fullfile(path,dirListing(i).name); % Extracting the full file name of the ith EEG file
x=importdata(fileName); % Import EEG data from the loaded ith file
FF=[];
for j=1:14 % Loop through the EEG Channels (1 to 14)
    rs=x(:,j); % The jth Column
    %% Preprocessing
    d1= designfilt('highpassiir','FilterOrder',4, ...
         'PassbandFrequency',0.5,'PassbandRipple',0.2, ...
         'SampleRate',fs);
    ps = filtfilt(d1,rs);
    %% Feature Extraction
    sfeat = ExtractStatisticalFeatures(ps); % Extraction of features of length 4 from the denoised jth EEG Channel
    FF=[FF sfeat]; 
end
FT=[FT;FF]; 
disp('************')
disp('Subject 5')
disp(i)
disp('************')
end
FT5=[FT label*ones(i,1)]; % Appending Label as last Column



%% Subject 6 Class
FT=[];
path='Subject 6'; % Path for Subject 6 Class
label=6; % Label = 6 for Subject 6 Class
dirListing = dir(fullfile(path, '*.mat')); % List of files in the folder 
for i = 1:length(dirListing) % Loop through the files in the folder
fileName = fullfile(path,dirListing(i).name); % Extracting the full file name of the ith EEG file
x=importdata(fileName); % Import EEG data from the loaded ith file
FF=[];
for j=1:14 % Loop through the EEG Channels (1 to 14)
    rs=x(:,j); % The jth Column
    %% Preprocessing
    d1= designfilt('highpassiir','FilterOrder',4, ...
         'PassbandFrequency',0.5,'PassbandRipple',0.2, ...
         'SampleRate',fs);
    ps = filtfilt(d1,rs);
    %% Feature Extraction
    sfeat = ExtractStatisticalFeatures(ps); % Extraction of features of length 4 from the denoised jth EEG Channel
    FF=[FF sfeat]; 
end
FT=[FT;FF]; 
disp('************')
disp('Subject 6')
disp(i)
disp('************')
end
FT6=[FT label*ones(i,1)]; % Appending Label as last Column






Feat=[FT1;FT2;FT3;FT4;FT5;FT6];

FFile='NewFeaturesss.xlsx';
writematrix(Feat,FFile);



toc