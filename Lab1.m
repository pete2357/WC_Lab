% Lab 1 - Introduction to MATLAB

clc;
clear all;
close all;

% Representing Vectors
A = [4 5 6];
B = [3 7 11];
disp('A = ');
disp(A);
disp('B = ');
disp(B);

% Magnitude of Vector A
mA2 = 0;
for i = 1:3 % Change "i=i:3" to "i = 1:3"
    mA2 = mA2 + A(i)*A(i);
end
mA2 = sqrt(mA2);
disp('Magnitude of vector A = ');
disp(mA2);

% Angle made by vector with x-axis
angleR = atan2(5,4);
angleD = angleR*(180/pi);
disp('Angle made by vector with x-axis is = ');
disp(angleR);

% Dot Product
A1 = [-2 6];
B1 = [6 3];
C1 = dot(A1, B1);
disp('Dot Product is = ');
disp(C1);

% Cross Product
A2 = [3 2 7];
B2 = [7 -2 8];
C2 = cross(A2, B2);
disp('Cross Product is = ')
disp(C2)

% Matrix in MATLAB
M = [[pi, exp(pi)];
    [0 -1]];
disp('Matrix M is = ')
disp(M)

% Transpose of Matrix
Mt = M';
disp('Transpose of Matrix is = ');
disp(Mt);

% Converting Matrix to column vector
Mc = M(:);
disp('Column Vector of Matrix M is = ');
disp(Mc);

% Multiplication of Matrices
v = [3;
    4];
X = M*v;
disp('Multiplication of Matrices M and V is = ');
disp(X)