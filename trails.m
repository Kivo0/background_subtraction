%% trials


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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
% BACKGROUND SUBTRACTION
%=======================
%  for i2=1:NumImages
%      im = ImSeq(:,:,i);
%      level = graythresh(im)
%      BW = imbinarize(im,level);
% %      bwhite=im2bw(im,0.9);
%      imshow(im);
%  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

