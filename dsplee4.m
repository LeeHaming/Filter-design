%IIR��ͨ�˲����

wp=55*2*pi/750/pi;ws=pi*110*2/750/pi;rp=10;rs=50;%�����˲���ָ���
[N,wc]=buttord(wp,ws,rp,rs); %//�������N��3dB��ֹƵ�ʡ�
[B,A]=butter(N,wc); %//�������˲���ϵͳ����H��z��,B,A�ֱ�Ϊ���Ӻͷ�ĸ����ʽ��ϵ��������

Ts1=1/150;
n=0:29;
t=n*Ts1;
x1=3*sin(2*pi*t*10)+2*sin(2*pi*t*30)+sin(2*pi*t*50)+sin(2*pi*t*150);

f1=(0:length(x1)-1)'/(length(x1)*Ts1);
ft1_Y=filter(B,A,x1); %���ź�x1���е�ͨ�˲�
subplot(2,2,1),plot(n,ft1_Y);%�˲�����ź�
title('��T>1/2fc����ʹ��IIR��ͨ�˲���ʱ��');
xlabel('N');
ylabel('ft1-Y');

ft1fft=fft(ft1_Y);
subplot(2,2,3);
stem(abs(ft1fft));
title('��T>1/2fc����ʹ��IIR��ͨ�˲���Ƶ��');

Ts2=1/750;
n=0:149;
t=n*Ts2;
x2=3*sin(2*pi*t*10)+2*sin(2*pi*t*30)+sin(2*pi*t*50)+sin(2*pi*t*150);

f2=(0:length(x2)-1)/(length(x2)*Ts2);
ft2_Y=filter(B,A,x2); %���ź�x1���е�ͨ�˲�
subplot(2,2,2),plot(n,ft2_Y);%�˲�����ź�
title('��T>1/2fc����ʹ��IIR��ͨ�˲���ʱ��');
xlabel('N');
ylabel('ft2-Y');


ft2fft=fft(ft2_Y);
subplot(2,2,4);
stem(abs(ft2fft));
title('��T<1/2fc����ʹ��IIR��ͨ�˲���Ƶ��');