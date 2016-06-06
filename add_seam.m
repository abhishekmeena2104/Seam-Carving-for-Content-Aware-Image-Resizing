function [ J ] = add_seam(I1,s)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

cols_I = size(I1,2);
rows_I = size(I1,1);
iter = size(s,2);

for n=1:iter
       rows_I = size(I1,1);

        for col = 1:cols_I
            flag=0;
         
            for row = s(col,n):rows_I
                
                
                if flag==0
                      flag=1; 
                    temp = I1(row,col,:);
                    if row ==1
                        I1(row,col,:) = (I1(row+1,col,:)+I1(row,col,:))/2;
                        
                    elseif row==rows_I
                        I1(row,col,:) = (+I1(row-1,col,:)+I1(row,col,:))/2;
                       
                  
                        
                    else
                        I1(row,col,:) = (I1(row+1,col,:)+I1(row-1,col,:)+I1(row,col,:))/3;
                    end
                    
                end
                
                if row <rows_I
                    temp1=I1(row+1,col,:);
                end
                I1(row+1,col,:)=temp;
                temp=temp1;
            end
        end
    
end

J = I1;

end


