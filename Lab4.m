% Lab 4 - Simulation of two ray(ground) reflection model in MATLAB
clc;
close all;
clear all;

% Defining Values
Pt = 1;
ht = 50;
hr = 2;
d = 1:0.1:10^5;
f1 = 900*10^6;
f2 = 1800*10^6;
f3 = 2700*10^6;
F = 2.4*10^9;
c = 3*10^8;
Glos = 1;
Gref = 1;
R = -1;

% Calculating values
Dref = sqrt((d.^2)+(ht+hr)^2);
Dlos = sqrt((d.^2)+(ht-hr)^2);

delta = Dref-Dlos;

phi1 = (2*pi*delta)/(c/f1);
phi2 = (2*pi*delta)/(c/f2);
phi3 = (2*pi*delta)/(c/f3);
phiF = (2*pi*delta)/(c/F);

Pr1 = Pt * ((c/f1)/4*pi)^2 * abs((sqrt(Glos)./Dlos) + ((R.*sqrt(Gref)./Dref).*exp(-1i*phi1)));
PrdB1 = 10*log10(Pr1);

Pr2 = Pt * ((c/f2)/4*pi)^2 * abs((sqrt(Glos)./Dlos) + ((R.*sqrt(Gref)./Dref).*exp(-1i*phi2)));
PrdB2 = 10*log10(Pr2);

Pr3 = Pt * ((c/f3)/4*pi)^2 * abs((sqrt(Glos)./Dlos) + ((R.*sqrt(Gref)./Dref).*exp(-1i*phi3)));
PrdB3 = 10*log10(Pr3);

PrF = Pt * ((c/F)/4*pi)^2 * abs((sqrt(Glos)./Dlos) + ((R.*sqrt(Gref)./Dref).*exp(-1i*phiF)));
PrdBF = 10*log10(PrF);

% Plotting
subplot(2,1,1)
semilogx(d,Pr1)
hold on
semilogx(d,Pr2)
semilogx(d,Pr3)
semilogx(d,PrF)
xlabel("Distance")
ylabel("Received Power")
legend("f1 = 900Mhz","f2 = 1800Mhz","f3 = 2700Mhz","F = 2.4Ghz")
subplot(2,1,2)
semilogx(d,PrdB1)
hold on
semilogx(d,PrdB2)
semilogx(d,PrdB3)
semilogx(d,PrdBF)
xlabel("Distance")
ylabel("Received Power(in dB)")
legend("f1 = 900Mhz","f2 = 1800Mhz","f3 = 2700Mhz","F = 2.4Ghz")