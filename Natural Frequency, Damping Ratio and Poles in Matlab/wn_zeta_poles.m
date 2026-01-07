% Clear workspace and command window
clc; clear;

% 1. Define State-Space Matrices
% A (2x2), B (2x1), C (1x2), D (1x1)
A = [0 1; -36 -8];
B = [0; 1];
C = [1 0];
D = 0;

% 2. Create the State-Space system object
% Note: Ensure Control System Toolbox is installed for ss() and damp()
sys = ss(A, B, C, D);

% 3. Calculate natural frequency (wn), damping ratio (zeta), and poles
[wn, zeta, poles] = damp(sys);

% 4. Extract primary values (for a 2nd order system, both poles are same)
Wn_val = wn(1);
Zeta_val = zeta(1);

% 5. Display numerical results
fprintf('--- System Analysis Results ---\n');
fprintf('Natural Frequency (wn): %.2f rad/s\n', Wn_val);
fprintf('Damping Ratio (zeta):   %.2f\n', Zeta_val);
disp('System Poles:');
disp(poles);

% 6. Logic to determine and display damping type
if Zeta_val < 1 && Zeta_val > 0
    fprintf('System Classification: Underdamped\n');
elseif Zeta_val == 1
    fprintf('System Classification: Critically Damped\n');
elseif Zeta_val > 1
    fprintf('System Classification: Overdamped\n');
elseif Zeta_val == 0
    fprintf('System Classification: Undamped\n');
else
    fprintf('System Classification: Unstable\n');
end

% 7. Optional: Plot the step response to visualize the behavior
figure;
step(sys);
title(['Step Response (Zeta = ', num2str(Zeta_val), ')']);
grid on;
