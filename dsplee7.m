%窗函数法FIR高通滤波器

wp=110*2*pi/750;ws=55*2*pi/750;
Bt=wp-ws;%过渡宽度
N0=ceil(6.2*pi/Bt);
N=N0+mod(N0+1,2);
wc=(wp+ws)/2/pi;
hn=fir1(N-1,wc,'high',hanning(N));
freqz(hn,1,512);