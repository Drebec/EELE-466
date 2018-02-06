function [r0, r1, r2, r3] = Madgwick_update(q0, q1, q2, q3, qDot1, qDot2, qDot3, qDot4, s0, s1, s2, s3, beta, sampleTime)
% Apply feedback step
qDot1 = qDot1 - beta * s0;
qDot2 = qDot2 - beta * s1;
qDot3 = qDot3 - beta * s2;
qDot4 = qDot4 - beta * s3;

% Integrate rate of change of quaternion to yield quaternion
r0 = q0 + qDot1 * sampleTime;
r1 = q1 + qDot2 * sampleTime;
r2 = q2 + qDot3 * sampleTime;
r3 = q3 + qDot4 * sampleTime;