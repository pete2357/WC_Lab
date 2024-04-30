% Lab 10 - Simulation of BER over AWGN and Rayleigh Channel
% BER - Bit Error Rate
% AWGN - Additive White Gaussian Noise

close all;
clc;
clear all;

% Parameters
SNR_dB = -4:2:12; % SNR in dB
numBits = 10^6; % Number of bits
M = 2; % BPSK modulation
Eb_N0_dB = SNR_dB - 10*log10(log2(M)); % Convert SNR to Eb/N0

% Generate random binary data
data = randi([0 1], 1, numBits);

% Modulation
modulated_data = pskmod(data, M);

% AWGN Channel Simulation
for i = 1:length(Eb_N0_dB)
    % Add AWGN
    received_signal_awgn = awgn(modulated_data, Eb_N0_dB(i), 'measured');
    
    % Demodulation
    demodulated_data_awgn = pskdemod(received_signal_awgn, M);
    
    % Calculate Bit Errors
    bit_errors_awgn(i) = sum(demodulated_data_awgn ~= data);
end

% Calculate Bit Error Rate (BER) for AWGN
BER_awgn = bit_errors_awgn / numBits;

% Rayleigh Fading Channel Simulation
for i = 1:length(Eb_N0_dB)
    % Generate Rayleigh Fading Channel
    fading_channel = sqrt(0.5)*(randn(1, numBits) + 1i*randn(1, numBits));
    
    % Add Noise to Rayleigh Channel
    received_signal_rayleigh = modulated_data.*fading_channel + awgn(modulated_data, Eb_N0_dB(i), 'measured');
    
    % Demodulation
    demodulated_data_rayleigh = pskdemod(received_signal_rayleigh./fading_channel, M);
    
    % Calculate Bit Errors
    bit_errors_rayleigh(i) = sum(demodulated_data_rayleigh ~= data);
end

% Calculate Bit Error Rate (BER) for Rayleigh Fading Channel
BER_rayleigh = bit_errors_rayleigh / numBits;

% Plot
semilogy(SNR_dB, BER_awgn, 'b-o');
hold on;
semilogy(SNR_dB, BER_rayleigh, 'r-o');
grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
legend('AWGN Channel', 'Rayleigh Fading Channel');
title('Bit Error Rate (BER) vs SNR for BPSK modulation');