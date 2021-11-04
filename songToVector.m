% Turns a song into a vector 
%
% PARAMS: filename = the name of the audio file containing the song
%         n        = the number of dimensions for the output vector
% RETURN: a n-dimensional vector representing the song with it's most
%         important frequencies in Hz

function res = songToVector(filename, n)
    % Load file
    [data, Fs] = audioread(filename); %Fs is the sampling frequency
    
    % Use FFT to get power-spectral density
    fHat = fft(data);
    fileLength = length(fHat(:,1));  % Length of signal
    
    % Get one-sided PSD
    P2 = abs(fHat/fileLength);
    P1 = P2(1:fileLength/2 + 1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(fileLength/2))/fileLength; %frequencies
    
%     %plot PSD
%     plot(f,P1) 
%     hold on
%     title('Single-Sided Amplitude Spectrum of X(t)')
%     xlabel('f (Hz)')
%     ylabel('|P1(f)|')
    
    % Find local maxima (peaks) and put into vector and return
    [peakValues,locs]  = findpeaks(P1); %largest peaks and their indices
    [maxPeaks, maxNumber] = maxk(peakValues,n); %n larkest peaks and their indices out of # of peaks
    maxLocs = locs(maxNumber); %indices of n largest peaks out of P1
    songVector = f(maxLocs); %frequencies corresponding to n largest peaks
    res = songVector; %return
end