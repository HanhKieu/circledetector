function [centers ] = detectCircles( im, r, useGradient )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

im = rgb2gray(im);
edgeImg = edge(im);

rows = size(im,1);
columns = size(im,2);


if useGradient == 0
    [myGradx,myGrady] = imgradientxy(im2double(im));
    %arctotan(myGradx)

    %gradImg = sqrt((myGradx.^2) + (myGrady.^2));

    H = zeros(rows,columns);

    [edgex,edgey] = find(edgeImg == 1); %allocate memory



    for i=1:1:size(edgex,1)
        for theta=1:1:360
            a = edgex(i) - (r * cosd(theta));
            b = edgey(i) + (r * sind(theta));
            a = round(a);
            b = round(b);
            if ((a > 0) && (b > 0) && ((a <= rows) && (b <= columns))) 
                H(a,b) = H(a,b) +  1;
            end
        end
    end


    centers = houghpeaks(H,5);

    imagesc(H);

end


end

