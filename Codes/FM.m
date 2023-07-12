clc;
close all;
clear all;

fm = 4;
am = 7;
t = 0:0.001:3;
msg = am * sin (2*pi*fm*t);
subplot(4,1,1);
plot(t, msg);
title('Message Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');

fc = 30;
ac = 10;
carrier = ac * sin (2*pi*fc*t);
subplot(4,1,2);
plot(t, carrier);
title('Carrier Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');


modulated_signal = ac * sin (2*pi*fc*t + msg);
subplot(4,1,3);
plot(t, modulated_signal);
title('Modulated Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');


x = abs(diff(modulated_signal));
[a, b] = butter(10, 0.025);
demodulated_signal = filter(a,b,x);
subplot(4,1,4);
plot(demodulated_signal);
title('Demodulated Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');
ylim([-1,3]);