clc;
close all;
clear all;

t = 0:0.001:1;
fm = 2;
fc = 100;
am = 2;
ac = 5;
msg = am*2*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t, msg);
title('Message Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');

carrier = ac * sin(2*pi*fc*t);
subplot(4,1,2);
plot(t, carrier);
title('Carrier Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');


modulated_signal = (ac+msg).* carrier;
subplot(4,1,3);
plot(t, modulated_signal);
title('Modulated Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');

demodulated_signal = (modulated_signal ./ carrier) - ac;
subplot(4,1,4);
plot(t, demodulated_signal);
title('Demodulated Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');