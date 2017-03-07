%butterworth-IIR��ͨ�˲������

ws=55*2*pi/750/pi;wp=pi*2*110/750/pi;rp=10;rs=50;%�����˲���ָ���
[N,wc]=buttord(wp,ws,rp,rs); %//�������N��3dB��ֹƵ�ʡ�
[B,A]=butter(N,wc,'high'); %//�������˲���ϵͳ����H��z��,B,A�ֱ�Ϊ���Ӻͷ�ĸ����ʽ��ϵ��������
[H,W]=freqz(B,A,1000); %//���������˲�����Ƶ����Ӧ��1000Ϊ�����������õ���H��W��Ϊ1000����
ymin=-rs-20;
m=abs(H);
p=unwrap(angle(H));
subplot(2,2,1);
plot(W/pi,20*log10(m/max(m)));grid on;
xlabel('\omega/\pi');ylabel('���ȣ�dB��');
axis([0,1,ymin,5]);
title('(a)��ĺ�������');
subplot(2,2,3);
plot(W/pi,p/pi);
xlabel('\omega/pi');ylabel('��λ/\pi');grid on;
title('(b)��Ƶ��������');