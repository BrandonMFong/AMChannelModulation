
% 2.3
WnCh1 = [0.1 0.3];
Ch1Filter=fir1(40,WnCh1); % use this to filter the first channel 
figure;freqz(Ch1Filter)
title('Filter for Ch1');
WnCh2 = [0.3 0.5];
Ch2Filter=fir1(40,WnCh2,'stop'); % use this to filter the first channel 
figure;freqz(Ch2Filter)
title('Filter for Ch2');

load proj2_wave2 
x = double(x)/32768;
X = fft(x);
n = (length(X)-1)/2;
f = (-n:n)/n/2;
figure
subplot(2,2,1);
plot(f,fftshift(abs(X)));
xlabel('Frequency / Sample Frequency');
ylabel('Fourier Magnitude');
title('2.3 X');

% a
% Channel one: 0.20
% Channel two: 0.40

% b
% filter channel 1
channel1=filter(Ch1Filter,1,x);
Y1 = fft(channel1);
n = (length(Y1)-1)/2;
f = (-n:n)/n/2;
subplot(2,2,3);
plot(f,fftshift(abs(Y1)));
title('2.3.b Channel 1 (y1)');

% % filter channel 2
% channel2=filter(Ch2Filter,1,x);
% Y2 = fft(channel2);
% n = (length(Y2)-1)/2;
% f = (-n:n)/n/2;
% subplot(2,2,4);
% plot(f,fftshift(abs(Y2)));
% title('2.3.b Channel 2 (y2)');

