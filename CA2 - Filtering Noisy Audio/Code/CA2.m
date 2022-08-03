%%
%noisy audio
[signal,fs]=audioread('noisy.wav');
L = length(signal);
signalT = fft(signal);
f=fs*(1:(L))/(2*L);
plot(f,abs(signalT));
title('Spectrum');
xlabel('Frequency');
ylabel('Amplitude');
ylim([-1 35]);
figure;
plot(angle(signalT));
title('Phase');
xlabel('Frequency(Hz)');
ylabel('Phase');













%%
%System function
b=[1 0 0 0 0 0 0 0 -1];
a=[1 -1];
[h,w]=freqz(b,a);
figure;
plot(w/pi,abs(h));
title('Spectrum');
ax=gca;
ax.XTick=0:0.25:1;
xlabel('Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
figure;
plot(w/pi,angle(h));
title('Phase');
ax=gca;
ax.XTick=0:0.25:1;
xlabel('Frequency (\times\pi rad/sample)');
ylabel('Magnitude');%This is a Low Pass Filter

%%
%Zeros and Poles
fvtool(b,a,'polezero')
[b,a] = eqtflength(b,a);
tf2zp(b,a);

%%
%Impulse response
figure;
[impResp,t] = impz(b,a);
stem(t,impResp);
title('Impulse Response')

%%
%Filtering by the initial filter
signall=conv(impResp,signal);
audiowrite("filtered1.wav",signal,fs);
signall=conv(impResp,signall);
audiowrite("filtered2.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered3.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered4.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered5.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered6.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered7.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered8.wav",signall,fs);

%%
%Filtering by modified filter
b=[1/4 0 0 0 0 0 0 0 -1/4];
a=[1 -1];
[impResp,t] = impz(b,a);
signall=conv(impResp,signal);
audiowrite("filtered1Plus.wav",signal,fs);
signall=conv(impResp,signall);
audiowrite("filtered2Plus.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered3Plus.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered4Plus.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered5Plus.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered6Plus.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered7Plus.wav",signall,fs);
signall=conv(impResp,signall);
audiowrite("filtered8Plus.wav",signall,fs);

