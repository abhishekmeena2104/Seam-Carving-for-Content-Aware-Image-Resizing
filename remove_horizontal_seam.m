function [ J ] = remove_horizontal_seam( I,S )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
cols_I = size(I,2);
rows_I = size(I,1);

for dim = 1:3
    for col = 1:cols_I
        for row = S(col):rows_I-1
            I(row,col,dim) = I(row+1,col,dim);
        end
    end
end
J = I(1:rows_I-1,:,:);

end

