% by tajim 1916
clear all;
clc;
A(1:512, 1:512) = uint8(128); %uniform intensity
f1=figure;
figure(f1);
subplot(2, 2, 1);
p1 = imshow(A);
title('An Image of size 512 X 512 with uniform intensity value 128');

k = 20;
sum(1:512, 1:512) = double(0);

for i=1:1:k
    AN(:, :, i) = imnoise(A, 'gaussian');
    sum = sum + double(AN(:, :, i));
    avg = uint8(sum/i);
    [peakSNRn, SNRn] = psnr(AN(:, :, i), A);
    [peakSNRa, SNRa] = psnr(avg, A);
    allSNRn(i) = SNRn;
    allSNRa(i) = SNRa;
end

imIndex = randi(k);
%figure(f1);
subplot(2, 2, 2);
p2 = imshow(AN(:, :, imIndex));
title('Randomly selected Noisy(WGN) Image');

disp('After averaging, the snr is:')
[peakSNR, SNR] = psnr(avg, A);
%disp(peakSNR);
disp(SNR);
subplot(2, 2, 3);
p3 = imshow(avg);
title('Average');

subplot(2, 2, 4);
p4 = plot(allSNRa);
%legend('Average');
hold on;
p5 = plot(allSNRn, '.');
hold on;
legend('Average', 'Individual');
title('SNR plot of the average image');
ylabel('SNRdB');
xlabel('Number of iterations.');