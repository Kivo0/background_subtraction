%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% VISUAL TRACKING
% ----------------------
% Background Subtraction
% ----------------
% Date: september 2015
% Authors: Karim Botros,SuperVised by Prof. Ass. Desire Sidibe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%% Describe here your background subtraction method


%% part 1, median on all images to estimate background then substract to get the car.
% the first method is to get the median of all the images , to compute the
% background.
% first intialize the background variables by zeros with the same size of
% hight and width of the video and do the median filter on all the sequence
bk=zeros(VIDEO_HEIGHT, VIDEO_WIDTH);
for i=1:VIDEO_HEIGHT
    for j=1:VIDEO_WIDTH
        val=median(ImSeq(i,j,1:NumImages));
        bk(i,j)=val;
    end
end
disp('BackGround estimated');
disp('Detecting Car');
figure(1)
for i=1:NumImages
    
  b=ImSeq(:,:,i); 
  moving=b-bk;
  moving =moving>20;
  
  bboxes = regionprops( moving, 'BoundingBox', 'Area' );
  
  for j=1:length(bboxes)
        Areai(j)= bboxes(j).Area;
  end
  
    largest_blob_id= find(Areai==max(Areai)); 
 

drawnow
imshow(b,[]);
hold on

hk=bboxes(largest_blob_id).BoundingBox;
rectangle('Position',[hk(1),hk(2),hk(3),hk(4)],'EdgeColor','r','LineWidth',3);
hold off

end

disp('First method done');

close 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2.1 2nd part background-update

for i=1:VIDEO_HEIGHT
    for j=1:VIDEO_WIDTH
        val=median(ImSeq(i,j,1:10));%the more images the better the results
        bk(i,j)=val;
    end
end
disp('BackGround 10 images estimated');
old = bk;

figure('Name','10 medi bg Vs Update','NumberTitle','off');

learning_rate=0.05;
disp('showing the estimated background median,, and the updating method');

for k=11:NumImages
    for i=1:VIDEO_HEIGHT
        for j=1:VIDEO_WIDTH
        

          if(abs(ImSeq(i,j,k)-bk(i,j,1))>=1)
                bk(i,j)=((learning_rate)*ImSeq(i,j,k))+((1-learning_rate)*bk(i,j));
          else
                bk(i,j)=bk(i,j);
          end
          
        end 

    end
    multi = cat(2,old,bk);
     imshow(multi,[]);
     
end
close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('drawing boxes on the background update method');
figure('Name','box on bg update method','NumberTitle','off');
for i=1:NumImages
 b=ImSeq(:,:,i);
  moving=b-bk;
  moving =moving>20;
  
  bboxes = regionprops( moving, 'BoundingBox', 'Area' );
  
  for j=1:length(bboxes)
        Areai(j)= bboxes(j).Area;
  end
  
    largest_blob_id= find(Areai==max(Areai)); 
 

drawnow
imshow(b,[]);
hold on

hk=bboxes(largest_blob_id).BoundingBox;
rectangle('Position',[hk(1),hk(2),hk(3),hk(4)],'EdgeColor','r','LineWidth',3);
hold off

end
close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




