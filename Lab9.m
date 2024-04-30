% Lab 9 - Implementation of Analytical BER over AWGN and Rayleigh Channel
% BER - Bit Error Rate
% AWGN - Additive White Gaussian Noise

close all;
clc;
clear all;

% Signal to Noise Ratio (SNR) range in dB
SNRdB = -4:2:12;
SNR = 10.^(SNRdB/10);

% BPSK modulation
M = 2;
constellation = [1 -1];

% Theoretical BER for BPSK modulation over AWGN channel
BER_AWGN = 0.5 * erfc(sqrt(SNR));

% Theoretical BER for BPSK modulation over Rayleigh fading channel
BER_Rayleigh = 0.5 * (1 - sqrt(SNR./(SNR+1)));

% Plotting the results
figure;
semilogy(SNRdB, BER_AWGN, 'b-', 'LineWidth', 2);
hold on;
semilogy(SNRdB, BER_Rayleigh, 'r-', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('Theoretical BER for BPSK Modulation');
legend('AWGN Channel', 'Rayleigh Channel');