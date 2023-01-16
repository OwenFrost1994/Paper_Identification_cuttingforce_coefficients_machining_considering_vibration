clear;
clc;
close all
%%切削力预测模型，理想状态下，考虑刀具的振动，但刀具的振动未脱离工件，这里刀刃直接已经积分好，非微元形式%%
%%刀具几何参数%%
D=10;%%刀具半径
N=1;%%刀具齿数
B=pi/6;%%刀具螺旋角
Cp=2*pi/N;%%齿间角
dz=0.02;

%%刀具刚度参数%%
kx=23030727.4827;%%x方向刚度
ky=23030727.4827;%%y方向刚度
cx=214.1390;%%x方向阻尼
cy=214.1390;%%y方向阻尼
mx=0.7037;%%x方向质量
my=0.7037;%%y方向质量

%%材料参数%%材料GH909%%
Ktc=3250.0332;%%切向剪切力系数
Kte=90.8541;%%切向刃口力系数
Krc=1200.5036;%%径向剪切力系数
Kre=115.1116;%%径向刃口力系数
Kac=251.55;%%轴向剪切力系数
Kae=52.9445;%%轴向刃口力系数

%%加工参数%%
%%铣削方式:顺铣%%
Cm=1;%%铣削方式，顺铣为1，逆铣为0
S=1000;%%主轴转速
f=60;%%进给速度
fs=20000;%%采样频率
ap=0.2;%%轴向切深（单位mm）
ae=10;%%径向切深（单位mm）
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
Fxd=0;Fyd=0;Fzd=0;%%刀齿受动态切削力累加变量
Fxs=0;Fys=0;Fzs=0;%%刀齿受静态切削力累加变量
Fd=zeros(3,Ns*Cn);%%存储三个方向的动态切削力
Fs=zeros(3,Ns*Cn);%%存储三个方向的动态切削力
Xx=zeros(1,Ns*Cn);%%刀具在x方向的振动位移
Xy=zeros(1,Ns*Cn);%%刀具在y方向的振动位移
Vx=zeros(1,Ns*Cn);%%刀具在x方向的振动速度
Vy=zeros(1,Ns*Cn);%%刀具在y方向的振动速度
Dx=zeros(1,Ns*Cn);%%刀具在x方向的位移变化量，fv的第一个参数
Dy=zeros(1,Ns*Cn);%%刀具在y方向的位移变化量，fv的第二个参数
FA=zeros(1,Ns*Cn);
apx=zeros(1,Cn*N);
apy=zeros(1,Cn*N);


