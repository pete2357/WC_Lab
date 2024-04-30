% Lab 2 - To Plot PDF (Probability Density Function) and
% CDF (Cumulative Distribution Function) of Gaussian, Rayleigh, and
% Uniform Random Variables(RV)

clear all;
close all;
clc;

% PDF and CDF of Gaussian RV
% Define parameters
mu_grv1 = 0;
mu_grv2 = -1;
mu_grv3 = 1;
sigma_grv1 = 2;
sigma_grv2 = 4;
sigma_grv3 = 8;

% Generate random samples
sample_size = 1000;
random_samples_grv1 = mu_grv1 + sigma_grv1 * randn(sample_size, 1);
random_samples_grv2 = mu_grv2 + sigma_grv2 * randn(sample_size, 1);
random_samples_grv3 = mu_grv3 + sigma_grv3 * randn(sample_size, 1);

% Compute PDF and CDF
x_grv = linspace(-10, 10, 1000);
pdf_values_grv1 = (1 / (sigma_grv1 * sqrt(2 * pi))) * exp(-(x_grv - mu_grv1).^2 / (2 * sigma_grv1^2));
cdf_values_grv1 = 0.5 * (1 + erf((x_grv - mu_grv1) / (sigma_grv1 * sqrt(2))));

pdf_values_grv2 = (1 / (sigma_grv2 * sqrt(2 * pi))) * exp(-(x_grv - mu_grv2).^2 / (2 * sigma_grv2^2));
cdf_values_grv2 = 0.5 * (1 + erf((x_grv - mu_grv2) / (sigma_grv2 * sqrt(2))));

pdf_values_grv3 = (1 / (sigma_grv3 * sqrt(2 * pi))) * exp(-(x_grv - mu_grv3).^2 / (2 * sigma_grv3^2));
cdf_values_grv3 = 0.5 * (1 + erf((x_grv - mu_grv3) / (sigma_grv3 * sqrt(2))));

% Plot PDF and CDF
% a)PDF
subplot(2, 3, 1)
plot(x_grv, pdf_values_grv1, 'LineWidth', 2);
title('PDF of Gaussian Random Variable');
xlabel('Random Variable(X)');
ylabel('PDF f(x)');
grid on;
hold on;
plot(x_grv, pdf_values_grv2, 'LineWidth', 2);
plot(x_grv, pdf_values_grv3, 'LineWidth', 2);
legend("μ=0,σ=2", "μ=-1,σ=4", "μ=1,σ=8");

% b)CDF
subplot(2, 3, 4)
plot(x_grv, cdf_values_grv1, 'LineWidth', 2);
title('CDF of Gaussian Random Variable');
xlabel('Random Variable(X)');
ylabel('CDF f(x)');
grid on;
hold on;
plot(x_grv, cdf_values_grv2, 'LineWidth', 2);
plot(x_grv, cdf_values_grv3, 'LineWidth', 2);
legend("μ=0,σ=2", "μ=-1,σ=4", "μ=1,σ=8");

% PDF and CDF of Rayleigh RV
% Define parameters
sigma_rrv1 = 1.5;
sigma_rrv2 = 2;
sigma_rrv3 = 2.5;

% Generate random samples
sample_size = 1000;
random_samples_rrv1 = sigma_rrv1 * randn(sample_size, 1);
random_samples_rrv2 = sigma_rrv2 * randn(sample_size, 1);
random_samples_rrv3 = sigma_rrv3 * randn(sample_size, 1);

% Compute PDF and CDF
x_rrv = linspace(0, 10, 1000);
pdf_values_rrv1 = (x_rrv ./ (sigma_rrv1^2)) .* exp(-(x_rrv).^2 / (2 * sigma_rrv1^2));
cdf_values_rrv1 = 1 - exp(-x_rrv.^2 / (2 * (sigma_rrv1^2)));

pdf_values_rrv2 = (x_rrv ./ (sigma_rrv2^2)) .* exp(-(x_rrv).^2 / (2 * sigma_rrv2^2));
cdf_values_rrv2 = 1 - exp(-x_rrv.^2 / (2 * (sigma_rrv2^2)));

