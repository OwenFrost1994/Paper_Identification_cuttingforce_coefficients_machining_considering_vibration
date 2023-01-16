clear;
clc;
close all
%%������Ԥ��ģ�ͣ�����״̬�£����ǵ��ߵ��񶯣������ߵ���δ���빤�������ﵶ��ֱ���Ѿ����ֺã���΢Ԫ��ʽ%%
%%���߼��β���%%
D=10;%%���߰뾶
N=1;%%���߳���
B=pi/6;%%����������
Cp=2*pi/N;%%�ݼ��
dz=0.02;

%%���߸նȲ���%%
kx=23030727.4827;%%x����ն�
ky=23030727.4827;%%y����ն�
cx=214.1390;%%x��������
cy=214.1390;%%y��������
mx=0.7037;%%x��������
my=0.7037;%%y��������

%%���ϲ���%%����GH909%%
Ktc=3250.0332;%%���������ϵ��
Kte=90.8541;%%�����п���ϵ��
Krc=1200.5036;%%���������ϵ��
Kre=115.1116;%%�����п���ϵ��
Kac=251.55;%%���������ϵ��
Kae=52.9445;%%�����п���ϵ��

%%�ӹ�����%%
%%ϳ����ʽ:˳ϳ%%
Cm=1;%%ϳ����ʽ��˳ϳΪ1����ϳΪ0
S=1000;%%����ת��
f=60;%%�����ٶ�
fs=20000;%%����Ƶ��
ap=0.2;%%���������λmm��
ae=10;%%���������λmm��
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
Fxd=0;Fyd=0;Fzd=0;%%�����ܶ�̬�������ۼӱ���
Fxs=0;Fys=0;Fzs=0;%%�����ܾ�̬�������ۼӱ���
Fd=zeros(3,Ns*Cn);%%�洢��������Ķ�̬������
Fs=zeros(3,Ns*Cn);%%�洢��������Ķ�̬������
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
        for m=1:1:ap/dz
            Cd=C-(m-1)*kb*dz;
            %%���㶯̬������
            fa=fe*sin(Cd)+Dx(i)*sin(Cd)+Dy(i)*cos(Cd);%��̬��м���
            if Cd<Cex&&Cd>Cst&&fa>=0
                fxd=(-cos(Cd))*(Ktc*fa+Kte)*dz+(-sin(Cd))*(Krc*fa+Kre)*dz;
                fyd=( sin(Cd))*(Ktc*fa+Kte)*dz+(-cos(Cd))*(Krc*fa+Kre)*dz;
                fzd=(Kac*fa+Kae)*dz;
            else
                fxd=0;fyd=0;fzd=0;
            end
            Fxd=Fxd+fxd;Fyd=Fyd+fyd;Fzd=Fzd+fzd;
            %%���㾲̬������
            if Cd<Cex&&Cd>Cst
                fxs=(-cos(Cd))*(Ktc*fe*sin(Cd)+Kte)*dz+(-sin(Cd))*(Krc*fe*sin(Cd)+Kre)*dz;
                fys=( sin(Cd))*(Ktc*fe*sin(Cd)+Kte)*dz+(-cos(Cd))*(Krc*fe*sin(Cd)+Kre)*dz;
                fzs=(Kac*fe*sin(Cd)+Kae)*dz;
            else
                fxs=0;fys=0;fzs=0;
            end
            Fxs=Fxs+fxs;Fys=Fys+fys;Fzs=Fzs+fzs;
        end
    end
    Fd(1,i)=Fxd;Fd(2,i)=Fyd;Fd(3,i)=Fzd;%%�ھ����д洢��̬������
    Fxd=0;Fyd=0;Fzd=0;%%�����ܶ�̬�������ۼӱ�������
    Fs(1,i)=Fxs;Fs(2,i)=Fys;Fs(3,i)=Fzs;%%�ھ����д洢��̬������
    Fxs=0;Fys=0;Fzs=0;%%�����ܾ�̬�������ۼӱ�������
    %Runge-Kutta�����㵶�ߵ���λ�ƺ��ٶ�
    if  i==1 %%�ж��Ƿ��ǳ�ʼ�㣨��һ���㣩
        K1=0;L1=(-cx*0-kx*0+0)/mx;
        K2=0+Dt*L1/2;L2=(-cx*(0+Dt*L1/2)-kx*(0+Dt*K1/2)+(0+Fd(1,i))/2)/mx;
        K3=0+Dt*L2/2;L3=(-cx*(0+Dt*L2/2)-kx*(0+Dt*K2/2)+(0+Fd(1,i))/2)/mx;
        K4=0+Dt*L3;L4=(-cx*(0+Dt*L3)-kx*(0+Dt*K3)+Fd(1,i))/mx;
        Xx(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=0;L1=(-cy*0-ky*0+0)/my;
        K2=0+Dt*L1/2;L2=(-cy*(0+Dt*L1/2)-ky*(0+Dt*K1/2)+(0+Fd(2,i))/2)/my;
        K3=0+Dt*L2/2;L3=(-cy*(0+Dt*L2/2)-ky*(0+Dt*K2/2)+(0+Fd(2,i))/2)/my;
        K4=0+Dt*L3;L4=(-cy*(0+Dt*L3)-ky*(0+Dt*K3)+Fd(2,i))/my;
        Xy(i)=0+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=0+Dt*(L1+2*L2+2*L3+L4)/6;
    else %%���ǳ�ʼ��
        K1=Vx(i-1);L1=(-cx*Vx(i-1)-kx*Xx(i-1)+Fd(1,i-1))/mx;
        K2=Vx(i-1)+Dt*L1/2;L2=(-cx*(Vx(i-1)+Dt*L1/2)-kx*(Xx(i-1)+Dt*K1/2)+(Fd(1,i-1)+Fd(1,i))/2)/mx;
        K3=Vx(i-1)+Dt*L2/2;L3=(-cx*(Vx(i-1)+Dt*L2/2)-kx*(Xx(i-1)+Dt*K2/2)+(Fd(1,i-1)+Fd(1,i))/2)/mx;
        K4=Vx(i-1)+Dt*L3;L4=(-cx*(Vx(i-1)+Dt*L3)-kx*(Xx(i-1)+Dt*K3)+Fd(1,i))/mx;
        Xx(i)=Xx(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vx(i)=Vx(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
        K1=Vy(i-1);L1=(-cy*Vy(i-1)-ky*Xy(i-1)+Fd(2,i-1))/my;
        K2=Vy(i-1)+Dt*L1/2;L2=(-cy*(Vy(i-1)+Dt*L1/2)-ky*(Xy(i-1)+Dt*K1/2)+(Fd(2,i-1)+Fd(2,i))/2)/my;
        K3=Vy(i-1)+Dt*L2/2;L3=(-cy*(Vy(i-1)+Dt*L2/2)-ky*(Xy(i-1)+Dt*K2/2)+(Fd(2,i-1)+Fd(2,i))/2)/my;
        K4=Vy(i-1)+Dt*L3;L4=(-cy*(Vy(i-1)+Dt*L3)-ky*(Xy(i-1)+Dt*K3)+Fd(2,i))/my;
        Xy(i)=Xy(i-1)+Dt*(K1+2*K2+2*K3+K4)/6;
        Vy(i)=Vy(i-1)+Dt*(L1+2*L2+2*L3+L4)/6;
    end
end

% figure(1)
% subplot(2,1,1);
% plot(4*Ns*Dt:Dt:Cn*Ns*Dt,Fd(1,4*Ns:Cn*Ns),'b-','Markersize',7,'Markerface','white','linewidth',1.0);
% hold on;
% plot(4*Ns*Dt:Dt:Cn*Ns*Dt,Fs(1,4*Ns:Cn*Ns),'b-.','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% grid on;
% xlabel('ʱ��(s)')
% ylabel('F_x(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% % legend('Dynamic F_x','Quasi-static F_x')
% legend('�����칹����','�����칹����')
% % title('Simulated Dynamic and Quasi-static Cutting Forces in X');
% subplot(2,1,2);
% plot(4*Ns*Dt:Dt:Cn*Ns*Dt,Fd(2,4*Ns:Cn*Ns),'r-','Markersize',7,'Markerface','white','linewidth',1.0);
% hold on;
% plot(4*Ns*Dt:Dt:Cn*Ns*Dt,Fs(2,4*Ns:Cn*Ns),'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% grid on;
% xlabel('ʱ��(s)')
% ylabel('F_y(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('�����칹����','�����칹����')
% title('Simulated Dynamic and Quasi-static Cutting Forces in Y');
% subplot(3,1,3);
% plot(Dt:Dt:Ns*Cn*Dt,Fd(3,:),'g-','Markersize',7,'Markerface','white','linewidth',1.0);
% hold on;
% plot(Dt:Dt:Ns*Cn*Dt,Fs(3,:),'g-.','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% grid on;
% xlabel('time(s)')
% ylabel('F_z(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Dynamic F_z','Quasi-static F_z')
% title('Simulated Dynamic and Quasi-static Cutting Forces in Z');

DF1=Fd-Fs;
% figure(2)
% subplot(2,1,1);
% plot(2*Ns*Dt:Dt:Cn*Ns*Dt,DF1(1,2*Ns:Cn*Ns),'b-','Markersize',7,'Markerface','white','linewidth',1.0);
% hold on;
% grid on;
% xlabel('ʱ��(s)')
% ylabel('��F_x(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% % legend('x�������벻�����칹����Ԥ���������ľ��Բ�')
% subplot(2,1,2);
% plot(2*Ns*Dt:Dt:Cn*Ns*Dt,DF1(2,2*Ns:Cn*Ns),'r-','Markersize',7,'Markerface','white','linewidth',1.0);
% hold on;
% grid on;
% xlabel('ʱ��(s)')
% ylabel('��F_y(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('y�������벻�����칹����Ԥ���������ľ��Բ�')
% DFxm=mean(DF1(1,:));
% DFym=mean(DF1(2,:));
% DFxm
% DFym

% n1=5*720;
% n2=7*720;
% t1=n1*Dt;t2=n2*Dt;
% figure(3)
% plot(t1:Dt:t2,F(1,n1:n2),'b-');
% hold on;
% plot(t1:Dt:t2,F(2,n1:n2),'r-');
% hold on;
% plot(t1:Dt:t2,F(3,n1:n2),'g-');
% grid on;

%%���ĶԱȼӽ���%%
A11=xlsread('N081.xlsx',1);
A12=xlsread('N081.xlsx',2);
A11=[A12;A11];
A1=downsample(A11,10);
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
A1=A1';
% figure(3)
% subplot(1,2,1)
% plot(A1(1,:),A1(2,:),'b-','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% plot(A1(1,:),A1(3,:),'r-','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% plot(A1(1,:),A1(4,:),'g-','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% grid on;
% xlim([min(A1(1,:)) max(A1(1,:))])
% xlabel('time(s)')
% ylabel('Force(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% title('Actual forces in process');

n1=2*Ns;
n2=6*Ns;
n3=8*Ns+187;
n4=12*Ns+187;
figure(4)
subplot(2,1,1)
plot(A1(1,n3:n4),Fd(1,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',2.0);%%����Ҫע��F��3��N,��ȡ��������4��N
hold on;
plot(A1(1,n3:n4),Fs(1,n1:n2),'r-.','Markersize',7,'Markerface','white','linewidth',3.0);%%����Ҫע��F��3��N,��ȡ��������4��N
hold on;
plot(A1(1,n3:n4),A1(2,n3:n4),'k-.','Markersize',7,'Markerface','white','linewidth',1.0);%%����Ҫע��F��3��N,��ȡ��������4��N
hold on;
grid on;
xlim([min(A1(1,n3:n4)) max(A1(1,n3:n4))])
xlabel('ʱ��(s)')
ylabel('F_x(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('���칹����','���칹����','ʵ�����ֵ')
subplot(2,1,2)
plot(A1(1,n3:n4),Fd(2,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',2.0);
hold on;
plot(A1(1,n3:n4),Fs(2,n1:n2),'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(A1(1,n3:n4),A1(3,n3:n4),'k--','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(1,n3:n4)) max(A1(1,n3:n4))])
xlabel('ʱ��(s)')
ylabel('F_y(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
% legend('X predicted','Y predicted','Z predicted','X measured','Y measured','Z measured')
% title('Forces in particular cycle');
% gtext('Measured and predicted cutting force under DUCT','Fontsize',20)
legend('���칹����','���칹����','ʵ�����ֵ')
NS=floor(Ns*(Cex-Cst)/(2*pi));

Er1=Fd(1:3,n1:n2)-A1(2:4,n3:n4);
Er2=Fs(1:3,n1:n2)-A1(2:4,n3:n4);

figure(5)
subplot(2,1,1)
plot(A1(1,n3:n4),Er1(1,:),'b-','Markersize',7,'Markerface','white','linewidth',1.0);%%����Ҫע��F��3��N,��ȡ��������4��N
hold on;
plot(A1(1,n3:n4),Er2(1,:),'k--','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(1,n3:n4)) max(A1(1,n3:n4))])
xlabel('ʱ��(s)')
ylabel('��F_x(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('F_d(t)-F_m(t)','F_s(t)-F_m(t)')
subplot(2,1,2)
plot(A1(1,n3:n4),Er1(2,:),'r-','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(1,n3:n4),Er2(2,:),'k--','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(1,n3:n4)) max(A1(1,n3:n4))])
xlabel('ʱ��(s)')
ylabel('��F_y(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('F_d(t)-F_m(t)','F_s(t)-F_m(t)')

Errdx=(sum(Er1(1,1:NS))+sum(Er1(1,Ns+1:Ns+NS))+sum(Er1(1,2*Ns+1:2*Ns+NS))+sum(Er1(1,3*Ns+1:3*Ns+NS)))/(4*NS)
Errdy=(sum(Er1(2,1:NS))+sum(Er1(2,Ns+1:Ns+NS))+sum(Er1(2,2*Ns+1:2*Ns+NS))+sum(Er1(2,3*Ns+1:3*Ns+NS)))/(4*NS)
Errsx=(sum(Er2(1,1:NS))+sum(Er2(1,Ns+1:Ns+NS))+sum(Er2(1,2*Ns+1:2*Ns+NS))+sum(Er2(1,3*Ns+1:3*Ns+NS)))/(4*NS)
Errsy=(sum(Er2(2,1:NS))+sum(Er2(2,Ns+1:Ns+NS))+sum(Er2(2,2*Ns+1:2*Ns+NS))+sum(Er2(2,3*Ns+1:3*Ns+NS)))/(4*NS)
