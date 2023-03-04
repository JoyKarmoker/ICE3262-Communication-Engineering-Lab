clc;
close all;
clear all;

%for Unipolar
bits = [0, 1, 0, 1, 1];
bitduration = 2;
len = length(bits);
voltage = zeros(1, len);

for i = 1:len
    if(bits(i) == 1)
        voltage(i) = 5;
    end
end

t = 0:bitduration:(bitduration*len)-1;
figure(1)
subplot(2,1,1);
stairs(t, voltage, 'r', 'LineWidth',2);
title('Modulated Signal');

demodulate = zeros(1, len);
for i=1:len
    if(voltage(i) == 5)
        demodulate(i) = 1;
    end
end

subplot(2,1,2);
stem(t, demodulate, 'r', 'LineWidth', 2);
title('Demodulated Signal');

%

