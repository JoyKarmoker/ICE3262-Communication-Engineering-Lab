clc;
close all;
clear all;

bits = [1 0 1 0 1 1 1 0 1 1 0 1];
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = length(bits) * n;
dt = T/N;
t = 0:dt:T-dt;

amplitude = 2;
f1 = 1.5;
f0 = 0.5;
carrier_signal_forone = amplitude * sin(2 * pi * f1 * t);
carrier_signal_forzero = amplitude * sin(2 * pi * f0 * t);
modulated_carrier_signal = zeros(1, length(t));

idx = 1;
for i = 1:length(bits)
    if bits(i) == 1
        modulated_carrier_signal((i-1)*n+1:i*n) = carrier_signal_forone(i);
    else
        modulated_carrier_signal((i-1)*n+1:i*n) = carrier_signal_forzero(i);
    end
end

% Plotting
%plot(time, modulated_carrier_signal);
plot(t, modulated_carrier_signal);
ylim([-amplitude-2, amplitude+2]);
grid on;
title('FSK');
xlabel('Time');
ylabel('Amplitude');
%line([0, Total_time], [0 0], 'linestyle', '--', 'color', 'r');
