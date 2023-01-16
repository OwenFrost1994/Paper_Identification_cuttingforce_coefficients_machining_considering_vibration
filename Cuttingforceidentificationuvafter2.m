clear;
clc;
close all;
%%对比有无异构因素下的辨识结果
D=8;%%刀具半径
N=1;%%刀具齿数
B=pi/6;%%刀具螺旋角
Cp=2*pi/N;%%齿间角
dl=0.02;

%%刀具刚度参数%%
% kx=23030727.4827;%%x方向刚度
% ky=23030727.4827;%%y方向刚度
% cx=214.1390;%%x方向阻尼
% cy=214.1390;%%y方向阻尼
% mx=0.7037;%%x方向质量
% my=0.7037;%%y方向质量
kx=14220122.4764;%%x方向刚度
ky=14220122.4764;%%y方向刚度
cx=197.9761;%%x方向阻尼
cy=197.9761;%%y方向阻尼
mx=0.54639;%%x方向质量
my=0.54639;%%y方向质量

%%加工参数%%
%%铣削方式:顺铣%%
Cm=1;%%铣削方式，顺铣为1，逆铣为0
S=1000;%%主轴转速
f=40;%%进给速度
fs=10000;%%采样频率
ap=0.3;%%轴向切深（单位mm）
ae=8;%%径向切深（单位mm）
Cn=8;%%圈数circle number

%%基本参数计算%%
R=D/2;%%刀具半径
kb=(2*tan(B))/D;%%kβ计算
fe=f/(N*S);%%feed every tooth
w=2*pi*S/60;%%刀具角速度
T=2*pi/w;%%刀具周期
Ns=floor(60*fs/S);%%一个周期内的采样点个数
if Cm==1%%顺铣
    Cst=pi-acos((R-ae)/R);%%切入角
    Cex=pi;%%切出角
else%%逆铣
    Cst=0;%%切入角
    Cex=acos((R-ae)/R);%%切出角
end
Cs=0;%%开始角度
Dt=T/Ns;%%时间步长
DC=Dt*w;%%角度增量
Ca=Cs;%%初始角度

%%各种存储单元%%
Fx=0;
Fy=0;
Fz=0;%%刀齿受力累加变量
F1=zeros(3,Ns*Cn);%%存储三个方向的切削力有异构因素
F2=zeros(3,Ns*Cn);%%存储三个方向的切削力无异构因素
Xx=zeros(1,Ns*Cn);%%刀具在x方向的振动位移
Xy=zeros(1,Ns*Cn);%%刀具在y方向的振动位移
Vx=zeros(1,Ns*Cn);%%刀具在x方向的振动速度
Vy=zeros(1,Ns*Cn);%%刀具在y方向的振动速度
Dx=zeros(1,Ns*Cn);%%刀具在x方向的位移变化量，fv的第一个参数
Dy=zeros(1,Ns*Cn);%%刀具在y方向的位移变化量，fv的第二个参数
FA=zeros(1,Ns*Cn);
apx=zeros(1,Cn*N);
apy=zeros(1,Cn*N);


%%材料参数%%材料GH909%%有异构
% Ktc=2933.066667;%%切向剪切力系数  槽铣
% Kte=78.4;%%切向刃口力系数
% Krc=1704.366667;%%径向剪切力系数
% Kre=134;%%径向刃口力系数

% Ktc=2967.033333;%%切向剪切力系数  半槽铣
% Kte=77.3;%%切向刃口力系数
% Krc=1197.066667;%%径向剪切力系数
% Kre=146.1;%%径向刃口力系数

% Ktc=2648;%%切向剪切力系数 侧铣
% Kte=84.5;%%切向刃口力系数
% Krc=1416.2;%%径向剪切力系数
% Kre=138;%%径向刃口力系数

%%B刀
% Ktc=2958.4;%%切向剪切力系数  侧铣
% Kte=45.7;%%切向刃口力系数
% Krc=1437.2;%%径向剪切力系数
% Kre=66.85;%%径向刃口力系数

% Ktc=2618.8;%%切向剪切力系数  大半槽铣
% Kte=60.23333333;%%切向刃口力系数
% Krc=1378.033333;%%径向剪切力系数
% Kre=79.73333333;%%径向刃口力系数

Ktc=2712.966667;%%切向剪切力系数 槽铣
Kte=44.9;%%切向刃口力系数
Krc=1487.2;%%径向剪切力系数
Kre=71.76666667;%%径向刃口力系数

Kac=251.55;%%轴向剪切力系数
Kae=52.9445;%%轴向刃口力系数
for i=1:1:Ns*Cn;
    Ca=Ca+DC;%%微元角度叠加计算刀具的转动角
    if Ca>=2*pi%%考虑刀具多个旋转周期，累加的刀具角度超过一周就减去一个2π
        Ca=Ca-2*pi;
    else
    end
       %%计算附加进给量
       if i<=(Ns/N)%%如果是第一个刀齿在切的时候，切屑上表面没有前一个刀齿切出的波纹表面，此时相当于刀具无振动的情况
           Dx(i)=1000*(Xx(i)-0);%%注意到动力学方程求解过程中单位为国际制单位，求解获得的位移单位为m，而每齿进给量的单位是mm
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
    
    %叠加计算多个刀齿的内循环
    for j=1:1:N
        C=Ca-(j-1)*Cp;%%考虑多齿存在的齿间角滞后
        if C<0
            C=C+2*pi;%%如果刀齿角度小于零则转成正的角度
        else
        end
        %%微元叠加计算一个刀刃上的切削力
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
    F1(1,i)=Fx;F1(2,i)=Fy;F1(3,i)=Fz;%%在矩阵中存储切削力
    Fx=0;Fy=0;Fz=0;%%刀具受力累加变量归零
    %Runge-Kutta法计算刀具的振动位移和速度
    if  i==1 %%判断是否是初始点（第一个点）
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
    else %%不是初始点
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

