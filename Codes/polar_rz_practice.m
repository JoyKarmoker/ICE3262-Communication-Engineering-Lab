clc;
close all;
clear all;

bits = [1 0 0 1 1 0 1];
n = 1000;
half = n/2;
bitrate = 1;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;

%encoding
for i=1:length(bits)
    if bits(i) == 1
        x((i-1)*n+1:half) = 5;
        x(half+1:i*n) = 0;
    else
        x((i-1)*n+1:half) = -5;
        x(half+1:i*n) = 0;
    end
    half = half+n;
end

subplot(2,1,1);
plot(t,x, 'Linewidth', 2);
grid on;
title('Polar RZ');

%Decoding
y = zeros(1, length(x)/n);
half = n/2;
for i=1:length(y)
    if x((i-1)*n+1:half) == 5
        y(i) = 1;
    end;
    half = half+n;
end
disp(y);




