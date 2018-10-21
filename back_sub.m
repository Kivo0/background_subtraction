%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% VISUAL TRACKING
% ----------------------
% Background Subtraction
% ----------------
% Date: september 2015
% Authors: You !!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all


%%%%% LOAD THE IMAGES
%=======================

% Give image directory and extension
imPath = 'car'; imExt = 'jpg';

% check if directory and files exist
if isdir(imPath) == 0
    error('USER ERROR : The image directory does not exist');
end

filearray = dir([imPath filesep '*.' imExt]); % get all files in the directory
NumImages = size(filearray,1); % get the number of images
if NumImages < 0
    error('No image in the directory');
end

disp('Loading image files from the video sequence, please be patient...');
% Get image parameters
imgname = [imPath filesep filearray(1).name]; % get image name
I = imread(imgname); % read the 1st image and pick its size
VIDEO_WIDTH = size(I,2);
VIDEO_HEIGHT = size(I,1);

ImSeq = zeros(VIDEO_HEIGHT, VIDEO_WIDTH, NumImages);
for i=1:NumImages
    imgname = [imPath filesep filearray(i).name]; % get image name
    ImSeq(:,:,i) = imread(imgname); % load image
   
end
disp(' ... OK!');

% for i=1:NumImages
%     
%  imgname = [imPath filesep filearray(i).name];
%  b=imread(imgname);
%  %imshow(b);
%  %level = graythresh(b)
%  BW = imbinarize(b,0.94);
%  %imshowpair(b,BW,'montage')
% bboxes = regionprops(BW, 'BoundingBox', 'Area' );
%     for i3= 1 : length(bboxes)
%         Areai(i3)= bboxes(i3).Area;
%     end
%     largest_blob_id= find(Areai==max(Areai)); 
% figure,imshow(b);
% 
% hold on
% hk=bboxes(largest_blob_id).BoundingBox;
% rectangle('Position',[hk(1),hk(2),hk(3),hk(4)],'EdgeColor','r','LineWidth',3);
% hold off
% 
% 
% end
% close all



% BACKGROUND SUBTRACTION
%=======================
%  for i2=1:NumImages
%      im = ImSeq(:,:,i);
%      level = graythresh(im)
%      BW = imbinarize(im,level);
% %      bwhite=im2bw(im,0.9);
%      imshow(im);
%  end
% Describe here your background subtraction method
bk=zeros(VIDEO_HEIGHT, VIDEO_WIDTH);

for i=1:VIDEO_HEIGHT
    for j=1:VIDEO_WIDTH
        val=median(ImSeq(i,j,1:NumImages));
        bk(i,j)=val;
    end
end

%imshow(bk,[]);

% figure(1)
% for i=1:NumImages
%     
% 
% %   b=ImSeq(:,:,i);
% % b = [b,[]]
% 
% 
%  imgname = [imPath filesep filearray(i).name]; % get image name
%     b = imread(imgname); % load image
% 
% b=double(b);
% 
%   moving=b-bk;
%  
%  
%   
%   moving =moving>50;
%    %imshow(moving,[])
%   
%  
% bboxes = regionprops( moving, 'BoundingBox', 'Area' );
% 
% 
%     for i3= 1 : length(bboxes)
%         Areai(i3)= bboxes(i3).Area;
%     end
%     largest_blob_id= find(Areai==max(Areai)); 
% imshow(b,[]);
% 
% hold on
% hk=bboxes(largest_blob_id).BoundingBox;
% rectangle('Position',[hk(1),hk(2),hk(3),hk(4)],'EdgeColor','r','LineWidth',3);
% hold off
% 
% 
% end
% 
% close all
%% 2.1 2nd part backgroundupdate

for i=1:VIDEO_HEIGHT
    for j=1:VIDEO_WIDTH
        val=median(ImSeq(i,j,1:10));%the more images the better the results
        bk(i,j)=val;
    end
end
imshow(bk,[])

for i=1:VIDEO_HEIGHT
    for j=1:VIDEO_WIDTH
        
        
     
        
       
    end
end







% DEFINE A BOUNDING BOX AROUND THE OBTAINED REGION
% you can draw the bounding box and show it on the image





