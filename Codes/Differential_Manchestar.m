clc;
close all;
clear all;
 
bits = [1 1 1 1 0];
%bits = input('Give a bits sequence: ');
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;

%0-> Transition
%1-> No transition
previous = -5; %Assuming previous was -5;
x = zeros(1, length(t));
half = n/2;
for i=1:length(bits)
    if(bits(i) == 1)
        x((i-1)*n + 1: half) = previous;
        x(half: i*n) = previous*(-1);
        previous = previous*(-1);
    else
        previous = previous * (-1);
        x((i-1)*n + 1: half) = previous;
        x(half: i*n) = previous*(-1);
        previous = previous*(-1);
    end
    half = half+n;
end

plot(t, x, 'Linewidth', 2);
grid on;
title('Differential Manchestar');

%Decoding
y = zeros(1, length(x)/n);
previous = -5;
for i=1:length(y)
    if x(((i-1)*n)+1) == previous
        y(i) = 1;
        previous = previous * (-1);
    end
end
disp(y);