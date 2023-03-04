clc;
close all;
clear all;

bits = [1 0 1 0 1 1 0 0];
%bits = input('Give a bit sequence: ');

%Encoding
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;

half = n/2;

%0->Positive To Negative
%1 -> Negative To Positive
for i = 1:length(bits)
    if(bits(i) == 0)
        x((i-1)*n+1:half) = 5;
        x(half+1: i*n) = -5;
    else
        x((i-1)*n+1:half) = -5;
        x(half+1: i*n) = 5;
    end
    half = half+n;
end
plot(t,x,'Linewidth', 2);
grid on;

%Decoding
y = zeros(1, length(x)/n);
for i=1:length(y)
    if x(((i-1)*n)+1) == -5
        y(i) = 1;
    end
end
disp(y);