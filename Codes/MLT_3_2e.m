clc;
close all;
clear all;

bits = [0 1 0 1 1 0 1 1];
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;

lastlevel = 0;
lastnonzero = -5;
x = zeros(1, length(t));

for i=1:length(bits)
    if bits(i) == 0
        x((i-1)*n+1: i*n) = lastlevel;
    else
        if lastlevel == 0
            lastnonzero = lastnonzero * (-1);
            x((i-1)*n+1: i*n) = lastnonzero;
            lastlevel = lastnonzero;
            
        else
            lastlevel = 0;
        end
    end
end

plot(t,x, 'Linewidth', 2);
grid on;
title('MLT-3');

%decoding
lastlevel = 0;
lastnonzero = -5;
y = ones(1, length(x)/n);

for i = 1:length(y)
    if (x((i-1)*n+1) == lastlevel)
        y(i) = 0;
    else
        lastlevel = x((i-1)*n+1);
    end
end

disp(y);

