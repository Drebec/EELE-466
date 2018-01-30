function [qDot1, qDot2, qDot3, qDot4] = Madgwick_qDot(q0, q1, q2, q3, gx, gy, gz)
% Rate of change of quaternion from gyroscope
qDot1 = 0.5 * (-q1 * gx - q2 * gy - q3 * gz);
qDot2 = 0.5 * ( q0 * gx + q2 * gz - q3 * gy);
qDot3 = 0.5 * ( q0 * gy - q1 * gz + q3 * gx);
qDot4 = 0.5 * ( q0 * gz + q1 * gy - q2 * gx);
