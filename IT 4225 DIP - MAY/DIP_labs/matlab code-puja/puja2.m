clc;    
close all;

i= imread('D:\IIT_JU_43_study\IIT 8th semester-5th batch@TAJ\DIP - MAY\matlab code-puja\man.tif');
figure;
subplot(1,2,1);  imshow(i);
subplot(1,2,2);  imhist(i);

imh= imadjust(i,[0.35,0.63],[0.0,1.0]);
imh1= histeq(i);

figure;
subplot(2,2,1);  imshow(imh);
subplot(2,2,2);  imhist(imh);
subplot(2,2,3);  imshow(imh1);
subplot(2,2,4);  imhist(imh1);