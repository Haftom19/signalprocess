%TASK 1
Sample = 1000;        % number of sample 
Period = 200;         %  period of the function
frequency= 1/Period;
amp = 1;         % Amplitude of signal
duty = 50;       % Duty cycle 
t = 0:1:Sample;
A = amp*square(2*pi*frequency.*t,duty);  % Generated Rectangular function 
plot (t,A ,'-b');
title ("Generated signal Add Gaussian noise")
hold on

% Generating Gaussian noise and adding to the rectangular signal 
mean = 0;
sigma = 0.1;
signal_noise = A + sigma*randn(size(A)) + mean;  %Adding noise
plot(signal_noise,'-b');
axis([0 1000 -1.5 1.5]);


%% TASK 2
%      creating simple 3 flters (1x3)

F1 = [1/3 1/3 1/3];      % Averaging filter
F2 = [1/4 1/2 1/4];      % Gaussian filter 
F3 = [-1 0 1];           % Edge-detecting filter

% Convolving siganl Signal noise with filters of size 1x3 

conv_F1 = conv(signal_noise, F1, "same");
conv_F2 = conv(signal_noise, F2, "same");
conv_F3 = conv(signal_noise, F3, "same");

figure

plot(t, conv_F1,'r');
title ("Average filter 1x3")
axis([0 1000 -1.5 1.5])

figure
plot(t, conv_F2,'b');
title ("gaussian filter 1x3")
axis([0 1000 -1.5 1.5])

figure
plot(t, conv_F3,'r');
title ("edge-detecting filter 1x3")
axis([0 1000 -1.5 1.5])


%    Expanding the filter to 1x5 size

nF1 = [1/3 1/3 1/3 1/3 1/3 1/3];  % Averaging filter  1x5
nF1 = nF1/sum(sum(nF1));          % Normalized filter of nF1

nF2 = [1/4 1/2 1/4 1/2 1/4 1/2];  % Gaussian filter 1x5
nF2 = nF2/sum(sum(nF2));          % Normalized filter of nF2

nF3 = [-1 0 1 0 -1];              % Edge-detecting filter 1x9
nF3 = nF3/sum(sum(nF3));          % Normalized filter of nF3

% Convolving siganl A with filters of size 1x5 

conv_1F1 = conv(signal_noise, nF1, "same");
conv_1F2 = conv(signal_noise, nF2, "same");
conv_1F3 = conv(signal_noise, nF3, "same");

figure
plot(t, conv_1F1,'b');
title ("Average filter 1x5")
axis([0 1000 -1.5 1.5])

figure
plot(t, conv_1F2,'r');
title ("gaussian filter 1x5")
axis([0 1000 -1.5 1.5])

figure
plot(t, conv_1F3,'b');
title ("edge-detecting filter 1x5")
axis([0 1000 -1.5 1.5])

% The Gaussian reduces the effect of noise present in the signal.
%It's usually used to blur the image or to reduce noise.

%Edge detection is the most familiar approach for detecting significant discontinuities in intensity values. Edges are local changes in the image intensity.
%Edges typically occur on the boundary between two regions

%The averaging filter is used in situations where is necessary 
%to smooth data that carrying high frequency distortion.



%%  TASK 3

%  Implementing convolution using function 

CF1 = convolution(signal_noise, F1);
CF2 = convolution(signal_noise, F2);
CF3 = convolution(signal_noise, F3);
CnF1 = convolution(signal_noise, nF1);
CnF2 = convolution(signal_noise, nF2);
CnF3 = convolution(signal_noise, nF3);


figure
subplot(2, 6, 1);
plot(t, conv_F1,'r');
title ("Average filter 1x3")
axis([0 1000 -1.5 1.5])

subplot(2, 6, 2);
plot(t, conv_F2,'b');
title ("gaussian filter 1x3")
axis([0 1000 -1.5 1.5])

subplot(2, 6, 3);
plot(t, conv_F3,'r');
title ("edge-detecting filter 1x3")
axis([0 1000 -1.5 1.5])

subplot(2, 6, 4);
plot(t, conv_1F1,'b');
title ("Average filter 1x5")
axis([0 1000 -1.5 1.5])

subplot(2, 6, 5);
plot(t, conv_1F2,'r');
title ("gaussian filter 1x5")
axis([0 1000 -1.5 1.5])

subplot(2, 6, 6);
plot(t, conv_1F3,'b');
title ("edge-detecting filter 1x5")
axis([0 1000 -1.5 1.5])

%plotting with function
length(CF1);
t1=1:1:1003; 

subplot(2, 6, 7);
hold on
plot(t1, CF1,'r');
title ("Average filter 1x3 with function")
axis([0 1000 -1.5 1.5])

subplot(2, 6, 8);
hold on
plot(t1, CF2,'b');
title ("Gaussian filter 1x3 with function")
axis([0 1000 -1.5 1.5])

subplot(2, 6,9);
hold on
plot(t1, CF3,'r');
title ("Edge detecting  filter 1x3 with function")
axis([0 1000 -1.5 1.5])
length(CnF1);
t2=1:1:1006;

subplot(2, 6, 10);
hold on
plot(t2, CnF1,'b');
title ("Average filter 1x5 with function")
axis([0 1000 -1.5 1.5])

subplot(2, 6, 11);
hold on
plot(t2, CnF2,'r');
title ("Gaussian filter 1x5 with function")
axis([0 1000 -1.5 1.5])
length(CnF3);
t3=1:1:1005;

subplot(2, 6, 12);
hold on
plot(t3, CnF3,'b');
title ("Edge detecting filter 1x5 with function")
axis([0 1000 -1.5 1.5])





