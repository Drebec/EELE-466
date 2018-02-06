function [rx, ry, rz, r3] = Madgwick_normalize(ix, iy, iz, i3)
% Normalise given measurement data
dotproduct = ix * ix + iy * iy + iz * iz + i3 * i3;

if dotproduct ~= 0
    recipNorm = 1/(sqrt(dotproduct));
    rx = ix * recipNorm;
    ry = iy * recipNorm;
    rz = iz * recipNorm;
    r3 = i3 * recipNorm;
else
    rx = 0;
    ry = 0;
    rz = 0;
    r3 = 0;
end