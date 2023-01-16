clear;
clc;
close all;

D=8;%%���߰뾶
N=1;%%���߳���
B=pi/6;%%����������
Cp=2*pi/N;%%�ݼ��

%%���߸նȲ���%%
kx=14220122.4764;%%x����ն�
ky=14220122.4764;%%y����ն�
cx=197.9761;%%x��������
cy=197.9761;%%y��������
mx=0.54639;%%x��������
my=0.54639;%%y��������

Cm=1;%%ϳ����ʽ��˳ϳΪ1����ϳΪ0
S=1000;%%����ת��
f=40;%%�����ٶ�
ap=0.4;%%���������λmm��
ae=8;%%���������λmm��
fs=10000;%%����Ƶ��

%%������������%%
R=D/2;%%���߰뾶
kb=(2*tan(B))/D;%%k�¼���
fe=f/(N*S);%%feed every tooth
w=2*pi*S/60;%%���߽��ٶ�
T=2*pi/w;%%��������
Ts=1/fs;%%��������
Ns=floor(60*fs/S);%%һ�������ڵĲ��������
if Cm==1%%˳ϳ
    Cst=pi-acos((R-ae)/R);%%�����
    Cex=pi;%%�г���
else%%��ϳ
    Cst=0;%%�����
    Cex=acos((R-ae)/R);%%�г���
end
Dt=T/Ns;%%����������ļ��
Dc=Dt*w;%%ÿ���������ĽǶȲ�
Dn=ceil(Ns*abs(Cex-Cst)/(2*pi));%%�������̲��������
Nb=ceil(Ns*ap*kb/(2*pi))+10;%%


[Fo]=xlsread('Is081.xlsx',1);
[m,n]=size(Fo);
Fo(:,2)=Fo(:,2)-(sum(Fo(1:6,2))+sum(Fo(m-6:m,2)))/12;
Fo(:,3)=Fo(:,3)-(sum(Fo(1:6,3))+sum(Fo(m-6:m,3)))/12;
Fo(:,4)=Fo(:,4)-(sum(Fo(1:6,4))+sum(Fo(m-6:m,4)))/12;
A=zeros(m,1);
A=Fo(:,2);
Fo(:,2)=Fo(:,3);
Fo(:,3)=A;%%xy���򽻻�
Fo=downsample(Fo,2);
figure(1);
subplot(3,1,1);
plot(Fo(1:2000,1),Fo(1:2000,2),'b');
hold on;
grid on;
subplot(3,1,2);
plot(Fo(1:2000,1),Fo(1:2000,3),'r');
grid on;
hold on;
subplot(3,1,3);
plot(Fo(1:2000,1),Fo(1:2000,4),'k');
hold on;
grid on;


