EQ256 = 256;
EQ64 = 64;
for i = 1:EQ64
    x = 0;
    for j = 1:EQ256
        signal = sin(x);
        A1(i,j) = signal;
        signal = sin(x+0.1);
        A2(i,j) = signal;        
        x = x + 2*pi/EQ256;
    end;
end;

