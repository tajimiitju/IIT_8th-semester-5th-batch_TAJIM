% by tajim 1916
I = imread('D:\IIT_JU_43_study\IIT 8th semester-5th batch@TAJ\DIP - MAY\matlab code-puja\a.tif');
J = histeq(I);
imshowpair(I,J,'montage')

figure

imhist(I,64)
grid on
title('Local')
figure
imhist(J,64)
title('Global')
grid on