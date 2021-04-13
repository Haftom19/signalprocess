%% TASK 4

B = randn(1,1000)/1000;                   % Random signal and normalized   
self_conv = conv(B, B)/sum(sum(B));       % Convolving signal by it self
 
figure                              %plotting normalized signal and self convolving
 subplot(1, 3, 1)
plot(B, 'g', 'DisplayName', 'Signal B');
title('Normal signal B')
hold on
subplot (1,3,2)
plot(self_conv, 'r', 'DisplayName', 'Signal C');
title('Self convolving siganl of B')



for i=1:10                         % creating for loop for convolving 10 more times
self_conv = conv(self_conv, B);
self_conv=self_conv/sum(sum(self_conv));     % normalized
end
subplot(1, 3, 3)
plot(self_conv, 'b', 'DisplayName', 'Signal C')
title('Self convolving with B x10')


% we can see that as the number of convolution increase and the frequency also increase become more depress.



%% TASK 5

%    convolving constant function 

B = ones(1,1000);  % generating constant numbers 
B = B/sum(sum(B));
self_conv = conv(B, B)/sum(sum(B));

figure
subplot(1, 3, 1)
plot(B, 'r');
title (" constant function ")
hold on
subplot(1,3,2)
plot(self_conv, 'b');
title("Self convolving of const function")

for i=1:10
self_conv = conv(self_conv, B);
self_conv=self_conv/sum(sum(self_conv)); % Normalized
end

subplot(1, 3, 3)
plot(self_conv, 'r')
title('self convolving with B x10')