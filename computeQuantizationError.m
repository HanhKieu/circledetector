function [ error ] = computeQuantizationError( myImg, quantizedImg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

 error = sum(sum(sum((quantizedImg - myImg).^2)));


end

