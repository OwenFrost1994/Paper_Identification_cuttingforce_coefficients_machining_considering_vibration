clear;
clc;
close all;

D=8;%%刀具半径
N=1;%%刀具齿数
B=pi/6;%%刀具螺旋角
Cp=2*pi/N;%%齿间角

%%刀具刚度参数%%
kx=14220122.4764;%%x方向刚度
ky=14220122.4764;%%y方向刚度
cx=197.9761;%%x方向阻尼
cy=197.9761;%%y方向阻尼
mx=0.54639;%%x方向质量
my=0.54639;%%y方向质量

Cm=1;%%铣削方式，顺铣为1，逆铣为0
S=1000;%%主轴转速
f=40;%%进给速度
ap=0.4;%%轴向切深（单位mm）
ae=8;%%径向切深（单位mm）
fs=10000;%%采样频率

%%基本参数计算%%
R=D/2;%%刀具半径
kb=(2*tan(B))/D;%%kβ计算
fe=f/(N*S);%%feed every tooth
w=2*pi*S/60;%%刀具角速度
T=2*pi/w;%%刀具周期
Ts=1/fs;%%采样周期
Ns=floor(60*fs/S);%%一个周期内的采样点个数
if Cm==1%%顺铣
    Cst=pi-acos((R-ae)/R);%%切入角
    Cex=pi;%%切出角
else%%逆铣
    Cst=0;%%切入角
    Cex=acos((R-ae)/R);%%切出角
end
Dt=T/Ns;%%两个采样点的间隔
Dc=Dt*w;%%每个采样点间的角度差
Dn=ceil(Ns*abs(Cex-Cst)/(2*pi));%%切削过程采样点个数
Nb=ceil(Ns*ap*kb/(2*pi))+10;%%


[Fo]=xlsread('Is081.xlsx',1);
[m,n]=size(Fo);
Fo(:,2)=Fo(:,2)-(sum(Fo(1:6,2))+sum(Fo(m-6:m,2)))/12;
Fo(:,3)=Fo(:,3)-(sum(Fo(1:6,3))+sum(Fo(m-6:m,3)))/12;
Fo(:,4)=Fo(:,4)-(sum(Fo(1:6,4))+sum(Fo(m-6:m,4)))/12;
A=zeros(m,1);
A=Fo(:,2);
Fo(:,2)=Fo(:,3);
Fo(:,3)=A;%%xy方向交换
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
%%选出其中切削过程内的数据
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

