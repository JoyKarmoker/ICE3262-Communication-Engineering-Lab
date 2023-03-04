clc;
close all;
clear all;
f = 2;
dt = 0.01;
t = 0:dt:10;

%Genrating the original signal
x = sin(2*pi*f*t + (3*pi)/4);
figure(1)
subplot(2,1,1);
plot(t,x);
title('Original Signal');
subplot(2,1,2);
stem(t,x);
title('Digital Signal');

