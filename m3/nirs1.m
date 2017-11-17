clear
EQ256 = 16;
EQ64 = 8;
for i = 1:EQ64
    x = 0;
    for j = 1:EQ256
        signal = sin(x);
        A1in(i,j) = signal;
        signal = sin(x+0.1);
        A2in(i,j) = signal;        
        x = x + 2*pi/EQ256;
    end;
end;
A1in = A1in';
A2in = A2in';

A1 = fft(A1in(:,:));
A2 = fft(A2in(:,:));

A1 = A1';
A2 = A2';
    
B1 = fft(A1(:,:));
B2 = fft(A2(:,:));

C = abs(B1) + abs(B2);
S1 = 0; S2 = 0; tr = 10;
for i = 1:EQ64
    for j = 1:EQ256
        if (6-j <= 0 && j <= (EQ256-5))
            S1 = C(i,j-5) + C(i,j-4) + C(i,j-3);
            S1 = S1/3;
            S2 = C(i,j+3) + C(i,j+4) + C(i,j+5);
            S2 = S2/3;
            if ( ( (tr*S1 < C(i,j)) && (tr*S2 < C(i,j)) ) )
                D(i,j) = int32(C(i,j));
            else
                D(i,j) = 0;
            end;
        end;    
        if (j <= 2)
            S2 = C(i,j+3) + C(i,j+4) + C(i,j+5);
            S2 = S2/3;
            if (tr*S2 < C(i,j))
                D(i,j) = int32(C(i,j));
            else
                D(i,j) = 0;
            end;
        end;    
        if (j >= EQ256-2)
            S1 = C(i,j-5) + C(i,j-4) + C(i,j-3);
            S1 = S1/3;
            if (tr*S1 < C(i,j))
                D(i,j) = int32(C(i,j));
            else
                D(i,j) = 0;
            end;
        end; 
        if (j == 4)
            S1 = C(i,j-3);
            S2 = C(i,j+3) + C(i,j+4) + C(i,j+5);
            S2 = S2/3;
            if ( (tr*S1 < C(i,j)) && (tr*S2 < C(i,j)) )
                D(i,j) = int32(C(i,j));
            else
                D(i,j) = 0;
            end;
        end;         
        if (j == 5)
            S1 = C(i,j-4) + C(i,j-3);
            S1 = S1/2;
            S2 = C(i,j+3) + C(i,j+4) + C(i,j+5);
            S2 = S2/3;
            if ( (tr*S1 < C(i,j)) && (tr*S2 < C(i,j)) )
                D(i,j) = int32(C(i,j));
            else
                D(i,j) = 0;
            end;
        end;
        if (j == EQ256 - 3)
            S1 = C(i,j-5) + C(i,j-4) + C(i,j-3);
            S1 = S1/3;
            S2 = C(i,j+3);
            if ( (tr*S1 < C(i,j)) && (tr*S2 < C(i,j)) )
                D(i,j) = int32(C(i,j));
            else
                D(i,j) = 0;
            end;
        end;
        if (j == EQ256 - 4)
            S1 = C(i,j-5) + C(i,j-4) + C(i,j-3);
            S1 = S1/3;
            S2 = C(i,j+3) + C(i,j+4);
            S2 = S2/2;
            if ( (tr*S1 < C(i,j)) && (tr*S2 < C(i,j)) )
                D(i,j) = int32(C(i,j));
            else
                D(i,j) = 0;
            end;
        end;      
    end;
end;

