clc;
close all;
clear all;

bits = [1 0 0 0 0 0 0 0 0 1 1 1];
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
subplot(2,1,1);
plot(t, x, 'Linewidth', 2);
grid on;
title('AMI');
xlabel('Time');
ylabel('Amplitude');

y = ones(1, length(x)/n);
for i=1:length(y)
    if x((i-1)*n+1) == 0
        y(i) = 0;
    end;
end;
disp(y);

count = 0;
previous = previous*(-1);
invertNextOnes = false; 
for i=1:length(y)
    if y(i) == 0
        count = count +1;
        if(count == 8)
            x((i-5)*n+1: (i-4)*n) = previous;
            previous = -previous;
            x((i-4)*n+1: (i-3)*n) = previous;
            x((i-2)*n+1: (i-1)*n) = previous;
            previous = -previous;
            x((i-1)*n+1: (i)*n) = previous;
            count = 0;
            invertNextOnes = true;      
        end
    elseif (invertNextOnes && y(i) == previous)
          x((i-1)*n+1: length(y)*n) = -x((i-1)*n+1: length(y)*n); % Invert subsequent 1's
          invertNextOnes = false;
    else
        count = 0;
    end
end


subplot(2,1,2);
plot(t, x, 'Linewidth', 2);
grid on;
title('B8ZS');
xlabel('Time');
ylabel('Amplitude');
