% ltspice http://jeastham.blogspot.com/2009/10/adding-lm741-op-amp-model-to-ltspice.html
% Bode plot demo 
% R = const.Part1.Res;
% C = eval(const.Part1.Cap);

% coef1 = -(R*C)^2;
% coef2 = sqrt(2)*R*C;

% H = tf(1,[coef1 coef2 1])
% bode(H)

% val = ButterworthTF(0);R = 1; L = 1; C = 1; % use values what you want
w = 1000:100:1000000; % define the frequency range
% H = 1./(1+(w.^2*L*C)+(1j*w*R*C));
H = ButterworthTF(w);
H0 = abs(H);
theta0 = angle(H);
subplot(211), plot(w,H0)
subplot(212), plot(w,theta0)