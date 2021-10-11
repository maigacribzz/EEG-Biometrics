close all
clear all
clc

tic
fs=256; % Sampling Frequency
%% Data Input
x=importdata('Subject 3\S3(15).mat'); % Import EEG data from the Subject Folder
t=(0:length(x)-1)/fs; % Defining the Time Axis

%% Display the Raw Data in Time & Frequency Domain
figure
for qq=1:size(x,2)
subplot(7,2,qq)
plot(t,x(:,qq),'LineWidth',1.5) % Plot the Raw Time Domain Version of EEG channels
xlabel('Time (sec)')
ylabel(['Channel ',num2str(qq)])
grid on
set(gca,'FontSize',10,'FontWeight','b')
end
sgtitle('Raw Time Domain Plots for 14 - Channel EEG Data','FontSize',20,'FontWeight','b')

fr=linspace(-fs/2,fs/2,length(x)); % Defining the Frequency Axis
figure
for qq=1:size(x,2)
X=(2/length(x))*fftshift(fft(x(:,qq))); % Fast Fourier Transform (FFT) of current EEG Channel with DC symmetry
subplot(7,2,qq)
plot(fr,abs(X),'LineWidth',1.5) % Plot the Raw Frequency Domain Version of EEG channels (abs() for magnitude)
xlabel('Frequency (Hz)')
ylabel(['Channel ',num2str(qq)])
grid on
set(gca,'FontSize',10,'FontWeight','b')
end
sgtitle('Raw Frequency Domain (Magnitude Spectrum) Plots for 14 - Channel EEG Data','FontSize',20,'FontWeight','b')

Feature=[];
PS=[];
for j=1:14 % Loop through the EEG Channels (1 to 14)
    rs=x(:,j); % The jth Column
    %% Preprocessing
    d1= designfilt('highpassiir','FilterOrder',4, ...
         'PassbandFrequency',0.5,'PassbandRipple',0.2, ...
         'SampleRate',fs); % Defining the High Pass Filter with Order 4, Passband Frequency 0.5
    ps = filtfilt(d1,rs); % Apply the filter on the jth EEG Channel
    PS=[PS ps]; % Saving the Preprocessed EEG channels for future Plots
    %% Feature Extraction
%     sfeat =extractTDFeatures(ps); % Extraction of features of length 4 from the denoised jth EEG Channel
%     Feature=[Feature sfeat]; % Serial Concatenation of all features extracted from preprocessed jth EEG Channels
end

%% Display the Preprocessed Data in Time & Frequency Domain
figure
for qq=1:size(PS,2)
subplot(7,2,qq)
plot(t,PS(:,qq),'LineWidth',1.5) % Plot the Preprocessed Time Domain Version of EEG channels
xlabel('Time (sec)')
ylabel(['Channel ',num2str(qq)])
grid on
set(gca,'FontSize',10,'FontWeight','b')
end
sgtitle('Preprocessed Time Domain Plots for 14 - Channel EEG Data','FontSize',20,'FontWeight','b')

fr=linspace(-fs/2,fs/2,length(PS));
figure
for qq=1:size(PS,2)
X=(2/length(PS))*fftshift(fft(PS(:,qq))); % Fast Fourier Transform (FFT) of Preprocessed EEG Channel with DC symmetry
subplot(7,2,qq)
plot(fr,abs(X),'LineWidth',1.5) % Plot the Preprocessed Frequency Domain Version of EEG channels
xlabel('Frequency (Hz)')
ylabel(['Channel ',num2str(qq)])
grid on
set(gca,'FontSize',10,'FontWeight','b')
end
sgtitle('Preprocessed Frequency Domain (Magnitude Spectrum) Plots for 14 - Channel EEG Data','FontSize',20,'FontWeight','b')






% trainingData = readtable('Features.xlsx');
% vp=trainSVMQ(trainingData);
% 
% %% Prediction
% test=Feature; 
% validationPredictions = vp(test);
% disp('The Predicted Class of the Input Signal is:');
% XX = ['Subject ',num2str(validationPredictions)];
% disp(XX);

toc