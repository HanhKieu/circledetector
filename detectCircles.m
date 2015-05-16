function [centers ] = detectCircles( im, r, useGradient )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

im = rgb2gray(im);
edgeImg = edge(im);

rows = size(im,1);
columns = size(im,2);
H = zeros(rows,columns);
[edgex,edgey] = find(edgeImg == 1); %allocate memory

if useGradient == 0
    [myGradx,myGrady] = imgradientxy(im2double(im));
    %arctotan(myGradx)

    %gradImg = sqrt((myGradx.^2) + (myGrady.^2));

    



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



else

    
%     
% [~, angle] = imgradient(edgeImg);
[myGradx,myGrady] = gradient(im2double(im));
% convX = conv2(myGradx,[-1/2 0 1/2])
% 
% convY = conv2(myGrady,[-1/2 0 1/2])

angle = atan2(myGradx,myGrady);

 for i=1:1:size(edgex,1)
            oldtheta = angle(edgex(i),edgey(i));
            for theta=0:.01:(oldtheta * oldtheta)
                a = edgex(i) - (r * cos(theta));
                a2 = edgex(i) - (r * cos(theta * (-1)));
                b = edgey(i) + (r * sin(theta));
                b2 = edgey(i) + (r * sin(theta * (-1)));
                a = round(a);
                b = round(b);
                a2 = round(a2);
                b2 = round(b2);
                if ((a > 0) && (b > 0) && ((a <= rows) && (b <= columns))) 
                    H(a,b) = H(a,b) +  1;
                end
                if ((a2 > 0) && (b2 > 0) && ((a2 <= rows) && (b2 <= columns))) 
                    H(a2,b2) = H(a2,b2) +  1;
                end
            end
            
 end

% 

 
 
end





Hnorm = (H ./ max(max(H)));
[mx,my] = find(Hnorm > .90);

centers = horzcat(mx,my);
% centers

    
% centers = houghpeaks(H,5);
    
% viscircle()

% 
% imagesc(H);
 
 


end

