clear;
clc;
%%������Ԥ��ģ�ͣ�����״̬�£����ǵ��ߵ��񶯣������ߵ���δ���빤����%%
%%����ƫ�ģ��������е��ݶ����룬������������ϵ�������ﵶ��Ϊ΢Ԫ��ʽ%%
%%���߼��β���%%
D=10;%%���߰뾶
N=4;%%���߳���
B=pi/6;%%����������
Cp=2*pi/N;%%�ݼ��
dl=0.02;%%΢Ԫ����

%%����ƫ�Ĳ���%%
r=32.30;%%�ѣ���λum
rs=91.51;%%�ˣ���λ��

%%���߸նȲ���%%
kx=13543571.05;%%x����ն�
ky=14808892.07;%%y����ն�
cx=0.033112;%%x��������
cy=0.032257;%%y��������
mx=6.788226;%%x��������
my=7.104583;%%y��������

%%���ϲ���%%����AL7075%%���¼�������7075���п������������µ�7050��������
Ktc=758.17;%%���������ϵ������
mt=0.1723;%%���������ϵ��ָ��
Kte=14.0371;%%�����п���ϵ��
Krc=86.10;%%���������ϵ������
mr=0.6609;%%���������ϵ��ָ��
Kre=16.5002;%%�����п���ϵ��
Kac=143.10;%%���������ϵ������
ma=0.1555;%%���������ϵ��ָ��
Kae=-1.25118;%%�����п���ϵ��

%%�ӹ�����%%
%%ϳ����ʽ:˳ϳ%%
Cm=1;%%ϳ����ʽ��˳ϳΪ1����ϳΪ0
S=2000;%%����ת��
f=600;%%�����ٶ�
fs=10000;%%����Ƶ��
ap=1;%%���������λmm��
ae=3;%%���������λmm��
Cn=4;%%Ȧ��circle number
    
%%������������%%
R=D/2;%%���߰뾶
kb=(2*tan(B))/D;%%k�¼���
fe=f/(N*S);%%feed every tooth
w=2*pi*S/60;%%���߽��ٶ�
T=2*pi/w;%%��������
Ns=floor(60*fs/S);%%һ�������ڵĲ��������
r=r/1000;%%ƫ������λת��Ϊmm
rs=rs*2*pi/360;%%�ǶȻ�����
if Cm==1%%˳ϳ
    Cst=pi-acos((R-ae)/R);%%�����
    Cex=pi;%%�г���
else%%��ϳ
    Cst=0;%%�����
    Cex=acos((R-ae)/R);%%�г���
end
Cs=0;%%��ʼ�Ƕ�
Dt=T/Ns;%%ʱ�䲽��
DC=Dt*w;%%�Ƕ�����
Ca=Cs;%%��ʼ�Ƕ�


%%���ִ洢��Ԫ%%
Fx=0;
Fy=0;
Fz=0;%%���������ۼӱ���
F=zeros(3,Ns*Cn);%%�洢���������������
Xx=zeros(1,Ns*Cn);%%������x�������λ��
Xy=zeros(1,Ns*Cn);%%������y�������λ��
Vx=zeros(1,Ns*Cn);%%������x��������ٶ�
Vy=zeros(1,Ns*Cn);%%������y��������ٶ�
Dx=zeros(1,Ns*Cn);%%������x�����λ�Ʊ仯����fv�ĵ�һ������
Dy=zeros(1,Ns*Cn);%%������y�����λ�Ʊ仯����fv�ĵڶ�������
FA=zeros(1,Ns*Cn);
apx=zeros(1,Cn*N);
apy=zeros(1,Cn*N);

%%��������ģ����Ĵ�ѭ��
for i=1:1:Ns*Cn;
    Ca=Ca+DC;%%΢Ԫ�Ƕȵ��Ӽ��㵶�ߵ�ת����
    if Ca>=2*pi%%���ǵ��߶����ת���ڣ��ۼӵĵ��߽Ƕȳ���һ�ܾͼ�ȥһ��2��
        Ca=Ca-2*pi;
    else
    end
    %���������ʱ�̵�������
