function r = right(i,j,step)
        while ( j + step <= 16 && G(i, j+step) == 0 && D(i, j+step) > 0 )
            G(i,j) = 1;
            F(n,1) = F(n,1) + 1;
            step = step + 1;
        end;
end;

function l = left(i,j,step)
        while ( j - step >= 1 && G(i, j-step) == 0 && D(i, j-step) > 0 )
            G(i,j) = 1;
            F(n,1) = F(n,1) + 1;
            step = step + 1;
        end;
end;

function d = down(i,j,step)
        while ( i + step <= 16 && G(i+step, j) == 0 && D(i+step, j) > 0 )
            G(i,j) = 1;
            F(n,1) = F(n,1) + 1;
            step = step + 1;
        end;
end;

function u = up(i,j,step)
        while ( i - step >= 1 && G(i-step, j) == 0 && D(i-step, j) > 0 )
            G(i,j) = 1;
            F(n,1) = F(n,1) + 1;
            step = step + 1;
        end;
end;

clear;
for i = 1 : 16
    for j = 1 : 16
        A(i,j) = randi([0,1],1);
        D(i,j) = randi([0,1],1);
        G(i,j) = 0;
    end;
end;

B = A.*D;
F(1:100,1) = 0;
n = 1;

for i = 1 : 16
    for j = 1 : 16
    	if ( G(i,j) == 0 ) %cell is not cheked
        	if ( D(i,j) > 0 )
            	F(n,1) = F(n,1) + 1;
            	G(i,j) = 1;
            end;
        end;
        step = 1;
        while ( j + step <= 16 && G(i, j+step) == 0 && D(i, j+step) > 0 )
            G(i,j) = 1;
            F(n,1) = F(n,1) + 1;
            step = step + 1;
            right(i,j,step); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end;
        
        step = 1;
        while ( j - step >= 1 && G(i, j-step) == 0 && D(i, j-step) > 0 )
            G(i,j) = 1;
            F(n,1) = F(n,1) + 1;
            step = step + 1;
        end;
        
        step = 1;
        while ( i + step <= 16 && G(i+step, j) == 0 && D(i+step, j) > 0 )
            G(i,j) = 1;
            F(n,1) = F(n,1) + 1;
            step = step + 1;
        end;
        
        step = 1;
        while ( i - step >= 1 && G(i-step, j) == 0 && D(i-step, j) > 0 )
            G(i,j) = 1;
            F(n,1) = F(n,1) + 1;
            step = step + 1;
        end;
        
        
    end;
end;

% GG(1:16) = 0;
% BB(1:16, 1:16) = 0;
% function r = deph_search(node)
%     GG(node) = 1;
%     for k = 1:16
%         if (GG(node) == 0 && D(node,k) > 0)
%             BB(node, k) = 2;
%             deph_search(k);
%         end;
%     end;
% end

%     	if ( G(i,j) == 0 ) %cell is not cheked
%         	if ( D(i,j) > 0 )
%             	F(n,1) = F(n,1) + 1;
%             	G(i,j) = 1;
%             end;
%         end;
%         step_d = 1;
%         while (flag == 0)
%             if ( (j + step_d <= 256) && (D(i,j + step_d) > 0) && (G(i,j + step_d) == 0) )
%             	F(n,1) = F(n,1) + 1;
%             	G(i,j + step_d) = 1; 
%                 step_d = step_d + 1;               
%             else
%                 step_r = 1;
%                 while ( (i + step_r <= 256) && (D(i + step_r,j) > 0) && (G(i + step_r,j) == 0) )
%                     F(n,1) = F(n,1) + 1;
%                     G(i + step_r,j) = 1; 
%                     step_r = step_r + 1;
%                 end;
%             else
%                 %шаг назад
%             else
%                 %еслши степ меньше нуля, то новый кластер ищем
%             end;
%             
%                 
%                 
%             if (n < 100)
%                 n = n + 1;
%             end;
%         end;

% for i = 1 : 16
%     for j = 1 : 16
%         if ( G(i,j) == 0 ) %cell is not cheked
%             if ( D(i,j) > 0 )
%                 F(n,1) = F(n,1) + 1;
%                 G(i,j) = 1;
%             end;
%         end;
%         if ( j + 1 <= 16)
%             if ( G(i,j+1) == 0 ) %cell is not cheked
%                 if ( D(i,j+1) > 0 )
%                     F(n,1) = F(n,1) + 1;
%                     G(i,j) = 1;
%                 end;  
%             end;
%         end;
%         if ( j - 1 >= 1)
%             if ( G(i,j-1) == 0 ) %cell is not cheked
%                 if ( D(i,j-1) > 0 )
%                     F(n,1) = F(n,1) + 1;
%                     G(i,j) = 1;
%                 end;
%             end;
%         end;
%         if ( i + 1 <= 16)
%             if ( G(i+1,j) == 0 ) %cell is not cheked
%                 if ( D(i+1,j) > 0 )
%                     F(n,1) = F(n,1) + 1;
%                     G(i,j) = 1;
%                 end;  
%             end;
%         end;
%         if ( i - 1 >= 1)
%             if ( G(i-1,j) == 0 ) %cell is not cheked
%                 if ( D(i-1,j) > 0 )
%                     F(n,1) = F(n,1) + 1;
%                     G(i,j) = 1;
%                 end;  
%             end; 
%         end;
%         if (n < 100)
%             n = n + 1;
%         end;
%     end;
% end;