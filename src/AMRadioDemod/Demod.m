
% 2.3
WnCh1 = 0.5;
Ch1Filter=fir1(40,WnCh1); % use this to filter the first channel 
figure;freqz(Ch1Filter)
title('Filter for Ch1');
WnCh2 = 0.5;
Ch2Filter=fir1(40,WnCh2,'high'); % use this to filter the first channel 
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
% channel1=x;
channel1=filter(Ch1Filter,1,x);
Y1 = fft(channel1);
n = (length(Y1)-1)/2;
f = (-n:n)/n/2;
subplot(2,2,3);
plot(f,fftshift(abs(Y1)));
title('2.3.b Channel 1 (y1)');

% filter channel 2
channel2=filter(Ch2Filter,1,x);
Y2 = fft(channel2);
n = (length(Y2)-1)/2;
f = (-n:n)/n/2;
subplot(2,2,4);
plot(f,fftshift(abs(Y2)));
title('2.3.b Channel 2 (y2)');

% TODO center the channels to the center frequency
figure 
DemodFilter=fir1(40,0.2);
% c
DemodCh1 = cos(2*pi*0.2*(1:length(channel1))).*channel1; % Demodulate with cos()
DMY1 = fft(filter(DemodFilter,1,DemodCh1))./2;
n = (length(DMY1)-1)/2;
f = (-n:n)/n/2;
subplot(1,2,1);
plot(f,fftshift(abs(DMY1)));
title('2.3.c Channel 1 Demodulated (y1)');
% soundsc(real(DemodCh1(1:8:end)),8000);

DemodCh2 = cos(2*pi*0.4*(1:length(channel2))).*channel2; % Demodulate with cos()
DMY2 = fft(filter(DemodFilter,1,DemodCh2))./2;
n = (length(DMY2)-1)/2;
f = (-n:n)/n/2;
subplot(1,2,2);
plot(f,fftshift(abs(DMY2)));
title('2.3.c Channel 2 Demodulated (y2)');
soundsc(real(DemodCh2(1:8:end)),8000);

% soundsc(real(channel1(1:8:end)),8000);
% soundsc(real(channel2(1:8:end)),8000); % 7 NATIONS