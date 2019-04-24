function [localMean,localSD] = localMeasures(subIm)
[m n] = size(subIm);
localMean = sum(double(subIm(:)))/double(m*n);

sdS = 0.0;
for si=1:1:m
    for sj=1:1:n
        sdS = sdS + (double(subIm(si, sj))-localMean)^2;
    end
end
localSD = (sdS/double(m*n))^(1/2);
end
