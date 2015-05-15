function [histEqual, histClustered] = getHueHists(myImg, k)

hsvImg = rgb2hsv(myImg);

hue = hsvImg(:,:,1);
rows = size(hue,1);
columns = size(hue,2);
my = reshape(hue,(rows * columns),1);
histEqual = hist(my,k); %my is reshaped hue matrix to n x 1
 %divids hue value uniformally
[idx,centerMatrix] = kmeans(double(my),k);
idx = reshape(idx,rows,columns);


for i=1:1:k
    [x,y] = find(idx == i);
    for j=1:1:size(x,1)
        hue(x(j,1),y(j,1)) = centerMatrix(i,1); %R
    end
end 


idx = reshape(idx, (rows * columns), 1);
histClustered = hist(idx, k); %histogram of cluster centers
figure
subplot(1, 2, 1);
hist(my, k);
title('Equal Space Histogram'); 

%------second part---------%
subplot(1, 2, 2);
hist(idx, k);
title('Cluster Histogram');
