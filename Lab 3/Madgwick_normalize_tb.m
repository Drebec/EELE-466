% Normalize testbench



for i = 1:1:1000
        
   ix = (rand - 0.5) * 2^14;
   iy = (rand - 0.5) * 2^14;
   iz = (rand - 0.5) * 2^14;
   
   [rx, ry, rz, r3] = Madgwick_normalize(ix, iy, iz, 0);
end

[rx, ry, rz, r3] = Madgwick_normalize(0, 0, 0, 0);