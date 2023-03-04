clc;
close all;
clear all;

bits = [1 0 1 0 1 0 1 0 1 1 1];
bitRate = 1;
n = 1000;
T = length(bits)/n;
N = length(bits)*n;
dt = T/N;
t = 0:dt:T-dt;
lastLevel = 0;
lastNonZero = -5;
x = zeros(1, length(t));

for i=1:length(bits)
    if (bits(i) == 0)
        x(((i-1)*n)+1 : i*n) = lastLevel;
    else
        if( lastLevel == 0)
            lastNonZero = lastNonZero * (-1);
            x(((i-1)*n)+1 : i*n) = lastNonZero;
            lastLevel = lastNonZero;
        else
            lastLevel = 0;
        end    
    end
end
plot(t,x, 'Linewidth', 2);
grid on;
title('MLT-3');
ax = gca;
ax.XAxis.Exponent = -3;

%decoding
y = ones(1, length(x)/n);
lastLevel = 0;
lastNonZero = -5;

for i=1:length(y)
    if(x((i-1)*n+1) == lastLevel)
        y(i) = 0;
    else
        lastLevel = x((i-1)*n+1);
    end
end

disp(y);

