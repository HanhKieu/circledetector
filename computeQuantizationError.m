function [ error ] = computeQuantizationError( myImg, quantizedImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
myImg = double(myImg);
quantizedImg = double(quantizedImg);
error = sum(sum(sum((quantizedImg - myImg).^2)));


end

