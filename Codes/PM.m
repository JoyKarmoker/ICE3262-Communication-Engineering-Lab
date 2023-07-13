clc;
clear all;
close all;

am = 1;
fm = 2;
t = 0: 0.001:3;
msg = am * sin(2*pi*fm*t);
subplot(4,1,1);
plot(t, msg);
title('Message Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');

ac = 1;
fc = 30;
carrier = ac * cos (2*pi*fc*t);
subplot(4,1,2);
plot(t, carrier);
title('Carrier Signal');


kp = 10;
modulated_signal = ac * cos(2*pi*fc*t + kp*msg);
subplot(4,1,3);
plot(t, modulated_signal);
title('Modulated Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');
hold on;
xlabel('Time');
ylabel('Amplitude');


x = abs(diff(modulated_signal));
[a,b] = butter(10, 0.03);
demodulated_signal = filter(a,b,x);
subplot(4,1,4);
plot(demodulated_signal);
title('Demodulated Signal');
hold on;
xlabel('Time');
ylabel('Amplitude');




