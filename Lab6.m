% Lab 6 - Simulation of Doppler effect in MATLAB

close all;
clc;
clear all;

% Parameters
f = 2.4*10^9; % Hz
f1 = 900 * 10^6;
f2 = 1800 * 10^6;
c = 3*10^8; % m/s
v = 80; % m/s
d = 1000; % m

% Calculating lambda (l)
l = c/f;
l1 = c/f1;
l2 = c/f2;

% Doppler Shift vs Theta
for i = 1:181
    theta = (i-1) * pi/180;
    ds(i) = (v/l) * cos(theta);
    ds1(i) = (v/l1) * cos(theta);
    ds2(i) = (v/l2) * cos(theta);
end

% Plotting
theta_deg = 0:180;
plot(theta_deg, ds);
xlabel('Angle (degrees)');
ylabel('Doppler Shift');
title('Doppler Shift vs Theta');
hold on;
plot(theta_deg,ds1);
plot(theta_deg,ds2);
legend('f=2.4GHz','f1=900MHz','f2=1800MHz')