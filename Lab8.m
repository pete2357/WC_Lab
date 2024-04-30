% Lab 8 - MATLAB implementation of LDPLM and LNSPLM
% LDPLM - Log Distance Path Loss Model
% LNSPLM - Log Normal Shadowing Path Loss Model

clear all;
clc;
close all;

% Parameters
d_min = input('Enter the minimum distance between transmitter and receiver (meters): ');
d_max = input('Enter the maximum distance between transmitter and receiver (meters): ');
num_points = input('Enter the number of points for distance array: ');
d = linspace(d_min, d_max, num_points);
fc = input('Enter the carrier frequency (Hz): ');
Pt = input('Enter the transmitter power (dBm): ');
sigma_db = input('Enter the standard deviation of shadowing (dB): ');
c = 3e8; 

% Calculate free space path loss
lambda = c / fc;
L_fs = (lambda ./ (4 * pi * d)).^2;

% Calculate path loss using LDPLM
path_loss_ldplm = 10 * log10(L_fs) + Pt;

% Generate log-normal shadowing term
sigma = 10^(sigma_db / 10);
shadowing = sigma*randn();

% Calculate path loss using LNSPLM
path_loss_lnsplm = path_loss_ldplm + shadowing;

% Display results
disp(['LDPLM Path Loss: ' num2str(path_loss_ldplm)]);
disp(['LNSPLM Path Loss: ' num2str(path_loss_lnsplm)]);

% Plotting
ldplm = -path_loss_ldplm;
lnsplm = -path_loss_lnsplm;
figure;
subplot(2, 1, 1);
plot(d, ldplm);
xlabel('Distance (m)');
ylabel('Path Loss (dB)');
title('Log Distance Path Loss Model - Path Loss vs. Distance');
subplot(2, 1, 2);
plot(d, lnsplm);
xlabel('Distance (m)');
ylabel('Path Loss (dB)');
title('Log Normal Shadowing Path Loss Model - Path Loss vs. Distance');