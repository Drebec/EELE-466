function [rx, ry, rz, r3] = Madgwick_normalize(ix, iy, iz, i3)
% Normalise given measurement data
dotproduct = ix * ix + iy * iy + iz * iz + i3 * i3;
recipNorm = invSqrt(dotproduct);
if dotproduct ~= 0
    rx = ix * recipNorm;
    ry = iy * recipNorm;
    rz = iz * recipNorm;
    r3 = i3 * recipNorm;
end