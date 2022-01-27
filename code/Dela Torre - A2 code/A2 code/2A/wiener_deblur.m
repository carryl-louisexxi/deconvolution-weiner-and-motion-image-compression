function I_deblur = wiener_deblur(I,B,k)
%% checking image type : double
if ( isa(I,'uint8') || isa(B,'uint8') )
  error('deblur: Image and blur data should be of type double.');
end

%% reduce edge ringing
I = edgetaper(I,B); 

%% get the fourier transforms
Fi = fft2(I); % blurred noisy image fourier transform
Fb = fft2(B, size(I, 1), size(I, 2)); % blurring function fourier transform. function use applies zero padding base on given size of I

%% dealing with zero values in Fb
Fb(Fb == 0) = 0.1;

%% inverse filter computation
absFB =  abs(Fb).^2;
inverseFiltered = ((Fi ./ Fb) .* (absFB ./ (absFB + k))); % still on frequency domain

%% convert to real image
I_deblur = real(ifft2(inverseFiltered)); % covert to spatial domain

%% HINTS
% Here you will need to:
% 1. zero pad B and compute its FFT
% 2. compute and apply the inverse filter
% 3. convert back to a real image
% 4. handle any spatial delay caused by zero padding of B
%
% you may need to deal with values near zero in the FFT of B etc
% to avoid division by zero's etc.

% modify the code above ------------------------------------------------
return

