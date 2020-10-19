% ltspice http://jeastham.blogspot.com/2009/10/adding-lm741-op-amp-model-to-ltspice.html
% Bode plot demo 
H = tf([1 0.1 7.5],[1 0.12 9 0 0]);
bode(H)