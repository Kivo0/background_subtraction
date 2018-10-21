close all
for i=1:VIDEO_HEIGHT
    for j=1:VIDEO_WIDTH
       
            val=median(ImSeq(i,j,1:10));%the more images the better the results
            bkup(i,j)=val;
        
    end
end
noBGVid = zeros(size(ImSeq));

%imshow(bkup,[])

learning_rate=0.05;

for k=11:NumImages
    for i=1:VIDEO_HEIGHT
        for j=1:VIDEO_WIDTH
        

          if(abs(ImSeq(i,j,k)-bkup(i,j,1))>=1)
                bkup(i,j)=((learning_rate)*ImSeq(i,j,k))+((1-learning_rate)*bkup(i,j));
          else
                bkup(i,j)=bkup(i,j);
          end
           
           
        end 

       
   
    end
     imshow(bkup,[]);
end
    
    
    
%    for x=1:NumImages
%      imshow(ImSeq(:,:,x),[]);
%    end


% imshow(bk,[]);
% for i=1:VIDEO_HEIGHT
%     for j=1:VIDEO_WIDTH
%         
%             if ((abs(ImSeq(i,j,11:NumImages)-bk(i,j,1))<=40)==1)
%                   
%                 
%             end
%             
%                 
%  
%     end 
%     
% end