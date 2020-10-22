
% 2.1
load proj2_wave1 
X = fft(x);
n = (length(X) - 1)/2;
f = (-n:n)/n/2;
figure
subplot(2,2,1);
plot(f,fftshift(abs(X)));
xlabel('Frequency / Sample Frequency');
ylabel('Fourier Magnitude');
title('2.1 X');

% a
soundsc(x,8000)

% b
% 
x1=exp(2i*pi*0.2*(1:length(x))).*x;
X1 = fft(x1);
n = (length(X1) - 1)/2;
f = (-n:n)/n/2;
subplot(2,2,2);
plot(f,fftshift(abs(X1)));
title('2.1.b');

% c
% slight difference in amplitude compared to b
x2=real(exp(2i*pi*0.2*(1:length(x))).*x);
X2 = fft(x2);
n = (length(X2) - 1)/2;
f = (-n:n)/n/2;
subplot(2,2,3);
plot(f,fftshift(abs(X2)));
title('2.1.c');

% d
x3=cos(2*pi*0.2*(1:length(x))).*x;
X3 = fft(x3);
n = (length(X3) - 1)/2;
f = (-n:n)/n/2;
subplot(2,2,4);
plot(f,fftshift(abs(X3)));
title('2.1.d');
soundsc(x3,8000)

% 2.2
% a
x4=cos(2*pi*0.2*(1:length(x))).*x3;
X4 = fft(x4);
n = (length(X4) - 1)/2;
f = (-n:n)/n/2;
figure
subplot(2,2,1);
plot(f,fftshift(abs(X4)));
title('2.2.a');
soundsc(x4,8000)

% b
h=fir1(40,0.2);
% figure;freqz(h)

% c 
x5=filter(h,1,x4);
X5 = fft(x5);
n = (length(X5) - 1)/2;
f = (-n:n)/n/2;
figure
subplot(2,2,1);
plot(f,fftshift(abs(X5)));
title('2.2.c');
soundsc(x5,8000)

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
channel1=cos(2*pi*0.2*(1:length(x))).*x;
y1=filter(LowPass,1,channel1);
Y1 = fft(y1);
n = (length(Y1)-1)/2;
f = (-n:n)/n/2;
subplot(2,2,3);
plot(f,fftshift(abs(Y1)));
title('2.3.b Channel 1 (y1)');

channel2=cos(2*pi*0.2*(1:length(x))).*x;
y2=filter(HighPass,1,channel2);
Y2 = fft(y2);
n = (length(Y2)-1)/2;
f = (-n:n)/n/2;
subplot(2,2,4);
plot(f,fftshift(abs(Y2)));
title('2.3.b Channel 1 (y2)');
