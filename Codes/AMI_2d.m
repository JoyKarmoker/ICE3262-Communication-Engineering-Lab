clc;
close all;
clear all;

bits = [1 1 1 1 0];
%bits = input('Give a input bit sequence: ');
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = length(bits) * n;
dt = T/N;
t = 0:dt:T-dt;

previous = -5; %Assuming Previous was -5;
x = zeros(1, length(t));
for i=1:length(bits)
    if(bits(i) == 1)
       x((i-1)*n+1: i*n) = previous * (-1);
       previous = previous * (-1);
    end
end
plot(t, x, 'Linewidth', 2);
grid on;
title('AMI');

%Decoding
y = zeros(1, length(x)/n);
for i=1:length(y)
    if(x((i-1)*n +1) ~= 0)
        y(i) = 1;
    end
end
disp(y);

