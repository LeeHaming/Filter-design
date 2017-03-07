%butterworth-IIR高通滤波器设计

ws=55*2*pi/750/pi;wp=pi*2*110/750/pi;rp=10;rs=50;%数字滤波器指标参
[N,wc]=buttord(wp,ws,rp,rs); %//计算阶数N和3dB截止频率。
[B,A]=butter(N,wc,'high'); %//求数字滤波器系统函数H（z）,B,A分别为分子和分母多项式的系数向量。
[H,W]=freqz(B,A,1000); %//计算数字滤波器的频率响应。1000为采样点数。得到的H。W都为1000个。
ymin=-rs-20;
m=abs(H);
p=unwrap(angle(H));
subplot(2,2,1);
plot(W/pi,20*log10(m/max(m)));grid on;
xlabel('\omega/\pi');ylabel('幅度（dB）');
axis([0,1,ymin,5]);
title('(a)损耗函数曲线');
subplot(2,2,3);
plot(W/pi,p/pi);
xlabel('\omega/pi');ylabel('相位/\pi');grid on;
title('(b)相频特性曲线');