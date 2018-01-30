%=====================================================================================================
% Madgwick.m is a direct Matlab port of MadgwickAHRS.c
%=====================================================================================================
%
% sampleFreq	= 512.0;		% sample frequency in Hz
% sampleTime    = 1/sampleFreq;
% betaDef		= 0.1;		% 2 * proportional gain
% beta = betaDef;     % 2 * proportional gain (Kp)
%
% % quaternion of sensor frame relative to auxiliary frame
% q0 = 1.0;
% q1 = 0.0;
% q2 = 0.0;
% q3 = 0.0;
%

function [q0, q1, q2, q3] = Madgwick(q0, q1, q2, q3, gx, gy, gz, ax, ay, az, mx, my, mz)

% Rate of change of quaternion from gyroscope
qDot1 = 0.5 * (-q1 * gx - q2 * gy - q3 * gz);
qDot2 = 0.5 * ( q0 * gx + q2 * gz - q3 * gy);
qDot3 = 0.5 * ( q0 * gy - q1 * gz + q3 * gx);
qDot4 = 0.5 * ( q0 * gz + q1 * gy - q2 * gx);

% Normalise accelerometer measurement
a_dotproduct = ax * ax + ay * ay + az * az;
if a_dotproduct ~= 0
    recipNorm = invSqrt(a_dotproduct);
    ax = ax * recipNorm;
    ay = ay * recipNorm;
    az = az * recipNorm;
    
    % Normalise magnetometer measurement
    m_dotproduct = mx * mx + my * my + mz * mz;
    recipNorm = invSqrt(m_dotproduct);
    if m_dotproduct ~= 0
        mx = mx * recipNorm;
        my = my * recipNorm;
        mz = mz * recipNorm;
    end
    
    % Auxiliary variables to avoid repeated arithmetic
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
    s0 = -v2q2 * (2.0 * q1q3 - v2q0q2 - ax) + v2q1 * (2.0 * q0q1 + v2q2q3 - ay) - v2bz * q2 * (v2bx * (0.5 - q2q2 - q3q3) + v2bz * (q1q3 - q0q2) - mx) + (-v2bx * q3 + v2bz * q1) * (v2bx * (q1q2 - q0q3) + v2bz * (q0q1 + q2q3) - my) + v2bx * q2 * (v2bx * (q0q2 + q1q3) + v2bz * (0.5 - q1q1 - q2q2) - mz);
    s1 =  v2q3 * (2.0 * q1q3 - v2q0q2 - ax) + v2q0 * (2.0 * q0q1 + v2q2q3 - ay) - 4.0 * q1 * (1 - 2.0 * q1q1 - 2.0 * q2q2 - az) + v2bz * q3 * (v2bx * (0.5 - q2q2 - q3q3) + v2bz * (q1q3 - q0q2) - mx) + (v2bx * q2 + v2bz * q0) * (v2bx * (q1q2 - q0q3) + v2bz * (q0q1 + q2q3) - my) + (v2bx * q3 - v4bz * q1) * (v2bx * (q0q2 + q1q3) + v2bz * (0.5 - q1q1 - q2q2) - mz);
    s2 = -v2q0 * (2.0 * q1q3 - v2q0q2 - ax) + v2q3 * (2.0 * q0q1 + v2q2q3 - ay) - 4.0 * q2 * (1 - 2.0 * q1q1 - 2.0 * q2q2 - az) + (-v4bx * q2 - v2bz * q0) * (v2bx * (0.5 - q2q2 - q3q3) + v2bz * (q1q3 - q0q2) - mx) + (v2bx * q1 + v2bz * q3) * (v2bx * (q1q2 - q0q3) + v2bz * (q0q1 + q2q3) - my) + (v2bx * q0 - v4bz * q2) * (v2bx * (q0q2 + q1q3) + v2bz * (0.5 - q1q1 - q2q2) - mz);
    s3 =  v2q1 * (2.0 * q1q3 - v2q0q2 - ax) + v2q2 * (2.0 * q0q1 + v2q2q3 - ay) + (-v4bx * q3 + v2bz * q1) * (v2bx * (0.5 - q2q2 - q3q3) + v2bz * (q1q3 - q0q2) - mx) + (-v2bx * q0 + v2bz * q2) * (v2bx * (q1q2 - q0q3) + v2bz * (q0q1 + q2q3) - my) + v2bx * q1 * (v2bx * (q0q2 + q1q3) + v2bz * (0.5 - q1q1 - q2q2) - mz);
    recipNorm = invSqrt(s0 * s0 + s1 * s1 + s2 * s2 + s3 * s3); % normalise step magnitude
    s0 = s0 * recipNorm;
    s1 = s1 * recipNorm;
    s2 = s2 * recipNorm;
    s3 = s3 * recipNorm;
    
    % Apply feedback step
    qDot1 = qDot1 - beta * s0;
    qDot2 = qDot2 - beta * s1;
    qDot3 = qDot3 - beta * s2;
    qDot4 = qDot4 - beta * s3;
end

% Integrate rate of change of quaternion to yield quaternion
q0 = q0 + qDot1 * sampleTime;
q1 = q1 + qDot2 * sampleTime;
q2 = q2 + qDot3 * sampleTime;
q3 = q3 + qDot4 * sampleTime;

% Normalise quaternion
recipNorm = invSqrt(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3);
q0 = q0 * recipNorm;
q1 = q1 * recipNorm;
q2 = q2 * recipNorm;
q3 = q3 * recipNorm;
