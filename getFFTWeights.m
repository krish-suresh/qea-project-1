% Does FFT anaylsis of audio file
%
% PARAMS: n = the number of principle components to return
% RETURN: the n principle components

%function res = getFFTWeights(n)
    [data, Fs] = audioread('Rocky Raccoon (Remastered 2009).wav');
    data_fft = fft(data);
    tone_avg = ifft(data_fft);
    %plot(abs(data_fft(:,1)))
    
    %Fs = 1000;            % Sampling frequency
    fileLength = length(data_fft(:,1));  % Length of signal
    
    P2 = abs(data_fft/fileLength);
    P1 = P2(1:fileLength/2 + 1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    f = Fs*(0:(fileLength/2))/fileLength;
    plot(f,P1) 
    hold on
    title('Single-Sided Amplitude Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
    
    [pks,locs]  = findpeaks(data);
    song_vector = maxk(locs, 10);
    
%     DEPRECATED
%     compression_multiplier = P1 > 0.001;
%     compressed = P1 .* compression_multiplier;
%     %plot(f, compressed) 
%     
%     T = 1/Fs;
%     t = (0:fileLength-1)*T; %time vector
%     S = 0; %initialize S
%     waves = 0;
%     for index = 1:length(compressed)
%         amplitude = (compressed(index));
%         if amplitude > 0
%             Hz = f(index);
%             S = S + amplitude*sin(2*pi*Hz*t);
%             waves = waves + 1;
%             if mod(waves, 10) == 0
%                 waves
%             end
%         end
%     end

%end