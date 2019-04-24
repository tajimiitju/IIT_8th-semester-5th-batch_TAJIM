% Program No:6
% Write an M-function for performing local histogram equalization

row=512;  col=512;
fin=fopen('CT.raw','r');
f=fread(fin, [col row],'uint16=>uint16'); 
%Z=f';
figure, imshow(f)
%f=imread('a.tif.png');
f=im2double(f);
w=input('\nEnter the Neighborhood or Window size : ');
k=input('\nEnter the value of the constant k (value should be between 0 and 1) : ');
M=mean2(f);
z=colfilt(f,[w w],'sliding',@std);
m=colfilt(f,[w w],'sliding',@mean);
A=k*M./z;
g=A.*(f-m)+m;
figure, imshow(g);


J = histeq(f);
figure, imshow(J)
%figure,imshow(Img);
figure,
subplot(2,1,1);title('Before Local Histogram Equalization'); imhist(f);
subplot(2,1,2);title('After Local Histogram Equalization'); imhist(g);
figure,
subplot(2,1,2);title('After Global Histogram Equalization');imhist(J);

