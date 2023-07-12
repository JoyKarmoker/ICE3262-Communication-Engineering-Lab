clc;
close all;
clear all;

bits = [1 0 1 0 1 1 1 0 1 1 0 1];
n = 1000;
T = length(bits);
N = length(bits)*n;
dt = T/N;
t = 0:1/n:T;

originial_signal = zeros(1,length(t));
for i = 1:length(bits)
    if(bits(i) == 1)
        originial_signal((i-1)*n+1 : i*n) = 5;
    else
        originial_signal((i-1)*n+1 : i*n) = 0;
    end
end

subplot(4, 1, 1);
plot(t, originial_signal);
title('Original Signal')
grid on
ylim([0, 5]);
xlabel('Time');
ylabel('Amplitude');

amplitude = 2;
f1 = 8;
f0 = 2;
carrier_signal_forone = amplitude * sin(2 * pi * f1 * t);
carrier_signal_forzero = amplitude * sin(2 * pi * f0 * t);

carrier_signal = amplitude * sin(2*pi*f0*t);
subplot(4, 1, 2);
plot(t, carrier_signal);
title('Carrier Signal');
ylim([-amplitude-2, amplitude+2]);
grid on;
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');


modulated_signal = zeros(1, length(t));

for i = 1:length(bits)
    if(bits(i) == 1)
        modulated_signal((i-1)*n+1 : i*n) = carrier_signal_forone((i-1)*n+1 : i*n);
    else
        modulated_signal((i-1)*n+1 : i*n) = carrier_signal_forzero((i-1)*n+1 : i*n);
    end
end



% Plotting
subplot(4,1,3);
plot(t, modulated_signal);
ylim([-amplitude-2, amplitude+2]);
grid on;
title('FSK');
xlabel('Time');
ylabel('Amplitude');

%demodulating
demodulated = zeros(1, T);
index = 0;
for i=1:length(t)
    if(t(i) > index)
        index = index + 1;
        if(modulated_signal((index-1)*n+1:index*n) == carrier_signal_forone((index-1)*n+1: index*n) )
            demodulated(index) = 1;
        end
    end
end

disp(demodulated);
demodulated_signal = zeros(1,length(t));
for i = 1:length(bits)
    if(bits(i) == 1)
        demodulated_signal((i-1)*n+1 : i*n) = 5;
    else
        demodulated_signal((i-1)*n+1 : i*n) = 0;
    end
end
subplot(4, 1, 4);
plot(t, demodulated_signal);
title('Demodulated Signal')
grid on
ylim([0, 5]);
xlabel('Time');
ylabel('Amplitude');
