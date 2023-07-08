clc;
close all;
clear all;

bits = [1 0 1 1 0 1 0];
n = 1000;
bitrate = 1;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;

half = n/2;
for i=1:length(bits)
    if bits(i) == 0
        x((i-1)*n+1:half) = 5;
        x(half+1:i*n) = -5;
    else
        x((i-1)*n+1:half) = -5;
        x(half+1:i*n) = 5;
    end
half = half+n;
end

plot(t,x, 'Linewidth', 2);
grid on;

%decode
y = zeros(1, length(x)/n);
half = n/2;
for i=1:length(y)
    if x((i-1)*n+1:half) == -5
        y(i) = 1;
    end
    half = half+n;
end
disp(y);




