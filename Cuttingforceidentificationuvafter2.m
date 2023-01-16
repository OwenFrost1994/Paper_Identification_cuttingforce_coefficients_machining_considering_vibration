clear;
clc;
close all;
%%�Ա������칹�����µı�ʶ���
D=8;%%���߰뾶
N=1;%%���߳���
B=pi/6;%%����������
Cp=2*pi/N;%%�ݼ��
dl=0.02;

%%���߸նȲ���%%
% kx=23030727.4827;%%x����ն�
% ky=23030727.4827;%%y����ն�
% cx=214.1390;%%x��������
% cy=214.1390;%%y��������
% mx=0.7037;%%x��������
% my=0.7037;%%y��������
kx=14220122.4764;%%x����ն�
ky=14220122.4764;%%y����ն�
cx=197.9761;%%x��������
cy=197.9761;%%y��������
mx=0.54639;%%x��������
my=0.54639;%%y��������

%%�ӹ�����%%
%%ϳ����ʽ:˳ϳ%%
Cm=1;%%ϳ����ʽ��˳ϳΪ1����ϳΪ0
S=1000;%%����ת��
f=40;%%�����ٶ�
fs=10000;%%����Ƶ��
ap=0.3;%%���������λmm��
ae=8;%%���������λmm��
Cn=8;%%Ȧ��circle number

%%������������%%
R=D/2;%%���߰뾶
kb=(2*tan(B))/D;%%k�¼���
fe=f/(N*S);%%feed every tooth
w=2*pi*S/60;%%���߽��ٶ�
T=2*pi/w;%%��������
Ns=floor(60*fs/S);%%һ�������ڵĲ��������
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
F1=zeros(3,Ns*Cn);%%�洢������������������칹����
F2=zeros(3,Ns*Cn);%%�洢������������������칹����
Xx=zeros(1,Ns*Cn);%%������x�������λ��
Xy=zeros(1,Ns*Cn);%%������y�������λ��
Vx=zeros(1,Ns*Cn);%%������x��������ٶ�
Vy=zeros(1,Ns*Cn);%%������y��������ٶ�
Dx=zeros(1,Ns*Cn);%%������x�����λ�Ʊ仯����fv�ĵ�һ������
Dy=zeros(1,Ns*Cn);%%������y�����λ�Ʊ仯����fv�ĵڶ�������
FA=zeros(1,Ns*Cn);
apx=zeros(1,Cn*N);
apy=zeros(1,Cn*N);


%%���ϲ���%%����GH909%%���칹
% Ktc=2933.066667;%%���������ϵ��  ��ϳ
% Kte=78.4;%%�����п���ϵ��
% Krc=1704.366667;%%���������ϵ��
% Kre=134;%%�����п���ϵ��

% Ktc=2967.033333;%%���������ϵ��  ���ϳ
% Kte=77.3;%%�����п���ϵ��
% Krc=1197.066667;%%���������ϵ��
% Kre=146.1;%%�����п���ϵ��

% Ktc=2648;%%���������ϵ�� ��ϳ
% Kte=84.5;%%�����п���ϵ��
% Krc=1416.2;%%���������ϵ��
% Kre=138;%%�����п���ϵ��

%%B��
% Ktc=2958.4;%%���������ϵ��  ��ϳ
% Kte=45.7;%%�����п���ϵ��
% Krc=1437.2;%%���������ϵ��
% Kre=66.85;%%�����п���ϵ��

% Ktc=2618.8;%%���������ϵ��  ����ϳ
% Kte=60.23333333;%%�����п���ϵ��
% Krc=1378.033333;%%���������ϵ��
% Kre=79.73333333;%%�����п���ϵ��

Ktc=2712.966667;%%���������ϵ�� ��ϳ
Kte=44.9;%%�����п���ϵ��
Krc=1487.2;%%���������ϵ��
Kre=71.76666667;%%�����п���ϵ��

