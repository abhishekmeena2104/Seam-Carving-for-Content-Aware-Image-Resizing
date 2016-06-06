clc 
clear all
%%
I = im2double(imread('6.jpg'));
no_rows =200;
no_cols =200;
P=I;
I_O=I;

%%
for k = 1:no_rows
    if k==1
    seam_horizontal = horizontal_seam_detection(P);
    end
    if k>1
    seam_horizontal = horizontal_seam_detection2(P,seam_horizontal);
    end
    seams_array=seam_horizontal';
%     I = remove_horizontal_seam(I,seam_horizontal);
   P= add_seam2(P,seams_array);       
end
P = permute(P,[2 1 3]);
for k = 1:no_cols
   if k==1
    seam_horizontal = horizontal_seam_detection(P);
    end
    if k>1
    seam_horizontal = horizontal_seam_detection2(P,seam_horizontal);
    end
    seams_array=seam_horizontal'
%     I = remove_horizontal_seam(I,seam_horizontal);
   P= add_seam2(P,seams_array);   
end
P = permute(P,[2 1 3]);








figure(1)
subplot(1,2,1),imshow(I_O)
subplot(1,2,2),imshow(P)