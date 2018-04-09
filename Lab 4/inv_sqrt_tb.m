function inv_sqrt_tb
format long;

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
Nclock_edges = 7;
Ninputs = 1000;
buckets = 4;

small = fi(0, 0, 36, 18);
small.bin = '000000000000000000000000000000000001';
small.data;

error_count = 0;
max_error = 0;
min_error = 2^37;
sum_error = 0;
avg_error = 0;

for i=1:buckets
    
for clki=1:Ninputs
    if( i == 1 )
        a = randi((2^17) + 1) - 1 + (rand * 2^17);
    elseif( i == 2 )
        a = randi((2^8) + 1) - 1 + (rand * 2^17);
    elseif( i == 3 )
        a = (rand * 2^17) + small.data;
    else
        a = (rand * 2^8) + small.data;
    end
    
    %a = randi((2^17) + 1) - 1 + (rand * 2^17);
    
    fixed_word_width     = 36;  % width of input to component    
    fixed_point_signed   = 0;  % unsiged = 0, signed = 1;
    fixed_point_fraction = 18;  % fraction width (location of binary point within word)
    input_vector = fi(a, fixed_point_signed, fixed_word_width, fixed_point_fraction, Fm); % make the input a fixed point data type
    expected = 1/sqrt(a);
    
    %expected_vector = fi(expected, fixed_point_signed, fixed_word_width, fixed_point_fraction, Fm);
    %formatted_expected.bin = expected_vector.bin;
    y = fi(0, 0, 36, 18, Fm);
    
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
    %in = input_vector.bin;
    %input_vector.data;
    %y_value = y.data;
    %out = fi(y_value, 0, 36, 18, Fm);
    %out.bin;
    %out.data;
    %expect = expected_vector.bin;
    %expect_data = expected_vector.data;
    %expect_hex = expected_vector.hex;
    
    %error = error + (y.data - expected_vector.data)/(expected_vector.data);
    %error_nfi = ((y.data - expected_nfi)/(expected_nfi)) * 100;
    
    expected_formatted = fi(expected, 0, 36, 18, Fm);
    
    if(abs(expected_formatted.data - y.data) > 0) 
        error = abs(expected_formatted.data - y.data);
        in  = a;
        exp = expected;
        out = y.data;
        sum_error = sum_error + error;
        error_count = error_count + 1;
        if(error > max_error)
            max_error = error;
        end
        if(error < min_error)
            min_error = error;
        end
    else
        min_error = 0;
    end    
end
end

max_error = max_error
min_error = min_error
avg_error = sum_error/(buckets*Ninputs)
error_count = error_count


% TEST EDGE CASES %%

%inputs = ['100000000000000000000000000000000000' '000000000000000000000000000000000001' '000000000000000000100000000000000000' '000000000000000001000000000000000000' '111111111111111111111111111111111111'];
      
% for j=1:5
%     input = fi(0, 0, W, F, Fm);
%     %inputs(j)
%     input.bin = '111111111111111111111111111111111111';
%     
%     exp = 1/sqrt(input.data);
%     expfi = fi(exp, 0, 36, 18, Fm);
%     exp = expfi.data
%     
%     for clkj=1:Nclock_edges
%         y = step(fir_hdl, input);
%     end
%     
%     in = input.data
%     out = y.data
% 
% end
