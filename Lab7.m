% Lab 7 - MATLAB implementation of power delay profile (PDP)

close all;
clc;
clear all;

pd = [0 1 3 5]; % Path Delays
pg_dB = [-20 -10 0 -10]; % Path Gain (dB)
pg_dB_1 = (-1).*pg_dB;

% Converting Path gain from dB to Linear
pg_l = 10.^(pg_dB / 10);

% Mean Delay Spread
mean_delay = sum(pg_l .* pd) / sum(pg_l);

% RMS Delay Spread
rms_delay = sqrt(sum(pg_l .* (pd - mean_delay).^2) / sum(pg_l));

% Displaying results
disp(['Mean Delay Spread: ', num2str(mean_delay)]);
disp(['RMS Delay Spread: ', num2str(rms_delay)]);

% Plotting Power Delay Profile (PDP)
stem(pd, pg_dB_1);
xlabel('Delay (ns)');
ylabel('Power (dB)');
title('Power Delay Profile (PDP)');