pdf_values_rrv3 = (x_rrv ./ (sigma_rrv3^2)) .* exp(-(x_rrv).^2 / (2 * sigma_rrv3^2));
cdf_values_rrv3 = 1 - exp(-x_rrv.^2 / (2 * (sigma_rrv3^2)));

% Plot PDF and CDF
% a)PDF
subplot(2, 3, 2)
plot(x_rrv, pdf_values_rrv1, 'LineWidth', 2);
title('PDF of Rayleigh Random Variable');
xlabel('Random Variable(X)');
ylabel('PDF f(x)');
grid on;
hold on;
plot(x_rrv, pdf_values_rrv2, 'LineWidth', 2);
plot(x_rrv, pdf_values_rrv3, 'LineWidth', 2);
legend("σ=1.5", "σ=2", "σ=2.5");

% b)CDF
subplot(2, 3, 5)
plot(x_rrv, cdf_values_rrv1, 'LineWidth', 2);
title('CDF of Rayleigh Random Variable');
xlabel('Random Variable(X)');
ylabel('CDF f(x)');
grid on;
hold on;
plot(x_rrv, cdf_values_rrv2, 'LineWidth', 2);
plot(x_rrv, cdf_values_rrv3, 'LineWidth', 2);
legend("σ=1.5", "σ=2", "σ=2.5");

% PDF and CDF of Uniform RV
% Define Parameters
a_urv1 = 1;
a_urv2 = 2;
a_urv3 = 4;
b_urv1 = 4;
b_urv2 = 8;
b_urv3 = 16;

% Generate random samples
sample_size = 1000;
random_samples_urv1 = a_urv1 + (b_urv1 - a_urv1) * rand(sample_size, 1);
random_samples_urv2 = a_urv2 + (b_urv2 - a_urv2) * rand(sample_size, 1);
random_samples_urv3 = a_urv3 + (b_urv3 - a_urv3) * rand(sample_size, 1);

% Compute PDF and CDF
x_urv = linspace(0, 10, 1000);

pdf_values_urv1 = zeros(size(x_urv));
cdf_values_urv1 = zeros(size(x_urv));

pdf_values_urv2 = zeros(size(x_urv));
cdf_values_urv2 = zeros(size(x_urv));

pdf_values_urv3 = zeros(size(x_urv));
cdf_values_urv3 = zeros(size(x_urv));

for i = 1:length(x_urv)
    if x_urv(i) >= a_urv1 && x_urv(i) <= b_urv1
        pdf_values_urv1(i) = 1 / (b_urv1 - a_urv1);
        cdf_values_urv1(i) = (x_urv(i) - a_urv1) / (b_urv1 - a_urv1);
    end
end

for i = 1:length(x_urv)
    if x_urv(i) >= a_urv2 && x_urv(i) <= b_urv2
        pdf_values_urv2(i) = 1 / (b_urv2 - a_urv2);
        cdf_values_urv2(i) = (x_urv(i) - a_urv2) / (b_urv2 - a_urv2);
    end
end

for i = 1:length(x_urv)
    if x_urv(i) >= a_urv3 && x_urv(i) <= b_urv3
        pdf_values_urv3(i) = 1 / (b_urv3 - a_urv3);
        cdf_values_urv3(i) = (x_urv(i) - a_urv3) / (b_urv3 - a_urv3);
    end
end

% Plot PDF and CDF
% a)PDF
subplot(2, 3, 3)
plot(x_urv, pdf_values_urv1, 'LineWidth', 2);
title('Probability Density function of Uniform Random Variable');
xlabel('Random Variable(X)');
ylabel('PDF f(x)');
grid on;
hold on;
plot(x_urv, pdf_values_urv2, 'LineWidth', 2);
plot(x_urv, pdf_values_urv3, 'LineWidth', 2);
legend("a=1, b=4", "a=2, b=8", "a=4, b=16");

% b)CDF
subplot(2, 3, 6)
plot(x_urv, cdf_values_urv1, 'LineWidth', 2);
title('Cumulative Distribution function of Uniform Random Variable');
xlabel('Random Variable(X)');
ylabel('CDF f(x)');
grid on;
hold on;
plot(x_urv, cdf_values_urv2, 'LineWidth', 2);
plot(x_urv, cdf_values_urv3, 'LineWidth', 2);
legend("a=1, b=4", "a=2, b=8", "a=4, b=16");