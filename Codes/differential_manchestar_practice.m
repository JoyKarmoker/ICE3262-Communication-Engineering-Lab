clc;
close all;
clear all;

bits = [1 0 1 1 0 1 0 0];
n = 1000;
bitrate = 1;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;
half = n/2;

previous = 5;
x = zeros(1, length(t));
for i=1:length(bits)
    if bits(i) == 1
        x((i-1)*n+1: half) = previous;
        x(half+1: i*n) = previous *(-1);
        previous = previous *(-1);
    else
        previous = previous *(-1);
        x((i-1)*n+1: half) = previous;
        x(half+1: i*n) = previous *(-1);
        previous = previous *(-1);
        
    end
    half =half+n;
end
plot(t,x, 'Linewidth', 2);
grid on;
title('Differential Manchestar');


%Decode
previous = 5;
half = n/2;
y = zeros(1, length(x)/n);
for i=1:length(x)/n
    if x((i-1)*n+1: half) == previous
        y(i) = 1;
        previous = previous * (-1);
    end
    half = half + n;
end
disp(y);



