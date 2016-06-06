function [ seam ] = horizontal_seam_detection2( I ,s)


% computing energy function
E = imenergy( I );
cumm_min_egy_arr = E;
rows_image = size(I,1);
cols_image = size(I,2);
%%
cumm_min_egy_arr;

for col = 1:size(E,2)
       row=s(col);
            cumm_min_egy_arr(row-1:row+1,col) = 100000;
        
    end



%%
% computing cummulative minimum energy matrix
for col = 2:cols_image
    for row = 1:rows_image

        if (row == 1) % boundary condition
            temp1 = [cumm_min_egy_arr(row,col-1),cumm_min_egy_arr(row+1,col-1)];
            min_energy = min(temp1);
        elseif (row == rows_image) % boundary condition     
            temp2 = [cumm_min_egy_arr(row-1,col-1),cumm_min_egy_arr(row,col-1)];
            min_energy = min(temp2);
        else
            temp3 = [cumm_min_egy_arr(row-1,col-1),cumm_min_egy_arr(row,col-1),cumm_min_egy_arr(row+1,col-1)];
            min_energy = min(temp3);
        end
        % compute cumulative minimum energy array M
        cumm_min_egy_arr(row,col) = E(row,col) + min_energy;
    end
end

%%
%  we have cummulative minimum energy array now the task is to find the
%  path with the lowest energy i.e.-seam 
%  path is composed of thr rows indices of the image matrix 

[C,index] = min(cumm_min_egy_arr(:,size(I,2)));

seam = zeros(1,size(I,2));
seam(size(I,2)) = index;
col = cols_image - 1;
while (col > 0)
    if (index == 1)
        [temp1 indexstep] = min(cumm_min_egy_arr(index:index+1,col));
        if (indexstep == 2)
            index = index + 1;
        end
    elseif (index == size(I,1))
        [temp2 indexstep] = min(cumm_min_egy_arr(index-1:index,col));
        if (indexstep == 1)
            index = index - 1;
        end
    else
        [temp3 indexstep] = min(cumm_min_egy_arr(index-1:index+1,col));
        if (indexstep == 1)
            index = index - 1;
        elseif (indexstep == 3)
            index = index + 1;
        end
    end
    seam(col) = index;
    

    col = col - 1;
    
end

end


