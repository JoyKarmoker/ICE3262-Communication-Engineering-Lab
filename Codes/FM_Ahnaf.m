clc;
close all;
close all;

msg_amplitude = 7;
msg_frequency = 4; 
t = 0:0.001:3; 
msg_signal = msg_amplitude*sin(2*pi*msg_frequency*t);
subplot(4,1,1);
plot(t, msg_signal);
title('Message Signal');

carrier_amplitude = 10;
carrier_frequency = 30;
carrier_signal = carrier_amplitude*sin(2*pi*carrier_frequency*t);
subplot(4,1,2);
plot(t, carrier_signal);
title('Message Signal');

%... Modulation
modulation_index = 10;
modulated_signal = carrier_amplitude*sin(2*pi*carrier_frequency*t+msg_signal);
subplot(4,1,3);
plot(t, modulated_signal);
title('Modulated Signal');

%... Demodulation
x = abs(diff(modulated_signal));
%... To use butter function we need to run the following 2 commands
%... pkg install -forge signal
%pkg load signal
[a,b] = butter(10, 0.03);
demodulated_signal = filter(a,b,x);
subplot(4,1,4);
plot(demodulated_signal);
title('Demodulated Signal');