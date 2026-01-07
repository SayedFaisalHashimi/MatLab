
num = 1;
den = conv(conv([1 1], [1 3]), [1 5]);

G = tf(num, den);

%gain 
K = 0:1:5000;

% Root Locus graph
figure;
rlocus(G, K);
grid on;
title(' 3rd Degree Root Locus  (K = 0–1000)');
