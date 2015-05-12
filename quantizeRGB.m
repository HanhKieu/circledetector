function [myImg] = quantizeRGB( myImg,k )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% rows = size(myImg,1);
% columns = size(myImg,2);
% 
% R = myImg(:,:,1);
% G = myImg(:,:,2);
% B = myImg(:,:,3);
% 
% % Rcluster = kmeans(R,);
% % Gcluster = kmeans(G,k);
% % Bcluster = kmeans(B,k);
% 
% [~, centerR] = kmeans(double(R(:)),k,'Distance','sqeuclidean','Replicates',3);
% [~, centerG] = kmeans(double(G(:)),k,'Distance','sqeuclidean','Replicates',3);
% [~, centerB] = kmeans(double(B(:)),k,'Distance','sqeuclidean','Replicates',3);

rows = size(myImg,1);
columns = size(myImg,2);

my = reshape(myImg,rows * columns,3);
[idx,centerMatrix] = kmeans(double(my),k,'Distance','sqeuclidean','Replicates',3);

idx = reshape(idx,[rows,columns]);

idx


% 
% for i=1:1:k
%     [x,y] = find(idx == i);
%     for j=1:1:size(x,1)
%         myImg(x(j,1),y(j,1),1) = centerMatrix(i,1); %R
%         myImg(x(j,1),y(j,1),2) = centerMatrix(i,2); %G
%         myImg(x(j,1),y(j,1),3) = centerMatrix(i,3); %B
%     end
% end

outputImg = uint8(myImg);


end