Kac=251.55;%%���������ϵ��
Kae=52.9445;%%�����п���ϵ��
for i=1:1:Ns*Cn;
    Ca=Ca+DC;%%΢Ԫ�Ƕȵ��Ӽ��㵶�ߵ�ת����
    if Ca>=2*pi%%���ǵ��߶����ת���ڣ��ۼӵĵ��߽Ƕȳ���һ�ܾͼ�ȥһ��2��
        Ca=Ca-2*pi;
    else
    end
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
            fa=fe*sin(Cd)+Dx(i)*sin(Cd)+Dy(i)*cos(Cd);%
            if Cd<Cex&&Cd>Cst&&fa>=0
            fx=(-cos(Cd))*(Ktc*fa+Kte)*dl+(-sin(Cd))*(Krc*fa+Kre)*dl;
            fy=( sin(Cd))*(Ktc*fa+Kte)*dl+(-cos(Cd))*(Krc*fa+Kre)*dl;
            fz=(Kac*fa+Kae)*dl;
            else
                fx=0;fy=0;fz=0;
            end
            Fx=Fx+fx;Fy=Fy+fy;Fz=Fz+fz;
        end
    end
    F1(1,i)=Fx;F1(2,i)=Fy;F1(3,i)=Fz;%%�ھ����д洢������
    Fx=0;Fy=0;Fz=0;%%���������ۼӱ�������
    %Runge-Kutta�����㵶�ߵ���λ�ƺ��ٶ�
    if  i==1 %%�ж��Ƿ��ǳ�ʼ�㣨��һ���㣩
        K1=0;L1=(-cx*0-kx*0+0)/mx;
        K2=0+Dt*L1/2;L2=(-cx*(0+Dt*L1/2)-kx*(0+Dt*K1/2)+(0+F1(1,i))/2)/mx;
        K3=0+Dt*L2/2;L3=(-cx*(0+Dt*L2/2)-kx*(0+Dt*K2/2)+(0+F1(1,i))/2)/mx;
        K4=0+Dt*L3;L4=(-cx*(0+Dt*L3)-kx*(0+Dt*K3)+F1(1,i))/mx;
        Xx(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=0;L1=(-cy*0-ky*0+0)/my;
        K2=0+Dt*L1/2;L2=(-cy*(0+Dt*L1/2)-ky*(0+Dt*K1/2)+(0+F1(2,i))/2)/my;
        K3=0+Dt*L2/2;L3=(-cy*(0+Dt*L2/2)-ky*(0+Dt*K2/2)+(0+F1(2,i))/2)/my;
        K4=0+Dt*L3;L4=(-cy*(0+Dt*L3)-ky*(0+Dt*K3)+F1(2,i))/my;
        Xy(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
    else %%���ǳ�ʼ��
        K1=Vx(i-1);L1=(-cx*Vx(i-1)-kx*Xx(i-1)+F1(1,i-1))/mx;
        K2=Vx(i-1)+Dt*L1/2;L2=(-cx*(Vx(i-1)+Dt*L1/2)-kx*(Xx(i-1)+Dt*K1/2)+(F1(1,i-1)+F1(1,i))/2)/mx;
        K3=Vx(i-1)+Dt*L2/2;L3=(-cx*(Vx(i-1)+Dt*L2/2)-kx*(Xx(i-1)+Dt*K2/2)+(F1(1,i-1)+F1(1,i))/2)/mx;
        K4=Vx(i-1)+Dt*L3;L4=(-cx*(Vx(i-1)+Dt*L3)-kx*(Xx(i-1)+Dt*K3)+F1(1,i))/mx;
        Xx(i)=Xx(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=Vx(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=Vy(i-1);L1=(-cy*Vy(i-1)-ky*Xy(i-1)+F1(2,i-1))/my;
        K2=Vy(i-1)+Dt*L1/2;L2=(-cy*(Vy(i-1)+Dt*L1/2)-ky*(Xy(i-1)+Dt*K1/2)+(F1(2,i-1)+F1(2,i))/2)/my;
        K3=Vy(i-1)+Dt*L2/2;L3=(-cy*(Vy(i-1)+Dt*L2/2)-ky*(Xy(i-1)+Dt*K2/2)+(F1(2,i-1)+F1(2,i))/2)/my;
        K4=Vy(i-1)+Dt*L3;L4=(-cy*(Vy(i-1)+Dt*L3)-ky*(Xy(i-1)+Dt*K3)+F1(2,i))/my;
        Xy(i)=Xy(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=Vy(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
    end
end

%%���ϲ���%%����GH909%%���칹

% Ktc=3103.433333;%%���������ϵ�� ��ϳ
% Kte=73.5;%%�����п���ϵ��
% Krc=1806.466667;%%���������ϵ��
% Kre=131.0333333;%%�����п���ϵ��


% Ktc=2910.5;%%���������ϵ�� ���ϳ
% Kte=68.23333333;%%�����п���ϵ��
% Krc=1178.166667;%%���������ϵ��
% Kre=142.5666667;%%�����п���ϵ��

% Ktc=2734.2;%%���������ϵ�� ��ϳ
% Kte=78.1;%%�����п���ϵ��
% Krc=1467.8;%%���������ϵ��
% Kre=134.4;%%�����п���ϵ��

% Ktc=2835.55;%%���������ϵ�� ��ϳ
% Kte=43;%%�����п���ϵ��
% Krc=1384.25;%%���������ϵ��
% Kre=65.4;%%�����п���ϵ��

% Ktc=2682.366667;%%���������ϵ�� ����ϳ
% Kte=56.8;%%�����п���ϵ��
% Krc=1416.6;%%���������ϵ��
% Kre=77.7;%%�����п���ϵ��

Ktc=2800.166667;%%���������ϵ�� ��ϳ
Kte=42.7;%%�����п���ϵ��
Krc=1516.766667;%%���������ϵ��
Kre=71.06666667;%%�����п���ϵ��

Kac=251.55;%%���������ϵ��
Kae=52.9445;%%�����п���ϵ��
for i=1:1:Ns*Cn;
    Ca=Ca+DC;%%΢Ԫ�Ƕȵ��Ӽ��㵶�ߵ�ת����
    if Ca>=2*pi%%���ǵ��߶����ת���ڣ��ۼӵĵ��߽Ƕȳ���һ�ܾͼ�ȥһ��2��
        Ca=Ca-2*pi;
    else
    end
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
            fa=fe*sin(Cd)+Dx(i)*sin(Cd)+Dy(i)*cos(Cd);%
            if Cd<Cex&&Cd>Cst&&fa>=0
            fx=(-cos(Cd))*(Ktc*fa+Kte)*dl+(-sin(Cd))*(Krc*fa+Kre)*dl;
            fy=( sin(Cd))*(Ktc*fa+Kte)*dl+(-cos(Cd))*(Krc*fa+Kre)*dl;
            fz=(Kac*fa+Kae)*dl;
            else
                fx=0;fy=0;fz=0;
            end
            Fx=Fx+fx;Fy=Fy+fy;Fz=Fz+fz;
        end
    end
    F2(1,i)=Fx;F2(2,i)=Fy;F2(3,i)=Fz;%%�ھ����д洢������
    Fx=0;Fy=0;Fz=0;%%���������ۼӱ�������
    %Runge-Kutta�����㵶�ߵ���λ�ƺ��ٶ�
    if  i==1 %%�ж��Ƿ��ǳ�ʼ�㣨��һ���㣩
        K1=0;L1=(-cx*0-kx*0+0)/mx;
        K2=0+Dt*L1/2;L2=(-cx*(0+Dt*L1/2)-kx*(0+Dt*K1/2)+(0+F2(1,i))/2)/mx;
        K3=0+Dt*L2/2;L3=(-cx*(0+Dt*L2/2)-kx*(0+Dt*K2/2)+(0+F2(1,i))/2)/mx;
        K4=0+Dt*L3;L4=(-cx*(0+Dt*L3)-kx*(0+Dt*K3)+F2(1,i))/mx;
        Xx(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=0;L1=(-cy*0-ky*0+0)/my;
        K2=0+Dt*L1/2;L2=(-cy*(0+Dt*L1/2)-ky*(0+Dt*K1/2)+(0+F2(2,i))/2)/my;
        K3=0+Dt*L2/2;L3=(-cy*(0+Dt*L2/2)-ky*(0+Dt*K2/2)+(0+F2(2,i))/2)/my;
        K4=0+Dt*L3;L4=(-cy*(0+Dt*L3)-ky*(0+Dt*K3)+F2(2,i))/my;
        Xy(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
    else %%���ǳ�ʼ��
        K1=Vx(i-1);L1=(-cx*Vx(i-1)-kx*Xx(i-1)+F2(1,i-1))/mx;
        K2=Vx(i-1)+Dt*L1/2;L2=(-cx*(Vx(i-1)+Dt*L1/2)-kx*(Xx(i-1)+Dt*K1/2)+(F2(1,i-1)+F2(1,i))/2)/mx;
        K3=Vx(i-1)+Dt*L2/2;L3=(-cx*(Vx(i-1)+Dt*L2/2)-kx*(Xx(i-1)+Dt*K2/2)+(F2(1,i-1)+F2(1,i))/2)/mx;
        K4=Vx(i-1)+Dt*L3;L4=(-cx*(Vx(i-1)+Dt*L3)-kx*(Xx(i-1)+Dt*K3)+F2(1,i))/mx;
        Xx(i)=Xx(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=Vx(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=Vy(i-1);L1=(-cy*Vy(i-1)-ky*Xy(i-1)+F2(2,i-1))/my;
        K2=Vy(i-1)+Dt*L1/2;L2=(-cy*(Vy(i-1)+Dt*L1/2)-ky*(Xy(i-1)+Dt*K1/2)+(F2(2,i-1)+F2(2,i))/2)/my;
        K3=Vy(i-1)+Dt*L2/2;L3=(-cy*(Vy(i-1)+Dt*L2/2)-ky*(Xy(i-1)+Dt*K2/2)+(F2(2,i-1)+F2(2,i))/2)/my;
        K4=Vy(i-1)+Dt*L3;L4=(-cy*(Vy(i-1)+Dt*L3)-ky*(Xy(i-1)+Dt*K3)+F2(2,i))/my;
        Xy(i)=Xy(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=Vy(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
    end
end

%%���ĶԱȼӽ���%%
A11=xlsread('Is071.xlsx',1);
% A12=xlsread('Is011.xlsx',2);
% A11=[A12;A11];
A1=downsample(A11,2);
clear A11;
clear A12;
[m,n]=size(A1);
A=zeros(m,1);
A=A1(:,2);
A1(:,2)=A1(:,3);
A1(:,3)=A;%%xy���򽻻�
A1(:,2)=A1(:,2)-(sum(A1(1:100,2))+sum(A1(m-99:m,2)))/200;
A1(:,3)=A1(:,3)-(sum(A1(1:100,3))+sum(A1(m-99:m,3)))/200;
A1(:,4)=A1(:,4)-(sum(A1(1:100,4))+sum(A1(m-99:m,4)))/200;%%����z������Ư

n1=2*Ns-60;
n2=3*Ns-60;
n3=5*Ns+40;
n4=6*Ns+40;
figure(1)
subplot(2,1,1)
plot(A1(n3:n4,1),F1(1,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',2.0);%%���칹����������ϵ��
hold on;
plot(A1(n3:n4,1),F2(1,n1:n2),'r-.','Markersize',7,'Markerface','white','linewidth',2.0);%%���칹����������ϵ��
hold on;
plot(A1(n3:n4,1),A1(n3:n4,2),'k-','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(n3:n4,1)) max(A1(n3:n4,1))])
xlabel('ʱ��(s)')
ylabel('F_x(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('���칹����ϵ��Ԥ��','���칹����ϵ��Ԥ��','ʵ��������')
subplot(2,1,2)
plot(A1(n3:n4,1),F1(2,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',2.0);%%���칹����������ϵ��
hold on;
plot(A1(n3:n4,1),F2(2,n1:n2),'r-.','Markersize',7,'Markerface','white','linewidth',2.0);%%���칹����������ϵ��
hold on;
plot(A1(n3:n4,1),A1(n3:n4,3),'k-','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(n3:n4,1)) max(A1(n3:n4,1))])
xlabel('ʱ��(s)')
ylabel('F_y(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('���칹����ϵ��Ԥ��','���칹����ϵ��Ԥ��','ʵ��������')
