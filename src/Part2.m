
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
title('X');

% a
soundsc(x,8000)

% b
% 
x1=exp(2i*pi*0.2*(1:length(x))).*x;
subplot(2,2,2);
plot(f,fftshift(abs(x1)));
title('2.1.b');

% c
% slight difference in amplitude compared to b
x2=real(exp(2i*pi*0.2*(1:length(x))).*x);
subplot(2,2,3);
plot(f,fftshift(abs(x2)));
title('2.1.c');

% d
x3=cos(2*pi*0.2*(1:length(x))).*x;
subplot(2,2,4);
plot(f,fftshift(abs(x3)));
title('2.1.d');
soundsc(x3,8000)

% 2.2
% a
x4=cos(2*pi*0.2*(1:length(x))).*x3;
figure
subplot(2,2,1);
plot(f,fftshift(abs(x4)));
title('2.2.a');
soundsc(x4,8000)

% b
h=fir1(40,0.2);
figure;freqz(h)

% c 
x5=filter(h,1,x4);
n = (length(x4) - 1)/2;
f = (-n:n)/n/2;
figure
subplot(2,2,1);
plot(f,fftshift(abs(x4)));
title('2.2.c');
soundsc(x5,8000)

% 2.3

