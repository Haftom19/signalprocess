close all; clear; clc;
% System parameters
Fs = 1000;       % Sampling frequency [Hz]
T = 1/Fs;        % Sampling time step [s]
s = 2;           % Signal length [s]
L = s*Fs;        % Signal length (number of samples)
t = (0:L-1)*T;   % Time base
f = 0:1/s:Fs/2;  % Frequency base

n= 0.5; n2=2; n4=4; 

%In the excersice was observed that when noise is added to the original
%function, and this noise is normal distributed with a sigma=2  the
%reconstructed function still close to the original , but after this value
%the recontructed function is less and less similar, in the example is
%shown that when Amplitude vs frequency is plotted, it is already not possible 
%to distinguised the original signal parameters.  


%Evaluation of noise with sd= 0.5
x = Signal_creation(L,t,n); %Function that creates signal
[Y,A,P] = FastFourierTransform(x,L); %Function that applies FFT(x);
[Amplitude,Frequency,PhaseShift] = ObtainValues (Y,A,P); %Function that extract the values from FFT(x);

%Evaluation of noise with sd= 2
x2 = Signal_creation(L,t,n2);
[Y2,A2,P2] = FastFourierTransform(x2,L);
[Amplitude2,Frequency2,PhaseShift2] = ObtainValues (Y2,A2,P2);

%Evaluation of noise with sd= 4
x4 = Signal_creation(L,t,n4);
[Y4,A4,P4] = FastFourierTransform(x4,L);
[Amplitude4,Frequency4,PhaseShift4] = ObtainValues (Y4,A4,P4);


%Reconstruction of the signals
r = (sum(Amplitude' .* cos(2 * pi * Frequency' * t + PhaseShift')));
r2 = (sum(Amplitude2' .* cos(2 * pi * Frequency2' * t + PhaseShift2')));
r4 = (sum(Amplitude4' .* cos(2 * pi * Frequency4' * t + PhaseShift4')));

plotreconstructions(x,x2,x4,r,r2,r4);
plotavsf(f,A,A2,A4,P,P2,P4);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x =Signal_creation(L,t,n)
N = 3;               % Number of signals
A = [1.0   0.4  0.8]; % Amplitude
B = [ 15    27   83]; % Frequency [Hz]
C = [  0 -pi/3 pi/7]; % Phase shift
x = (sum(A' .* cos(2 * pi * B' * t + C')))'+ (n * randn(L,1)); %adding of noise
end

function [Y,A,P] = FastFourierTransform(x,L)
Y = fft(x);     % Fast Fourier Transform
A = abs(Y);     % Amplitude
A = A/L;        % Amplitude normalization
A = A(1:L/2+1); % Cut important part 
A(2:end-1) = 2*A(2:end-1);
P = angle(Y);   % Phase
P = P(1:L/2+1); % Cut important part
end

function [Amplitude,Frequency,PhaseShift] = ObtainValues (Y,A,P)
[Amp,Freq]= sort(A); %Function is sorted in ascending order 
for i = 1:3
    j=i+998; %3 biggest values
    F(i) = Freq(j); 
    Amplitude(i) = Amp(j); %Extraction of Amplitude
    Frequency(i) = (F(i)-1)/2; %Extraction of Frequency
    PhaseShift(i) = P(F(i)); %Extraction of PhaseShift
end
end

function plotreconstructions(x,x2,x4,r,r2,r4)
% Plots
figure;
tiledlayout(3,1); nexttile;
plot(x,'Color',[0.5,0.5,0.5]);hold on;
plot(r,'Color',[0 0 0],'LineWidth',1.5);hold off;
title ('Original vs Reconsttructed (sigma=0.5)');
nexttile;
plot(x2,'Color',[0.5,0.5,0.5]);hold on;
plot(r2,'Color',[0 0 0],'LineWidth',1.5);hold off;
title ('Original vs Reconsttructed (sigma=2)');
nexttile;
plot(x4,'Color',[0.5,0.5,0.5]);hold on;
plot(r4,'Color',[0 0 0],'LineWidth',1.5);hold off;
title ('Original vs Reconstructed (sigma=4)');
end

function plotavsf(f,A,A2,A4,P,P2,P4)
figure; tiledlayout(3,1);
nexttile; plot(f, A); title ('Amplitude Vs Frequency (Hz)  (sigma=0.5)');
nexttile; plot (f,A2); title ('Amplitude Vs Frequency (Hz) (sigma=2)');
nexttile; plot (f,A4); title ('Amplitude Vs Frequency (Hz) (sigma=4)');
figure; tiledlayout(3,1);
nexttile; plot(f, P); title ('Phase Vs Frequency (Hz) (sigma=0.5)');
nexttile; plot (f,P2); title ('Phase Vs Frequency (Hz)(sigma=2)');
nexttile; plot (f,P4); title ('Phase Vs Frequency (Hz) (sigma=4)');
end