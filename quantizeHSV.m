function [outputImg,centerMatrix ] = quantizeHSV(myImg, k )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

hsvImg = rgb2hsv(myImg);

hue = hsvImg(:,:,1);
rows = size(hue,1);
columns = size(hue,2);
my = reshape(hue,rows * columns,1);
[idx,centerMatrix] = kmeans(double(my),k);
idx = reshape(idx,rows,columns);


for i=1:1:k
    [x,y] = find(idx == i);
    for j=1:1:size(x,1)
        hue(x(j,1),y(j,1)) = centerMatrix(i,1); %R
    end
end

hsvImg(:,:,1) = hue;
outputImg = hsv2rgb(hsvImg);

end

