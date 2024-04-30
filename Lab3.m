% Lab 3 - To study Effect of AWGN

clc;
clear all;
close all;

% Parameters
Fs = 1000;
T = 1;
t = 0:1/Fs:T-1/Fs;

% Signal Generation - Sinusoidal
F_signal = 10;
A_signal = 1;
sinusoidal_signal = A_signal * sin(2*pi*F_signal*t);

% Signal Generation - Square Wave
square_wave_signal = A_signal * square(2*pi*F_signal*t);

% Signal Generation - Ramp (Sawtooth) Wave
sawtooth_wave_signal = A_signal * sawtooth(2*pi*F_signal*t);

% Noise Generation
SNR_dB_values = [20, 10, -10];

% Original Signals
subplot(4, 3, 1)
plot(t, sinusoidal_signal, 'b');
title('Original Sinusoidal Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 3, 2)
plot(t, square_wave_signal, 'b');
title('Original Square Wave Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 3, 3)
plot(t, sawtooth_wave_signal, 'b');
title('Original Sawtooth Wave Signal');
xlabel('Time');
ylabel('Amplitude');

% Noisy Signals - 20dB
subplot(4, 3, 4)
plot(t, sinusoidal_signal + sqrt(var(sinusoidal_signal) / (10^(20/10))) * randn(size(t)), 'r');
title('Noisy Sinusoidal Signal - SNR: 20dB');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 3, 5)
plot(t, square_wave_signal + sqrt(var(square_wave_signal) / (10^(20/10))) * randn(size(t)), 'r');
title('Noisy Square Wave Signal - SNR: 20dB');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 3, 6)
plot(t, sawtooth_wave_signal + sqrt(var(sawtooth_wave_signal) / (10^(20/10))) * randn(size(t)), 'r');
title('Noisy Sawtooth Wave Signal - SNR: 20dB');
xlabel('Time');
ylabel('Amplitude');

% Noisy Signals - 10dB
subplot(4, 3, 7)
plot(t, sinusoidal_signal + sqrt(var(sinusoidal_signal) / (10^(10/10))) * randn(size(t)), 'r');
title('Noisy Sinusoidal Signal - SNR: 10dB');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 3, 8)
plot(t, square_wave_signal + sqrt(var(square_wave_signal) / (10^(10/10))) * randn(size(t)), 'r');
title('Noisy Square Wave Signal - SNR: 10dB');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 3, 9)
plot(t, sawtooth_wave_signal + sqrt(var(sawtooth_wave_signal) / (10^(10/10))) * randn(size(t)), 'r');
title('Noisy Sawtooth Wave Signal - SNR: 10dB');
xlabel('Time');
ylabel('Amplitude');

% Noisy Signals - (-10dB)
subplot(4, 3, 10)
plot(t, sinusoidal_signal + sqrt(var(sinusoidal_signal) / (10^(-10/10))) * randn(size(t)), 'r');
title('Noisy Sinusoidal Signal - SNR: -10dB');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 3, 11)
plot(t, square_wave_signal + sqrt(var(square_wave_signal) / (10^(-10/10))) * randn(size(t)), 'r');
title('Noisy Square Wave Signal - SNR: -10dB');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 3, 12)
plot(t, sawtooth_wave_signal + sqrt(var(sawtooth_wave_signal) / (10^(-10/10))) * randn(size(t)), 'r');
title('Noisy Sawtooth Wave Signal - SNR: -10dB');
xlabel('Time');
ylabel('Amplitude');