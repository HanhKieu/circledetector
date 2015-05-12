function [idxR] = quantizeRGB( myImg,k )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
rows = size(myImg,1);
columns = size(myImg,2);

R = myImg(:,:,1);
G = myImg(:,:,2);
B = myImg(:,:,3);

% Rcluster = kmeans(R,);
% Gcluster = kmeans(G,k);
% Bcluster = kmeans(B,k);

[idxR, centerR] = kmeans(im2double(R(:)),k,'Distance','sqeuclidean','Replicates',3);
[idxG, centerG] = kmeans(im2double(G(:)),k,'Distance','sqeuclidean','Replicates',3);
[idxB, centerB] = kmeans(im2double(R(:)),k,'Distance','sqeuclidean','Replicates',3);

idxR = reshape(idxR,[rows,columns]);
idxG = reshape(idxR,[rows,columns]);
idxB = reshape(idxR,[rows,columns]);



centerR
centerG
centerB
horzcat(centerR,centerG,centerB) %mynewaverage





end