%%计算整个模拟域的大循环
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
        for m=1:1:ap/dz
            Cd=C-(m-1)*kb*dz;
            %%计算动态切削力
            fa=fe*sin(Cd)+Dx(i)*sin(Cd)+Dy(i)*cos(Cd);%动态切屑厚度
            if Cd<Cex&&Cd>Cst&&fa>=0
                fxd=(-cos(Cd))*(Ktc*fa+Kte)*dz+(-sin(Cd))*(Krc*fa+Kre)*dz;
                fyd=( sin(Cd))*(Ktc*fa+Kte)*dz+(-cos(Cd))*(Krc*fa+Kre)*dz;
                fzd=(Kac*fa+Kae)*dz;
            else
                fxd=0;fyd=0;fzd=0;
            end
            Fxd=Fxd+fxd;Fyd=Fyd+fyd;Fzd=Fzd+fzd;
            %%计算静态切削力
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
    Fd(1,i)=Fxd;Fd(2,i)=Fyd;Fd(3,i)=Fzd;%%在矩阵中存储动态切削力
    Fxd=0;Fyd=0;Fzd=0;%%刀具受动态切削力累加变量归零
    Fs(1,i)=Fxs;Fs(2,i)=Fys;Fs(3,i)=Fzs;%%在矩阵中存储静态切削力
    Fxs=0;Fys=0;Fzs=0;%%刀具受静态切削力累加变量归零
    %Runge-Kutta法计算刀具的振动位移和速度
    if  i==1 %%判断是否是初始点（第一个点）
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
    else %%不是初始点
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
% xlabel('时间(s)')
% ylabel('F_x(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% % legend('Dynamic F_x','Quasi-static F_x')
% legend('考虑异构因素','不虑异构因素')
% % title('Simulated Dynamic and Quasi-static Cutting Forces in X');
% subplot(2,1,2);
% plot(4*Ns*Dt:Dt:Cn*Ns*Dt,Fd(2,4*Ns:Cn*Ns),'r-','Markersize',7,'Markerface','white','linewidth',1.0);
% hold on;
% plot(4*Ns*Dt:Dt:Cn*Ns*Dt,Fs(2,4*Ns:Cn*Ns),'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% grid on;
% xlabel('时间(s)')
% ylabel('F_y(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('考虑异构因素','不虑异构因素')
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
% xlabel('时间(s)')
% ylabel('ΔF_x(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% % legend('x方向考虑与不考虑异构因素预测切削力的绝对差')
% subplot(2,1,2);
% plot(2*Ns*Dt:Dt:Cn*Ns*Dt,DF1(2,2*Ns:Cn*Ns),'r-','Markersize',7,'Markerface','white','linewidth',1.0);
% hold on;
% grid on;
% xlabel('时间(s)')
% ylabel('ΔF_y(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('y方向考虑与不考虑异构因素预测切削力的绝对差')
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

%%力的对比加进来%%
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
A1(:,3)=A;%%xy方向交换
A1(:,2)=A1(:,2)-(sum(A1(1:100,2))+sum(A1(m-99:m,2)))/200;
A1(:,3)=A1(:,3)-(sum(A1(1:100,3))+sum(A1(m-99:m,3)))/200;
A1(:,4)=A1(:,4)-(sum(A1(1:100,4))+sum(A1(m-99:m,4)))/200;%%消除z方向零漂
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
plot(A1(1,n3:n4),Fd(1,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',2.0);%%这里要注意F是3×N,读取的数据是4×N
hold on;
plot(A1(1,n3:n4),Fs(1,n1:n2),'r-.','Markersize',7,'Markerface','white','linewidth',3.0);%%这里要注意F是3×N,读取的数据是4×N
hold on;
plot(A1(1,n3:n4),A1(2,n3:n4),'k-.','Markersize',7,'Markerface','white','linewidth',1.0);%%这里要注意F是3×N,读取的数据是4×N
hold on;
grid on;
xlim([min(A1(1,n3:n4)) max(A1(1,n3:n4))])
xlabel('时间(s)')
ylabel('F_x(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('有异构因素','无异构因素','实验测量值')
subplot(2,1,2)
plot(A1(1,n3:n4),Fd(2,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',2.0);
hold on;
plot(A1(1,n3:n4),Fs(2,n1:n2),'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(A1(1,n3:n4),A1(3,n3:n4),'k--','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(1,n3:n4)) max(A1(1,n3:n4))])
xlabel('时间(s)')
ylabel('F_y(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
% legend('X predicted','Y predicted','Z predicted','X measured','Y measured','Z measured')
% title('Forces in particular cycle');
% gtext('Measured and predicted cutting force under DUCT','Fontsize',20)
legend('有异构因素','无异构因素','实验测量值')
NS=floor(Ns*(Cex-Cst)/(2*pi));

Er1=Fd(1:3,n1:n2)-A1(2:4,n3:n4);
Er2=Fs(1:3,n1:n2)-A1(2:4,n3:n4);

figure(5)
subplot(2,1,1)
plot(A1(1,n3:n4),Er1(1,:),'b-','Markersize',7,'Markerface','white','linewidth',1.0);%%这里要注意F是3×N,读取的数据是4×N
hold on;
plot(A1(1,n3:n4),Er2(1,:),'k--','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([min(A1(1,n3:n4)) max(A1(1,n3:n4))])
xlabel('时间(s)')
ylabel('ΔF_x(N)')
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
xlabel('时间(s)')
ylabel('ΔF_y(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('F_d(t)-F_m(t)','F_s(t)-F_m(t)')

Errdx=(sum(Er1(1,1:NS))+sum(Er1(1,Ns+1:Ns+NS))+sum(Er1(1,2*Ns+1:2*Ns+NS))+sum(Er1(1,3*Ns+1:3*Ns+NS)))/(4*NS)
Errdy=(sum(Er1(2,1:NS))+sum(Er1(2,Ns+1:Ns+NS))+sum(Er1(2,2*Ns+1:2*Ns+NS))+sum(Er1(2,3*Ns+1:3*Ns+NS)))/(4*NS)
Errsx=(sum(Er2(1,1:NS))+sum(Er2(1,Ns+1:Ns+NS))+sum(Er2(1,2*Ns+1:2*Ns+NS))+sum(Er2(1,3*Ns+1:3*Ns+NS)))/(4*NS)
Errsy=(sum(Er2(2,1:NS))+sum(Er2(2,Ns+1:Ns+NS))+sum(Er2(2,2*Ns+1:2*Ns+NS))+sum(Er2(2,3*Ns+1:3*Ns+NS)))/(4*NS)
