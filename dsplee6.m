%��������FIR��ͨ�˲���

wp=55*2*pi/750;ws=110*2*pi/750;
Bt=ws-wp;%���ɿ��
N=50;
wc=(wp+ws)*pi/2;
hn=fir1(N,wc/pi,hanning(N+1));
freqz(hn,1,512);


