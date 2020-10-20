% ltspice http://jeastham.blogspot.com/2009/10/adding-lm741-op-amp-model-to-ltspice.html
% Bode plot demo 
R = const.Part1.Res;
C = eval(const.Part1.Cap);

coef1 = -(R*C)^2;
coef2 = sqrt(2)*R*C;

H = tf(1,[coef1 coef2 1])
bode(H)