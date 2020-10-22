
% 2.3
LowPass=fir1(40,0.3,'low'); % use this to filter the first channel 
% figure;freqz(LowPass)
HighPass=fir1(40,0.3,'high'); % use this to filter the first channel 
figure;freqz(HighPass)

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
% channel1=cos(2*pi*0.2*(1:length(x))).*x;
y1=filter(LowPass,1,x);
Y1 = fft(y1);
n = (length(Y1)-1)/2;
f = (-n:n)/n/2;
subplot(2,2,3);
plot(f,fftshift(abs(Y1)));
title('2.3.b Channel 1 (y1)');

% channel2=cos(2*pi*0.4*(1:length(x))).*x;
% y2=filter(HighPass,1,channel2);
% Y2 = fft(y2);
% n = (length(Y2)-1)/2;
% f = (-n:n)/n/2;
% subplot(2,2,4);
% plot(f,fftshift(abs(Y2)));
% title('2.3.b Channel 1 (y2)');
