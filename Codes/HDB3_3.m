clc;
close all;
clear all;

bits = [1 0 0 0 0 1 1 0 0 0 0 1 1];
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = length(bits) * n;
dt = T/N;
t = 0:dt:T-dt;

previous = -5; %Assuming Previous was -5;
x = zeros(1, length(t));
onecount = 0;
zerocount = 0;
for i=1:length(bits)
    if(bits(i) == 1)
        previous = previous * (-1);
       x((i-1)*n+1: i*n) = previous;
       onecount = onecount + 1;
    else
        zerocount = zerocount + 1;
    end
    
    if zerocount == 4
        if mod(onecount, 2) == 0
            previous = previous * (-1);
            x((i-4)*n+1: (i-3)*n) = previous; % B
            x((i-1)*n+1: (i)*n) = previous; % v
           onecount = 0;
        else
            x((i-1)*n+1: (i)*n) = previous; % v
            onecount = 0;
        end
        zerocount = 0;
    end
end
plot(t, x, 'Linewidth', 2);
grid on;
title('HDB3');

%decoding
y = zeros(1, length(x)/n);
previous = -5;
for i=1:length(y)
    if x((i-1)*n+1:i*n) == previous
        y(i) = 0;
        y(i-1) = 0;
        y(i-2) = 0;
        y(i-3) = 0;
    elseif x((i-1)*n +1:i*n) ~= 0
        previous = x((i-1)*n+1);
        y(i) = 1;
    end;
end
disp(y);