[m,n]=size(Fo);
%%ѡ���������������ڵ�����
F=Fo(127:m,:);
n1=1*Ns;n2=6*Ns;
figure(2);
subplot(2,1,1);
plot(F(n1:n2,1),F(n1:n2,2),'b','Markersize',7,'Markerface','white','linewidth',2.0);
hold on;
grid on;
xlim([min(F(n1:n2,1)) max(F(n1:n2,1))]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
xlabel('time(s)')
ylabel('F_x(N)')
subplot(2,1,2);
plot(F(n1:n2,1),F(n1:n2,3),'r','Markersize',7,'Markerface','white','linewidth',2.0);
grid on;
hold on;
xlim([min(F(n1:n2,1)) max(F(n1:n2,1))]);
set(gca,'FontName','Times New Roman' ,'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
xlabel('time(s)')
ylabel('F_y(N)')

tic

%%����ϵת��
C=Cst;
[m,n]=size(F);
Xx=zeros(1,m);%%������x�������λ��
Xy=zeros(1,m);%%������y�������λ��
Vx=zeros(1,m);%%������x��������ٶ�
Vy=zeros(1,m);%%������y��������ٶ�
Dx=zeros(1,m);%%������x�����λ�Ʊ仯����fv�ĵ�һ������
Dy=zeros(1,m);%%������y�����λ�Ʊ仯����fv�ĵڶ�������
for i=1:1:m
    
    %%Runge-Kutta����⵶����
    if  i==1 %%�ж��Ƿ��ǳ�ʼ�㣨��һ���㣩
        K1=0;L1=(-cx*0-kx*0+0)/mx;
        K2=0+Dt*L1/2;L2=(-cx*(0+Dt*L1/2)-kx*(0+Dt*K1/2)+(0+F(i,2))/2)/mx;
        K3=0+Dt*L2/2;L3=(-cx*(0+Dt*L2/2)-kx*(0+Dt*K2/2)+(0+F(i,2))/2)/mx;
        K4=0+Dt*L3;L4=(-cx*(0+Dt*L3)-kx*(0+Dt*K3)+F(i,2))/mx;
        Xx(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=0;L1=(-cy*0-ky*0+0)/my;
        K2=0+Dt*L1/2;L2=(-cy*(0+Dt*L1/2)-ky*(0+Dt*K1/2)+(0+F(i,3))/2)/my;
        K3=0+Dt*L2/2;L3=(-cy*(0+Dt*L2/2)-ky*(0+Dt*K2/2)+(0+F(i,3))/2)/my;
        K4=0+Dt*L3;L4=(-cy*(0+Dt*L3)-ky*(0+Dt*K3)+F(i,3))/my;
        Xy(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
    else %%���ǳ�ʼ��
        K1=Vx(i-1);L1=(-cx*Vx(i-1)-kx*Xx(i-1)+F(i-1,2))/mx;
        K2=Vx(i-1)+Dt*L1/2;L2=(-cx*(Vx(i-1)+Dt*L1/2)-kx*(Xx(i-1)+Dt*K1/2)+(F(i-1,2)+F(i,2))/2)/mx;
        K3=Vx(i-1)+Dt*L2/2;L3=(-cx*(Vx(i-1)+Dt*L2/2)-kx*(Xx(i-1)+Dt*K2/2)+(F(i-1,2)+F(i,2))/2)/mx;
        K4=Vx(i-1)+Dt*L3;L4=(-cx*(Vx(i-1)+Dt*L3)-kx*(Xx(i-1)+Dt*K3)+F(i,2))/mx;
        Xx(i)=Xx(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=Vx(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=Vy(i-1);L1=(-cy*Vy(i-1)-ky*Xy(i-1)+F(i-1,3))/my;
        K2=Vy(i-1)+Dt*L1/2;L2=(-cy*(Vy(i-1)+Dt*L1/2)-ky*(Xy(i-1)+Dt*K1/2)+(F(i-1,3)+F(i,3))/2)/my;
        K3=Vy(i-1)+Dt*L2/2;L3=(-cy*(Vy(i-1)+Dt*L2/2)-ky*(Xy(i-1)+Dt*K2/2)+(F(i-1,3)+F(i,3))/2)/my;
        K4=Vy(i-1)+Dt*L3;L4=(-cy*(Vy(i-1)+Dt*L3)-ky*(Xy(i-1)+Dt*K3)+F(i,3))/my;
        Xy(i)=Xy(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=Vy(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
    end
    
    %%���������ϵĸ��ӽ�����
    if i<=(Ns/N)%%����ǵ�һ���������е�ʱ����м�ϱ���û��ǰһ�������г��Ĳ��Ʊ��棬��ʱ�൱�ڵ������񶯵����
        Dx(i)=1000*(Xx(i)-0);%%ע�⵽����ѧ�����������е�λΪ�����Ƶ�λ������õ�λ�Ƶ�λΪm����ÿ�ݽ������ĵ�λ��mm
        Dy(i)=1000*(Xy(i)-0);
    else
        Dx(i)=1000*(Xx(i)-Xx(i-floor(Ns/N)));
        Dy(i)=1000*(Xy(i)-Xx(i-floor(Ns/N)));
    end
    %%�����Ӿ�̬����ϵת������̬����ϵ
    C=C+Dc;
    if C>2*pi
        C=C-2*pi;
    else
    end
    T=[-cos(C),-sin(C),0;sin(C),-cos(C),0;0,0,1];
    f=F(i,2:4);
    F(i,2:4)=(inv(T)*f')'/ap;
end
%%�����϶�̬��м������������ϵ��
%%ע�������г��β���ʹ�ã����������һ�ܵģ��������ڵĵ�һ������ʹ�ã�
FF=F(Ns+1:2*Ns,:);
NB=Nb-1;%%�����г����ֵĳ���
Nv=Dn-2*NB;%%��Ч��ĸ���
%%�������۽�����+���ӽ�����
m=floor(m/Ns);
Fk=zeros(6,m);%%�洢����������ϵ���Ľ��
for j=1:1:m%%��1��ʼȥ����һ������
for i=1:1:Nv
    C=Cst+(i+NB)*Dc;
    fi(i)=fe*sin(C);%%ideal feed peer tooth
    fa(i)=fi(i)+sin(C)*Dx(j*Ns+i+NB)+cos(C)*Dy(j*Ns+i+NB);
end
M=ones(Nv,2);
M(:,1)=fa';
D=[M,zeros(Nv,2),zeros(Nv,2);zeros(Nv,2),M,zeros(Nv,2);zeros(Nv,2),zeros(Nv,2),M];%%ǰ��ϵ������
Fb=[F(j*Ns+1+NB:j*Ns+Nv+NB,2);F(j*Ns+1+NB:j*Ns+Nv+NB,3);F(j*Ns+1+NB:j*Ns+Nv+NB,4)];%%�Ҳ������������
A=D'*D;%%A^T*A,����������
B=D'*Fb;%%A^T*F���Ҳ��������
Fk(:,j)=A\B;
end
for j=1:1:m%%��1��ʼȥ����һ������
for i=1:1:Nv
    C=Cst+(i+NB)*Dc;
    fi(i)=fe*sin(C);%%ideal feed peer tooth
end
M=ones(Nv,2);
M(:,1)=fi';
D=[M,zeros(Nv,2),zeros(Nv,2);zeros(Nv,2),M,zeros(Nv,2);zeros(Nv,2),zeros(Nv,2),M];%%ǰ��ϵ������
Fb=[F(j*Ns+1+NB:j*Ns+Nv+NB,2);F(j*Ns+1+NB:j*Ns+Nv+NB,3);F(j*Ns+1+NB:j*Ns+Nv+NB,4)];%%�Ҳ������������
A=D'*D;%%A^T*A,����������
B=D'*Fb;%%A^T*F���Ҳ��������
Fk1(:,j)=A\B;
end

toc

xlswrite('CFCS.xlsx',Fk,8);
xlswrite('CFCS1.xlsx',Fk1,8);

figure(10)
plot(Dt:Dt:Nv*Dt,fi,'k+-','Markersize',7,'Markerface','white','linewidth',2.0);
grid on;
hold on;
xlabel('ʱ��(s)')
ylabel('δ������м���(mm)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
plot(Dt:Dt:Nv*Dt,fa,'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
grid on;
hold on;
xlabel('ʱ��(s)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('h_s','h_d','FontName','Times New Roman','Frontsize',24)


figure(11)
subplot(2,2,1)
plot(1:1:m,Fk(1,:),'r+','Markersize',10,'Markerface','white','linewidth',3.0);
hold on;
plot(1:1:m,Fk1(1,:),'ko','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('����ת��')
ylabel('Ktc(N/mm^2)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('���칹����','���칹����');
subplot(2,2,2)
plot(1:1:m,Fk(3,:),'r+','Markersize',10,'Markerface','white','linewidth',3.0);
hold on;
plot(1:1:m,Fk1(3,:),'ko','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('����ת��')
ylabel('Krc(N/mm^2)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('���칹����','���칹����');

subplot(2,2,3)
plot(1:1:m,Fk(2,:),'b+','Markersize',10,'Markerface','white','linewidth',3.0);
hold on;
plot(1:1:m,Fk1(2,:),'ko','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('����ת��')
ylabel('Kte(N/mm)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('���칹����','���칹����');
subplot(2,2,4)
plot(1:1:m,Fk(4,:),'b+','Markersize',10,'Markerface','white','linewidth',3.0);
hold on;
plot(1:1:m,Fk1(4,:),'ko','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('����ת��')
ylabel('Kre(N/mm)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('���칹����','���칹����');