%%材料参数%%材料GH909%%无异构

% Ktc=3103.433333;%%切向剪切力系数 槽铣
% Kte=73.5;%%切向刃口力系数
% Krc=1806.466667;%%径向剪切力系数
% Kre=131.0333333;%%径向刃口力系数


% Ktc=2910.5;%%切向剪切力系数 半槽铣
% Kte=68.23333333;%%切向刃口力系数
% Krc=1178.166667;%%径向剪切力系数
% Kre=142.5666667;%%径向刃口力系数

% Ktc=2734.2;%%切向剪切力系数 侧铣
% Kte=78.1;%%切向刃口力系数
% Krc=1467.8;%%径向剪切力系数
% Kre=134.4;%%径向刃口力系数

% Ktc=2835.55;%%切向剪切力系数 侧铣
% Kte=43;%%切向刃口力系数
% Krc=1384.25;%%径向剪切力系数
% Kre=65.4;%%径向刃口力系数

% Ktc=2682.366667;%%切向剪切力系数 大半槽铣
% Kte=56.8;%%切向刃口力系数
% Krc=1416.6;%%径向剪切力系数
% Kre=77.7;%%径向刃口力系数

Ktc=2800.166667;%%切向剪切力系数 槽铣
Kte=42.7;%%切向刃口力系数
Krc=1516.766667;%%径向剪切力系数
Kre=71.06666667;%%径向刃口力系数

Kac=251.55;%%轴向剪切力系数
Kae=52.9445;%%轴向刃口力系数
for i=1:1:Ns*Cn;
    Ca=Ca+DC;%%微元角度叠加计算刀具的转动角
    if Ca>=2*pi%%考虑刀具多个旋转周期，累加的刀具角度超过一周就减去一个2π
        Ca=Ca-2*pi;
    else
    end
       %%计算附加进给量
       if i<=(Ns/N)%%如果是第一个刀齿在切的时候，切屑上表面没有前一个刀齿切出的波纹表面，此时相当于刀具无振动的情况
           Dx(i)=1000*(Xx(i)-0);%%注意到动力学方程求解过程中单位为国际制单位，求解获得的位移单位为m，而每齿进给量的单位是mm
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
    
    %叠加计算多个刀齿的内循环
    for j=1:1:N
        C=Ca-(j-1)*Cp;%%考虑多齿存在的齿间角滞后
        if C<0
            C=C+2*pi;%%如果刀齿角度小于零则转成正的角度
        else
        end
        %%微元叠加计算一个刀刃上的切削力
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
    F2(1,i)=Fx;F2(2,i)=Fy;F2(3,i)=Fz;%%在矩阵中存储切削力
    Fx=0;Fy=0;Fz=0;%%刀具受力累加变量归零
    %Runge-Kutta法计算刀具的振动位移和速度
    if  i==1 %%判断是否是初始点（第一个点）
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
    else %%不是初始点
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

%%力的对比加进来%%
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
A1(:,3)=A;%%xy方向交换
A1(:,2)=A1(:,2)-(sum(A1(1:100,2))+sum(A1(m-99:m,2)))/200;
A1(:,3)=A1(:,3)-(sum(A1(1:100,3))+sum(A1(m-99:m,3)))/200;
A1(:,4)=A1(:,4)-(sum(A1(1:100,4))+sum(A1(m-99:m,4)))/200;%%消除z方向零漂

n1=2*Ns-60;
n2=3*Ns-60;
n3=5*Ns+40;
n4=6*Ns+40;
figure(1)
subplot(2,1,1)
plot(A1(n3:n4,1),F1(1,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',2.0);%%有异构因素切削力系数
hold on;
plot(A1(n3:n4,1),F2(1,n1:n2),'r-.','Markersize',7,'Markerface','white','linewidth',2.0);%%无异构因素切削力系数
hold on;
plot(A1(n3:n4,1),A1(n3:n4,2),'k-','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(n3:n4,1)) max(A1(n3:n4,1))])
xlabel('时间(s)')
ylabel('F_x(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('有异构因素系数预测','无异构因素系数预测','实测切削力')
subplot(2,1,2)
plot(A1(n3:n4,1),F1(2,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',2.0);%%有异构因素切削力系数
hold on;
plot(A1(n3:n4,1),F2(2,n1:n2),'r-.','Markersize',7,'Markerface','white','linewidth',2.0);%%无异构因素切削力系数
hold on;
plot(A1(n3:n4,1),A1(n3:n4,3),'k-','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(n3:n4,1)) max(A1(n3:n4,1))])
xlabel('时间(s)')
ylabel('F_y(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('有异构因素系数预测','无异构因素系数预测','实测切削力')
