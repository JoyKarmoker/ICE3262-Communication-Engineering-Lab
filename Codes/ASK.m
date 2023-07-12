clc;
close all;
clear all;

bits = [1 0 1 0 1 1 1 0 1 1 0 1];
n = 1000;
T = length(bits);
t = 0:1/n:T;

original_signal = zeros(1, length(t));

for i=1:length(bits)
    if(bits(i) == 1)
        original_signal((i-1)*n+1:i*n) = 5;
    else
        original_signal((i-1)*n+1:i*n) = 0;
    end
end
subplot(4, 1, 1);
plot(t, original_signal);
title('Original Signal')
grid on
ylim([0, 5]);
xlabel('Time');
ylabel('Amplitude');

amplitude = 2;
f = 4;
carrier_signal = zeros(1, length(t));
carrier_signal = amplitude*sin(2*pi*f*t);
subplot(4, 1, 2);
plot(t, carrier_signal);
title('Carrier Signal')
grid on
ylim([-amplitude-2, amplitude+2]);
xlabel('Time');
ylabel('Amplitude');

modulated_signal = zeros(1, length(t));
for i=1:length(bits)
   if(bits(i) == 1)
       modulated_signal((i-1)*n+1:i*n) = carrier_signal((i-1)*n+1:i*n);
   else
       modulated_signal((i-1)*n+1:i*n) = 0;
   end
end

subplot(4, 1, 3);
plot(t, modulated_signal);
title('Modulated Signal')
grid on
ylim([-amplitude-2, amplitude+2]);
xlabel('Time');
ylabel('Amplitude');

%demodulation
index = 0;
for i=1:length(t)
    if(t(i) > index)
        index = index+1;
        if(modulated_signal((index-1)*n+1:index*n) == 0)
            demodulated(index) = 0;
        else
            demodulated(index) = 1;
        end
    end 
end

disp(demodulated);

demodulated_signal = zeros(1, length(t));
for i=1:length(demodulated)
    if(demodulated(i) == 1)
        demodulated_signal((i-1)*n+1:i*n) = 5;
    else
        demodulated_signal((i-1)*n+1:i*n) = 0;
    end
end
subplot(4, 1, 4);
plot(t, demodulated_signal);
title('Demodulated Signal');
grid on
ylim([0, 5]);
xlabel('Time');
ylabel('Amplitude');

