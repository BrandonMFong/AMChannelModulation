% ltspice http://jeastham.blogspot.com/2009/10/adding-lm741-op-amp-model-to-ltspice.html
w = 1000:100:1000000; % define the frequency range
H = ButterworthTF(w);
H0 = abs(H);
theta0 = angle(H);
subplot(211), semilogx(w,20*log10(H0))
subplot(212), semilogx(w,theta0)

