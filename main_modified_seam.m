clc 
clear all
%%
I = imread('45.jpg');
sum=0;
no_rows =70;
no_cols = 90;
I1=I;
I_O=I;


%%
  
for k = 1:no_rows
    k0 = skin_detection(double(I));
  E = imenergy( double(I) );
   [m,n]=size(E);
   for i =1:m
       for j=1:n
           if  k0(i,j) > 0
             if(i>20&&j>20)
               E(i-5:i+5,j-5:j+5)=100000;
             else
                 E(i,j)=100000;
             end
           end
       end
   end

     figure(3)
  imshow(E)
  pause(0.001);
    seam_horizontal = horizontal_seam_detection3(E);
 
    I = remove_horizontal_seam(I,seam_horizontal);
    
    
end
I = permute(I,[2 1 3]);
for k = 1:no_cols
    k0 = skin_detection(double(I));
  E = imenergy( double(I) );
   [m,n]=size(E);
   for i =1:m
       for j=1:n
           if  k0(i,j) > 0
             if(i>20&&j>20&&k==1)
               E(i-5:i+5,j-5:j+5)=100000;
             else
                 E(i,j)=100000;
             end
           end
       end
   end

  figure(3)
  imshow(E)
  pause(0.001);
    seam_horizontal = horizontal_seam_detection3(E);
 
    I = remove_horizontal_seam(I,seam_horizontal);
    
    
end
I = permute(I,[2 1 3]);


figure(12)
subplot(1,2,1),imshow(I_O)
subplot(1,2,2),imshow(I)