% Clear command window and workspace
clc, clear

% Define transfer functions
G1 = tf(4,1);
G2 = tf(2, conv([1 1],[1 8]));
G3 = tf(1, [1 0]);
H  = tf(0.2, 1);

% Calculate intermediate feedback loop
G4 = feedback(G2, H);

% Combine blocks in series
G5 = series(series(G1, G4), G3);

% Calculate final closed-loop transfer function with unity feedback
G = feedback(G5, 1)

% Plot pole-zero map
pzmap(G)
