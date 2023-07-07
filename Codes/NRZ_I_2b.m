clc;
close all;
clear all;

bits = [1 0 1 1 0 1];
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;
previous = 5;

%Encoding
x = zeros(1, length(t));
for i = 1:length(bits)
    if(bits(i) == 1)
        x((i-1)*n +1: i*n) =  previous*(-1);
        previous = previous*(-1);
    else
        x((i-1)*n +1: i*n) = previous;
    end
end

subplot(2,1,1);
plot(t,x, 'Linewidth', 3);
title('Encoded Signal (NRZ-I)');
grid on;

%Decoding
y = ones(1, length(x)/n);
previous = 5;
for i=1:length(y)
    if x(((i-1)*n)+1) == previous
        y(i) = 0;
    else
        previous = previous * (-1);
    end
end
disp(y);
