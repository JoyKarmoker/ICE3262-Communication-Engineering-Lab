clc;
close all;
clear all;

bits = [1 0 0 0 0 0 0 0 0 1];
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


y = zeros(1, length(x)/n);
for i=1:length(y)
    if(x((i-1)*n +1) ~= 0)
        y(i) = 1;
    end
end
count = 0;

previous = -previous;
for i=1:length(y)
    if(y(i) == 0)
        count = count + 1;
        if count == 8
            x((i-5)*n+1:(i-4)*n) = previous;
            x((i-4)*n+1:(i-3)*n) = previous*(-1);
            previous = -previous;
            x((i-2)*n+1:(i-1)*n) = previous;
            x((i-1)*n+1:i*n) = previous*(-1);
        end
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

%Decoding
y = zeros(1, length(x)/n);
for i=1:length(y)
    if(x((i-1)*n +1) ~= 0)
        y(i) = 1;
    end
end

count = 0;
for i=1:length(y)
    if(((count >= 0 && count <= 3)||(count == 5)) && y(i) == 0)
        count = count+1;
    elseif(((count == 3)||(count == 4)) && y(i) == 1)
           count = count+1; 
    elseif(((count == 6)||(count == 7)) && y(i) == 1)
            y(i-5) = 0;
            y(i-4) = 0;
            y(i-2) = 0;
            y(i-1) = 0;
    else
        count = 0;
    end
end
disp(y);
