% Define the numerator and denominator coefficients
num = [1 3];
% Denominator: (s+2)(s^2 + 4s + 13) = s^3 + 6s^2 + 21s + 26
den = conv([1 2], [1 4 13]);

% Create transfer function
G = tf(num, den);

% Plot Root Locus
figure;
rlocus(G);
title('Root Locus of G(s) = (s+3) / [(s+2)(s^2+4s+13)]');
grid on;
