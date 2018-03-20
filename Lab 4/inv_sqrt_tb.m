function fir_tb
format long;

%------------------------------------------------------------
% Note: it appears that the cosimWizard needs to be re-run if
% this is moved to a different machine (VHDL needs to be
% recompile in ModelSim).
%------------------------------------------------------------

% HdlCosimulation System Object creation (this Matlab function was created
% by the cosimWizard).
fir_hdl = hdlcosim_inv_sqrt;

W = 36;
F = 18;

Fm = fimath('RoundingMethod','Floor',...
            'OverflowAction','Wrap',...
            'ProductMode','SpecifyPrecision',...
            'ProductWordLength',W,...
            'ProductFractionLength',F,...
            'SumMode','SpecifyPrecision',...
            'SumWordLength',W,...
            'SumFractionLength',F);

% Simulate for Nclock rising edges (this will be the length of the
% simulation)
Nclock_edges = 30;
Ninputs = 1000;
%formatted_input = fi(0, 0, 36, 18);
%formatted_output = fi(0, 0, 36, 18);
%formatted_expected = fi(0, 0, 36, 18);

small = fi(0, 0, 36, 18);
small.bin = '000000000000000000000000000000000001';

error = zeros(Ninputs);

for clki=1:Ninputs
    
    a_int = randi((2^17) + 1) - 1;
    a_decimal = rand * 2^17;
    
    a = a_int + a_decimal
    
    
    fixed_word_width     = 36;  % width of input to component    
    fixed_point_signed   = 0;  % unsiged = 0, signed = 1;
    fixed_point_fraction = 18;  % fraction width (location of binary point within word)
    input_vector = fi(a, fixed_point_signed, fixed_word_width, fixed_point_fraction, Fm); % make the input a fixed point data type
    %formatted_input.bin = input_vector.bin;
    %input_vector.bin = '000000000000000000000010000000000000';
    input = input_vector.data;
    int1 = sqrt(input_vector);
    int2 = divide(numerictype, 1, int1);
    expected_nfi = 1/sqrt(a);
    expected = int2;
    
    expected_vector = fi(expected, fixed_point_signed, fixed_word_width, fixed_point_fraction, Fm);
    %formatted_expected.bin = expected_vector.bin;
    y = fi(0, 0, 36, 18);
    
    %in_double = double(formatted_input)
    %expected_double = double(formatted_expected)
    for clkj=1:Nclock_edges
        % step Nclock_edges times until output is ready
        y = step(fir_hdl, input_vector);
    end
    %formatted_output.bin = output.bin;
    %out = formatted_output.bin;
    %out_double = double(formatted_output)
    %e = formatted_expected.bin;
    %out = y.bin
    %expect = expected_vector.bin
    in = input_vector.bin;
    input_vector.data;
    y_value = y.data;
    out = fi(y_value, 0, 36, 18, Fm);
    out.bin;
    out.data;
    expect = expected_vector.bin;
    expect_data = expected_vector.data;
    expect_hex = expected_vector.hex;
    
    %error = error + (y.data - expected_vector.data)/(expected_vector.data);
    %error_nfi = ((y.data - expected_nfi)/(expected_nfi)) * 100;
    
    if(abs(expected_vector - y) > small) 
        
    end
    
end
perror = error/10;
%error
end
