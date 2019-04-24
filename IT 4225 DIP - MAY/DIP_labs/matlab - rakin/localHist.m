imFileID = fopen('E:\semester_viii\DIP\assignment\CT.raw', 'r');
M = 512;
N = 512;
sIm = fread(imFileID, [M, N], 'int16=>int16');
sIm = transpose(sIm);

BG = sIm(1, 1); %Intensity of the pixels outside the circle.

%calculating intensity range.
minIn = (2^15) - 1;
maxIn = -(2^15);

for i=1:1:M
    for j=1:1:N
        if (sIm(i, j)~= BG)
            if (sIm(i, j)<minIn)
                minIn = sIm(i, j);
            end
            if (sIm(i, j)>maxIn)
                maxIn = sIm(i, j);
            end
        end
    end
end

inWidth = maxIn - minIn + 1;

dummyIm = uint8(0);
fgCircle = logical(0);
%conversion to unsigned 8 bit & circular boundary formation

for i=1:1:M
    for j=1:1:N
        if (sIm(i, j)==BG)
            dummyIm(i, j) = 0;
            fgCircle(i, j) = 0;
        else
            dummyIm(i, j) = uint8(((double(sIm(i, j) - minIn +1) / double(inWidth)) * 256.0) - 1);
            fgCircle(i, j) = 1;
        end
    end
end

figure(1);
imshow(dummyIm);
title('Original Image');

%Global mean
MN = sum(fgCircle(:));
tI = sum(dummyIm(:));
globalMean = tI/MN;

%hstogram counting
histCount(1:256) = double(0);
for i=1:1:M
    for j=1:1:N
        if( fgCircle(i, j)==1 )
            histCount(dummyIm(i, j)+1) = histCount(dummyIm(i, j)+1) + 1;
        end
    end
end

% s = T(r)
Tr = uint8(0);
for i=1:1:256
    Tr(i) = uint8(round(sum(double(histCount(1:i)))*255/MN));
end
% creating the transformed image (Global Histogram Eq)
GTr = uint8(0);
for i=1:1:M
    for j=1:1:N
        if(fgCircle(i, j)==1)
            GTr(i, j) = Tr(dummyIm(i, j)+1);
        end
    end
end
figure(2);
imshow(GTr);
title('Global Histogram Equalization');        

sdSum = double(0);
for i=1:1:256
    sdSum = sdSum + ((i-1-globalMean)^2)*histCount(i);
end
globalSD = (sdSum/double(MN))^(1/2);


E = .720;
k0 = 0.8;
k1 = 0.02;
k2 = 0.2;
gDummyIm = uint8(0);

for i=1:1:M
    for j=1:1:N
        if(fgCircle(i, j)==1 && i>1 &&j>1 && i<M && j<N)
            i1 = uint32(i-1);
            i2 = uint32(i+1);
            j1 = uint32(j-1);
            j2 = uint32(j+1);
            subFg = fgCircle(i1:i2, j1:j2);
            if(sum(subFg(:))==9)
                subIm = dummyIm(i1:i2, j1:j2);
                [localMean, localSD] = localMeasures(subIm);
                if(localMean <= k0*globalMean && k1*globalSD <= localSD && localSD <= k2*globalSD)
                    gDummyIm(i, j) = uint8(E*double(dummyIm(i, j)));
                else
                    gDummyIm(i, j) = dummyIm(i, j);
                end
            end
        end
    end
end

figure(3);
imshow(gDummyIm);
title('Local Histogram Processing');













%figure(4);



uIm = uint16(0);

for i=1:1:M
    for j=1:1:N
        if (sIm(i, j)==BG)
            uIm(i, j) = 0;
        else
            uIm(i, j) = uint16(double(sIm(i, j) - double(minIn)));
        end
    end
end
max(uIm(:))
