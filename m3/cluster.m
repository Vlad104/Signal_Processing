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
step = 0;
for i = 1 : 16
    for j = 1 : 16
    	if ( G(i,j) == 0 ) %cell is not cheked
        	if ( D(i,j) > 0 )
            	F(n,1) = F(n,1) + 1;
            	G(i,j) = 1;
            end;
        end;
        while (flag == 0)
            jj = j + 1;
            if ( (jj <= 256) && (D(i,jj) > 0) && (G(i,jj) == 0) )
                step = step + 1;
            	F(n,1) = F(n,1) + 1;
            	G(i,jj) = 1;                
            else
                %смотрим налево
            else
                %шаг назад
            else
                %еслши степ меньше нуля, то новый кластер ищем
            end;
            
                
                
            if (n < 100)
                n = n + 1;
            end;
        end;
    end;
end;



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