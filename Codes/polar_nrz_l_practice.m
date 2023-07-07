clc;
close all;
clear all;

bits = [1 0 1 1 0 0 1];
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;
x = zeros(1, length(t));

for i =1:length(bits)
    if(bits(i) == 1)
        x((i-1)*n+1:i*n) = -5;
    else
        x((i-1)*n+1:i*n) = 5;
    end
end
subplot(2,1,1);
plot(t,x, 'Linewidth', 2);
ylim([-5,5]);

y = zeros(1, length(x)/n);
for i=1:length(y)
    if x((i-1)*n+1) == -5
        y(i) = 1;
    end
end
disp(y);
