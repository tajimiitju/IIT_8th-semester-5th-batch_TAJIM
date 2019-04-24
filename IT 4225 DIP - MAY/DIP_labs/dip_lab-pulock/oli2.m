%read raw image
row=512;  col=512;
imin=fopen('CT.raw','r');
I=fread(imin, [col row],'uint16=>uint16'); 
figure, imshow(I)
I=im2double(I);
w=input('\nMusk size : ');
k=input('\nEnter the value of k: ');
Mean=mean2(I);
z=colfilt(I,[w w],'sliding',@std);
m=colfilt(I,[w w],'sliding',@mean);
A=k*Mean./z;
g=A.*(I-m)+m;
figure, imshow(g);title("Local");


J = histeq(I);
figure, imshow(J);title("Global");
%figure,imshow(Img);
figure,
subplot(2,1,1);title('Before Local Histogram Equalization'); imhist(I);
subplot(2,1,2);title('After Local Histogram Equalization'); imhist(g);
figure,
subplot(2,1,2);title('After Global Histogram Equalization');imhist(J);

