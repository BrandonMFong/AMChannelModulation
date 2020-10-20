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
soundsc(x,8000)