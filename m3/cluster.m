clear;
EQ256 = 4;
EQ64 = 4;
for i = 1 : EQ64
    for j = 1 : EQ256
        A(i,j) = randi([0,1],1);
        D(i,j) = randi([0,1],1);
        G(i,j) = 0;
    end;
end;

A(1:EQ64,1:EQ256) = 1;
D(1:EQ64,1:EQ256) = 0;
D(1,1) = 1;
D(1,2) = 1;
D(2,2) = 1;
D(3,2) = 1;
D(4,2) = 1;
D(4,1) = 1;
D(4,3) = 1;

B = A.*D;
F(1:int32(EQ64*EQ256/2),1) = 0;
H(1:EQ64,1:EQ256) = 0;
K(1:4,1:4) = 0;
K(1,1:2) = 1;
n = 1;
hn = 1;
hnn = 0;
hni = 1;

flag = 1;
BB = B;

for ii = 1 : EQ64
	for jj = 1 : EQ256 %#ok<ALIGN>
        for hni = 1 : hn
            i = K(hni,1);
            j = K(hni,2); %нужно решить проблему рекурсии. Запомнитиь 4 точки. Затем встать в одну из них и запомнить новые
            if ( j <= EQ256 && G(i,j) == 0 && D(i,j) > 0 )
            	F(n,1) = F(n,1) + 1;
            	G(i,j) = 1;
            	H(i,j) = 0;
            	BB(i,j) = 2;
                hnn = 0;
            	if ( j + 1 <= EQ256 && G(i, j+1) == 0 && D(i, j+1) > 0 )
                	H(i,j+1) = 1;
                    hnn = hnn + 1; 
                    K(hnn,1) = i;
                    K(hnn,2) = j;
                end;

                if ( j - 1 >= 1 && G(i, j-1) == 0 && D(i, j-1) > 0 )
                	H(i,j-1) = 1;
                    hnn = hnn + 1; 
                    K(hnn,1) = i;
                    K(hnn,2) = j;
                end;

                if ( i + 1 <= EQ64 && G(i+1, j) == 0 && D(i+1, j) > 0 )
                	H(i+1,j) = 1;
                    hnn = hnn + 1; 
                    K(hnn,1) = i;
                    K(hnn,2) = j;
                end;

                if ( i - 1 >= 1 && G(i-1, j) == 0 && D(i-1, j) > 0 )
                	H(i-1,j) = 1;
                    hnn = hnn + 1; 
                    K(hnn,1) = i;
                    K(hnn,2) = j;
               	end;
                hn = hnn;
            end;
        end;
        if (F(n,1) > 0)
        	n = n + 1;
        end;
    end;
end;