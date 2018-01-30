function [r0, r1, r2, r3] = Madgwick_correction(q0, q1, q3, ax, ay, az, mx, my, mz)
%Auxiliary variables to avoid repeated arithmetic
v2q0mx = 2.0 * q0 * mx;
v2q0my = 2.0 * q0 * my;
v2q0mz = 2.0 * q0 * mz;
v2q1mx = 2.0 * q1 * mx;
v2q0 = 2.0 * q0;
v2q1 = 2.0 * q1;
v2q2 = 2.0 * q2;
v2q3 = 2.0 * q3;
v2q0q2 = 2.0 * q0 * q2;
v2q2q3 = 2.0 * q2 * q3;
q0q0 = q0 * q0;
q0q1 = q0 * q1;
q0q2 = q0 * q2;
q0q3 = q0 * q3;
q1q1 = q1 * q1;
q1q2 = q1 * q2;
q1q3 = q1 * q3;
q2q2 = q2 * q2;
q2q3 = q2 * q3;
q3q3 = q3 * q3;

% Reference direction of Earth's magnetic field
hx = mx * q0q0 - v2q0my * q3 + v2q0mz * q2 + mx * q1q1 + v2q1 * my * q2 + v2q1 * mz * q3 - mx * q2q2 - mx * q3q3;
hy = v2q0mx * q3 + my * q0q0 - v2q0mz * q1 + v2q1mx * q2 - my * q1q1 + my * q2q2 + v2q2 * mz * q3 - my * q3q3;
v2bx = sqrt(hx * hx + hy * hy);
v2bz = -v2q0mx * q2 + v2q0my * q1 + mz * q0q0 + v2q1mx * q3 - mz * q1q1 + v2q2 * my * q3 - mz * q2q2 + mz * q3q3;
v4bx = 2.0 * v2bx;
v4bz = 2.0 * v2bz;

% Gradient decent algorithm corrective step
r0 = -v2q2 * (2.0 * q1q3 - v2q0q2 - ax) + v2q1 * (2.0 * q0q1 + v2q2q3 - ay) - v2bz * q2 * (v2bx * (0.5 - q2q2 - q3q3) + v2bz * (q1q3 - q0q2) - mx) + (-v2bx * q3 + v2bz * q1) * (v2bx * (q1q2 - q0q3) + v2bz * (q0q1 + q2q3) - my) + v2bx * q2 * (v2bx * (q0q2 + q1q3) + v2bz * (0.5 - q1q1 - q2q2) - mz);
r1 =  v2q3 * (2.0 * q1q3 - v2q0q2 - ax) + v2q0 * (2.0 * q0q1 + v2q2q3 - ay) - 4.0 * q1 * (1 - 2.0 * q1q1 - 2.0 * q2q2 - az) + v2bz * q3 * (v2bx * (0.5 - q2q2 - q3q3) + v2bz * (q1q3 - q0q2) - mx) + (v2bx * q2 + v2bz * q0) * (v2bx * (q1q2 - q0q3) + v2bz * (q0q1 + q2q3) - my) + (v2bx * q3 - v4bz * q1) * (v2bx * (q0q2 + q1q3) + v2bz * (0.5 - q1q1 - q2q2) - mz);
r2 = -v2q0 * (2.0 * q1q3 - v2q0q2 - ax) + v2q3 * (2.0 * q0q1 + v2q2q3 - ay) - 4.0 * q2 * (1 - 2.0 * q1q1 - 2.0 * q2q2 - az) + (-v4bx * q2 - v2bz * q0) * (v2bx * (0.5f - q2q2 - q3q3) + v2bz * (q1q3 - q0q2) - mx) + (v2bx * q1 + v2bz * q3) * (v2bx * (q1q2 - q0q3) + v2bz * (q0q1 + q2q3) - my) + (v2bx * q0 - v4bz * q2) * (v2bx * (q0q2 + q1q3) + v2bz * (0.5 - q1q1 - q2q2) - mz);
r3 =  v2q1 * (2.0 * q1q3 - v2q0q2 - ax) + v2q2 * (2.0 * q0q1 + v2q2q3 - ay) + (-v4bx * q3 + v2bz * q1) * (v2bx * (0.5 - q2q2 - q3q3) + v2bz * (q1q3 - q0q2) - mx) + (-v2bx * q0 + v2bz * q2) * (v2bx * (q1q2 - q0q3) + v2bz * (q0q1 + q2q3) - my) + v2bx * q1 * (v2bx * (q0q2 + q1q3) + v2bz * (0.5 - q1q1 - q2q2) - mz);