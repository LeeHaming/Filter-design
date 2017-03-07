%窗函数高通滤波结果


Ts1=1/150;
n=0:29;
t=n*Ts1;
x1=3*sin(2*pi*t*10)+2*sin(2*pi*t*30)+sin(2*pi*t*50)+sin(2*pi*t*150);
wp=110*2*pi/750;ws=55*2*pi/750;
Bt=wp-ws;%过渡宽度
N0=ceil(6.2*pi/Bt);
N=N0+mod(N0+1,2);
wc=(wp+ws)/2/pi;
hn=fir1(N-1,wc,'high',hanning(N));
z1=conv(x1,hn);
n=0:length(z1)-1;
subplot(2,2,1),plot(n,z1);
title('对T>1/2fc序列使用窗函数高通滤波后时域');
ft1fft=fft(z2);
subplot(2,2,3);
stem(abs(ft1fft));
title('对T>1/2fc序列使用窗函数高通滤波后频域');

Ts2=1/750;
n=0:149;
t=n*Ts2;
x2=3*sin(2*pi*t*10)+2*sin(2*pi*t*30)+sin(2*pi*t*50)+sin(2*pi*t*150);
z2=conv(x2,hn);
n=0:length(z2)-1;
subplot(2,2,2),plot(n,z2);
title('对T<1/2fc序列使用窗函数高通滤波后时域');
ft2fft=fft(z2);
subplot(2,2,4);
stem(abs(ft2fft));
title('对T<1/2fc序列使用窗函数高通滤波后频域');