%     for k=1:1:2
       %%���㸽�ӽ�����
       if i<=(Ns/N)%%����ǵ�һ���������е�ʱ����м�ϱ���û��ǰһ�������г��Ĳ��Ʊ��棬��ʱ�൱�ڵ������񶯵����
           Dx(i)=1000*(Xx(i)-0);%%ע�⵽����ѧ�����������е�λΪ�����Ƶ�λ������õ�λ�Ƶ�λΪm����ÿ�ݽ������ĵ�λ��mm
           Dy(i)=1000*(Xy(i)-0);
       else
           q=floor(i*N/Ns);
           if (i-q*Ns/N)==0
               q=q-1;
           else
           end
           for n=1:1:q
               apx(n)=Xx(i-n*Ns/N);
               apy(n)=Xy(i-n*Ns/N);
           end
           Dx(i)=1000*(Xx(i)-min(apx(1:q)));
           Dy(i)=1000*(Xy(i)-min(apy(1:q)));
       end
    
    %���Ӽ��������ݵ���ѭ��
    for j=1:1:N
        C=Ca-(j-1)*Cp;%%���Ƕ�ݴ��ڵĳݼ���ͺ�
        if C<0
            C=C+2*pi;%%������ݽǶ�С������ת�����ĽǶ�
        else
        end
        %%΢Ԫ���Ӽ���һ�������ϵ�������
        for m=1:1:ap/dl
            Cd=C-(m-1)*kb*dl;
            if j==1
                si=r*(cos(rs-Cd)-cos(rs-Cd-2*(N-2)*pi/N));
            else
                si=r*(cos(rs-Cd-2*(j-1)*pi/N)-cos(rs-Cd-2*(j-2)*pi/N));
            end
            fa=fe*sin(Cd)+Dx(i)*sin(Cd)+Dy(i)*cos(Cd)+si;%����ʵ�ʽ�����
            if Cd<Cex&&Cd>Cst&&fa>=0
            fx=(-cos(Cd))*(Ktc*((fa)^(1-mt))+Kte)*dl+(-sin(Cd))*(Krc*((fa)^(1-mr))+Kre)*dl;
            fy=( sin(Cd))*(Ktc*((fa)^(1-mt))+Kte)*dl+(-cos(Cd))*(Krc*((fa)^(1-mr))+Kre)*dl;
            fz=(Kac*((fa)^(1-ma))+Kae)*dl;
            else
                fx=0;fy=0;fz=0;
            end
            Fx=Fx+fx;Fy=Fy+fy;Fz=Fz+fz;
        end
    end
    F(1,i)=Fx;F(2,i)=Fy;F(3,i)=Fz;%%�ھ����д洢������
    Fx=0;Fy=0;Fz=0;%%���������ۼӱ�������
    %Runge-Kutta�����㵶�ߵ���λ�ƺ��ٶ�
    if  i==1 %%�ж��Ƿ��ǳ�ʼ�㣨��һ���㣩
        K1=0;L1=(-cx*0-kx*0+0)/mx;
        K2=0+Dt*L1/2;L2=(-cx*(0+Dt*L1/2)-kx*(0+Dt*K1/2)+(0+F(1,i))/2)/mx;
        K3=0+Dt*L2/2;L3=(-cx*(0+Dt*L2/2)-kx*(0+Dt*K2/2)+(0+F(1,i))/2)/mx;
        K4=0+Dt*L3;L4=(-cx*(0+Dt*L3)-kx*(0+Dt*K3)+F(1,i))/mx;
        Xx(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=0;L1=(-cy*0-ky*0+0)/my;
        K2=0+Dt*L1/2;L2=(-cy*(0+Dt*L1/2)-ky*(0+Dt*K1/2)+(0+F(2,i))/2)/my;
        K3=0+Dt*L2/2;L3=(-cy*(0+Dt*L2/2)-ky*(0+Dt*K2/2)+(0+F(2,i))/2)/my;
        K4=0+Dt*L3;L4=(-cy*(0+Dt*L3)-ky*(0+Dt*K3)+F(2,i))/my;
        Xy(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
    else %%���ǳ�ʼ��
        K1=Vx(i-1);L1=(-cx*Vx(i-1)-kx*Xx(i-1)+F(1,i-1))/mx;
        K2=Vx(i-1)+Dt*L1/2;L2=(-cx*(Vx(i-1)+Dt*L1/2)-kx*(Xx(i-1)+Dt*K1/2)+(F(1,i-1)+F(1,i))/2)/mx;
        K3=Vx(i-1)+Dt*L2/2;L3=(-cx*(Vx(i-1)+Dt*L2/2)-kx*(Xx(i-1)+Dt*K2/2)+(F(1,i-1)+F(1,i))/2)/mx;
        K4=Vx(i-1)+Dt*L3;L4=(-cx*(Vx(i-1)+Dt*L3)-kx*(Xx(i-1)+Dt*K3)+F(1,i))/mx;
        Xx(i)=Xx(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=Vx(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=Vy(i-1);L1=(-cy*Vy(i-1)-ky*Xy(i-1)+F(2,i-1))/my;
        K2=Vy(i-1)+Dt*L1/2;L2=(-cy*(Vy(i-1)+Dt*L1/2)-ky*(Xy(i-1)+Dt*K1/2)+(F(2,i-1)+F(2,i))/2)/my;
        K3=Vy(i-1)+Dt*L2/2;L3=(-cy*(Vy(i-1)+Dt*L2/2)-ky*(Xy(i-1)+Dt*K2/2)+(F(2,i-1)+F(2,i))/2)/my;
        K4=Vy(i-1)+Dt*L3;L4=(-cy*(Vy(i-1)+Dt*L3)-ky*(Xy(i-1)+Dt*K3)+F(2,i))/my;
        Xy(i)=Xy(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=Vy(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
    end
%     end
end

%%��������ͼ����ɫX�򣬺�ɫY����ɫZ��
figure(1)
plot(Dt:Dt:Cn*Ns*Dt,F(1,:),'bo');
hold on;
plot(Dt:Dt:Cn*Ns*Dt,F(2,:),'ro');
hold on;
plot(Dt:Dt:Cn*Ns*Dt,F(3,:),'go');
grid on;
FM=zeros(4,Ns*Cn);
FM(1,:)=Dt:Dt:Cn*Ns*Dt;
FM(2:4,:)=F;
xlswrite('D:\matlabworkspace\Article\datafornonlinearandcutteroffset',FM')
% %%���Ƶ�����x�����y�����λ�ƺ��ٶ�ͼ��
% figure(2)
% plot(Dt:Dt:Cn*Ns*Dt,1000*Xx(:),'bo');
% hold on;
% grid on;
% title('displacement at x direction')
% figure(3)
% plot(Dt:Dt:Cn*Ns*Dt,Vx(:),'ro');
% hold on;
% grid on;
% title('velocity at x direction')
% figure(4)
% plot(Dt:Dt:Cn*Ns*Dt,1000*Xy(:),'bo');
% hold on;
% grid on;
% title('displacement at y direction')
% figure(5)
% plot(Dt:Dt:Cn*Ns*Dt,Vy(:),'ro');
% hold on;
% grid on;
% title('velocity at y direction')
% figure(6)
% plot(Dt:Dt:Cn*Ns*Dt,Dx(:),'ro');
% hold on;
% grid on;
% figure(7)
% plot(Dt:Dt:Cn*Ns*Dt,Dy(:),'ro');
% hold on;
% grid on;