%%坐标系转换
C=Cst;
[m,n]=size(F);
Xx=zeros(1,m);%%刀具在x方向的振动位移
Xy=zeros(1,m);%%刀具在y方向的振动位移
Vx=zeros(1,m);%%刀具在x方向的振动速度
Vy=zeros(1,m);%%刀具在y方向的振动速度
Dx=zeros(1,m);%%刀具在x方向的位移变化量，fv的第一个参数
Dy=zeros(1,m);%%刀具在y方向的位移变化量，fv的第二个参数
for i=1:1:m
    
    %%Runge-Kutta法求解刀具振动
    if  i==1 %%判断是否是初始点（第一个点）
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
    else %%不是初始点
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
    
    %%两个方向上的附加进给量
    if i<=(Ns/N)%%如果是第一个刀齿在切的时候，切屑上表面没有前一个刀齿切出的波纹表面，此时相当于刀具无振动的情况
        Dx(i)=1000*(Xx(i)-0);%%注意到动力学方程求解过程中单位为国际制单位，求解获得的位移单位为m，而每齿进给量的单位是mm
        Dy(i)=1000*(Xy(i)-0);
    else
        Dx(i)=1000*(Xx(i)-Xx(i-floor(Ns/N)));
        Dy(i)=1000*(Xy(i)-Xx(i-floor(Ns/N)));
    end
    %%将力从静态坐标系转换到动态坐标系
    C=C+Dc;
    if C>2*pi
        C=C-2*pi;
    else
    end
    T=[-cos(C),-sin(C),0;sin(C),-cos(C),0;0,0,1];
    f=F(i,2:4);
    F(i,2:4)=(inv(T)*f')'/ap;
end
%%下面结合动态切屑厚度求解切削力系数
%%注意切入切出段不能使用，尝试先求第一周的（刀具周期的第一个不能使用）
FF=F(Ns+1:2*Ns,:);
NB=Nb-1;%%切入切出部分的长度
Nv=Dn-2*NB;%%有效点的个数
%%计算理论进给量+附加进给量
m=floor(m/Ns);
Fk=zeros(6,m);%%存储计算切削力系数的结果
for j=1:1:m%%从1开始去掉第一个周期
for i=1:1:Nv
    C=Cst+(i+NB)*Dc;
    fi(i)=fe*sin(C);%%ideal feed peer tooth
    fa(i)=fi(i)+sin(C)*Dx(j*Ns+i+NB)+cos(C)*Dy(j*Ns+i+NB);
end
M=ones(Nv,2);
M(:,1)=fa';
D=[M,zeros(Nv,2),zeros(Nv,2);zeros(Nv,2),M,zeros(Nv,2);zeros(Nv,2),zeros(Nv,2),M];%%前端系数矩阵
Fb=[F(j*Ns+1+NB:j*Ns+Nv+NB,2);F(j*Ns+1+NB:j*Ns+Nv+NB,3);F(j*Ns+1+NB:j*Ns+Nv+NB,4)];%%右侧待求解的力矩阵
A=D'*D;%%A^T*A,左侧正则矩阵
B=D'*Fb;%%A^T*F，右侧正则矩阵
Fk(:,j)=A\B;
end
for j=1:1:m%%从1开始去掉第一个周期
for i=1:1:Nv
    C=Cst+(i+NB)*Dc;
    fi(i)=fe*sin(C);%%ideal feed peer tooth
end
M=ones(Nv,2);
M(:,1)=fi';
D=[M,zeros(Nv,2),zeros(Nv,2);zeros(Nv,2),M,zeros(Nv,2);zeros(Nv,2),zeros(Nv,2),M];%%前端系数矩阵
Fb=[F(j*Ns+1+NB:j*Ns+Nv+NB,2);F(j*Ns+1+NB:j*Ns+Nv+NB,3);F(j*Ns+1+NB:j*Ns+Nv+NB,4)];%%右侧待求解的力矩阵
A=D'*D;%%A^T*A,左侧正则矩阵
B=D'*Fb;%%A^T*F，右侧正则矩阵
Fk1(:,j)=A\B;
end

toc

xlswrite('CFCS.xlsx',Fk,8);
xlswrite('CFCS1.xlsx',Fk1,8);

figure(10)
plot(Dt:Dt:Nv*Dt,fi,'k+-','Markersize',7,'Markerface','white','linewidth',2.0);
grid on;
hold on;
xlabel('时间(s)')
ylabel('未变形切屑厚度(mm)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
plot(Dt:Dt:Nv*Dt,fa,'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
grid on;
hold on;
xlabel('时间(s)')
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
xlabel('刀具转数')
ylabel('Ktc(N/mm^2)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('有异构因素','无异构因素');
subplot(2,2,2)
plot(1:1:m,Fk(3,:),'r+','Markersize',10,'Markerface','white','linewidth',3.0);
hold on;
plot(1:1:m,Fk1(3,:),'ko','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('刀具转数')
ylabel('Krc(N/mm^2)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('有异构因素','无异构因素');

subplot(2,2,3)
plot(1:1:m,Fk(2,:),'b+','Markersize',10,'Markerface','white','linewidth',3.0);
hold on;
plot(1:1:m,Fk1(2,:),'ko','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('刀具转数')
ylabel('Kte(N/mm)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('有异构因素','无异构因素');
subplot(2,2,4)
plot(1:1:m,Fk(4,:),'b+','Markersize',10,'Markerface','white','linewidth',3.0);
hold on;
plot(1:1:m,Fk1(4,:),'ko','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('刀具转数')
ylabel('Kre(N/mm)')
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('有异构因素','无异构因素');