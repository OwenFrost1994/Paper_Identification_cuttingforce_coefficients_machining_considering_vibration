clear;
clc;
%%切削力预测模型，理想状态下，考虑刀具的振动，但刀具的振动未脱离工件，这里刀刃直接已经积分好，非微元形式%%
%%刀具几何参数%%
D=10;%%刀具半径
N=4;%%刀具齿数
B=pi/6;%%刀具螺旋角
Cp=2*pi/N;%%齿间角

%%刀具刚度参数%%
kx=23030727.4827;%%x方向刚度
ky=23030727.4827;%%y方向刚度
cx=214.1390;%%x方向阻尼
cy=214.1390;%%y方向阻尼
mx=0.7037;%%x方向质量
my=0.7037;%%y方向质量

%%材料参数%%材料GH909%%
Ktc=6662.16;%%切向剪切力系数
Kte=61.27;%%切向刃口力系数
Krc=4275.32;%%径向剪切力系数
Kre=130.27;%%径向刃口力系数
Kac=270.62;%%轴向剪切力系数
Kae=104.90;%%轴向刃口力系数

%%加工参数%%
%%铣削方式:顺铣%%
Cm=1;%%铣削方式，顺铣为1，逆铣为0
S=1000;%%主轴转速
f=200;%%进给速度
ap=2;%%轴向切深（单位mm）
ae=5;%%径向切深（单位mm）
Cn=10;%%圈数circle number

%%基本参数计算%%
R=D/2;%%刀具半径
kb=(2*tan(B))/D;%%kβ计算
fe=f/(N*S);%%feed every tooth
w=2*pi*S/60;%%刀具角速度
T=2*pi/w;%%刀具周期
if Cm==1%%顺铣
    Cst=pi-acos((R-ae)/R);%%切入角
    Cex=pi;%%切出角
else%%逆铣
    Cst=0;%%切入角
    Cex=acos((R-ae)/R);%%切出角
end
Cs=0;%%开始角度
Dt=T/720;%%时间步长
DC=Dt*w;%%角度增量
Ca=Cs;%%初始角度

%%各种存储单元%%
Fx=0;
Fy=0;
Fz=0;%%刀齿受力累加变量
F=zeros(3,720*Cn);%%存储三个方向的切削力
Xx=zeros(1,720*Cn);%%刀具在x方向的振动位移
Xy=zeros(1,720*Cn);%%刀具在y方向的振动位移
Vx=zeros(1,720*Cn);%%刀具在x方向的振动速度
Vy=zeros(1,720*Cn);%%刀具在y方向的振动速度
Dx=zeros(1,720*Cn);%%刀具在x方向的位移变化量，fv的第一个参数
Dy=zeros(1,720*Cn);%%刀具在y方向的位移变化量，fv的第二个参数
apx=zeros(1,Cn*N);
apy=zeros(1,Cn*N);

%%计算整个模拟域的大循环
for i=1:1:720*Cn;
    Ca=Ca+DC;%%微元角度叠加计算刀具的转动角
    if Ca>2*pi%%考虑刀具多个旋转周期，累加的刀具角度超过一周就减去一个2π
        Ca=Ca-2*pi;
    else
    end

%%计算附加进给量，i时刻的力计算i时刻的位移，决定i+1时刻的位移
       if i<=(720/N)%%如果是第一个刀齿在切的时候，切屑上表面没有前一个刀齿切出的波纹表面，此时相当于刀具无振动的情况
           if i==1
               Dx(i)=1000*(0-0);%%注意到动力学方程求解过程中单位为国际制单位，求解获得的位移单位为m，而每齿进给量的单位是mm
               Dy(i)=1000*(0-0);
           else
%                ii=i-1;
               Dx(i)=1000*(Xx(i)-0);%%注意到动力学方程求解过程中单位为国际制单位，求解获得的位移单位为m，而每齿进给量的单位是mm
               Dy(i)=1000*(Xy(i)-0);
           end
       else
           q=floor((i)*N/720);%%计算前面有多少个刀齿切入
           if (i-q*720/N)==0%%如果正好是某一时刻前面正好整数个刀齿周期，应该减去一个
               q=q-1;
           else
           end
           if q==0
               Dx(i)=1000*(Xx(i)-0);
               Dy(i)=1000*(Xy(i)-0);
           else
               for n=1:1:q
                   apx(n)=Xx(i-n*720/N);
                   apy(n)=Xy(i-n*720/N);
               end
               Dx(i)=1000*(Xx(i)-min(apx(1:q)));
               Dy(i)=1000*(Xy(i)-min(apy(1:q)));
           end
       end

%%叠加计算多个刀齿的内循环
for j=1:1:N 
    C=Ca-(j-1)*Cp;%%考虑多齿存在的齿间角滞后
    if C<0
        C=C+2*pi;%%如果刀齿角度小于零则转成正的角度
    else
    end
%%判断计算该角度下刀刃的积分上下界
if (kb*ap)<=abs(Cex-Cst)%%无刀刃跨过整个切除区域的情况
    if C>Cst&&C<(Cst+kb*ap)
        C1=C;C2=Cst;
    else if (Cst+kb*ap)<=C&&C<=Cex
        C1=C;C2=C-kb*ap;
        else if Cex<C&&C<(Cex+kb*ap);
                C1=Cex;C2=C-kb*ap;
            else C1=0;C2=0;
            end
        end
    end
end
if (kb*ap)>abs(Cex-Cst)%%有刀刃跨过整个切除区域的情况
    if C>Cst&&C<Cex
        C1=C;C2=Cst;
    else if C<Cex&&C<=(Cst+kb*ap)
            C1=Cex;C2=Cst;
        else if (Cst+kb*ap)<C&&C<(Cex+kb*ap)
                C1=Cex;C2=C-kb*ap;
            else C1=0;C2=0;
            end
        end
    end
end
%%调用函数计算该刀齿的切削力
[fx,fy,fz]=cuttingforce(Ktc,Kte,Krc,Kre,Kac,Kae,C1,C2,kb,fe,Dx(i),Dy(i));
%%累加计算整个刀具的受力
Fx=Fx+fx;Fy=Fy+fy;Fz=Fz+fz;
end
%%位移计算完毕
F(1,i)=Fx;F(2,i)=Fy;F(3,i)=Fz;%%在矩阵中存储切削力
Fx=0;Fy=0;Fz=0;%%刀具受力累加变量归零
%%Runge-Kutta法计算刀具的振动位移和速度
if  i==1 %%判断是否是初始点（第一个点）
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
    else %%不是初始点
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

end

%%绘制力的图像，蓝色X向，红色Y向，绿色Z向
n1=1;
n2=720*Cn;
t1=n1*Dt;t2=n2*Dt;
figure(1)
plot(t1:Dt:t2,F(1,n1:n2),'bo');
hold on;
plot(t1:Dt:t2,F(2,n1:n2),'ro');
hold on;
plot(t1:Dt:t2,F(3,n1:n2),'go');
grid on;


figure(2)
% subplot(3,1,1);
plot(t1:Dt:t2,F(1,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('time(s)')
ylabel('Force(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
title('Simulated Forces in Z direction');
% subplot(3,1,2);
plot(t1:Dt:t2,F(2,n1:n2),'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlabel('time(s)')
ylabel('Force(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
title('Simulated Forces in Z direction');
% subplot(3,1,3);
plot(t1:Dt:t2,F(3,n1:n2),'g-','Markersize',7,'Markerface','white','linewidth',3.0);
grid on;
xlabel('time(s)')
ylabel('Force(N)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
title('Simulated Forces in Z direction');
% 
% n1=5*720;
% n2=7*720;
% t1=n1*Dt;t2=n2*Dt;
% figure(10)
% plot(t1:Dt:t2,F(1,n1:n2),'b-');
% hold on;
% plot(t1:Dt:t2,F(2,n1:n2),'r-');
% hold on;
% plot(t1:Dt:t2,F(3,n1:n2),'g-');
% grid on;

%%力的对比加进来%%
% A1=xlsread('241.xlsx');
% [m,n]=size(A1);
% A1(:,4)=A1(:,4)-(sum(A1(1:1000,4))+sum(A1(m-999:m,4)))/2000;
% A1(:,3)=-A1(:,3);
% figure(2)
% plot(t1:Dt:t2,F(1,n1:n2),'b-','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% grid on;
% xlabel('time(s)')
% ylabel('Force(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% title('Simulated Forces in Z direction');
% plot(t1:Dt:t2,F(2,n1:n2),'r-','Markersize',7,'Markerface','white','linewidth',3.0);
% hold on;
% grid on;
% xlabel('time(s)')
% ylabel('Force(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% title('Simulated Forces in Z direction');
% plot(t1:Dt:t2,F(3,n1:n2),'g-','Markersize',7,'Markerface','white','linewidth',3.0);
% grid on;
% xlabel('time(s)')
% ylabel('Force(N)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% title('Simulated Forces in Z direction');


% %%绘制刀具在x方向和y方向的位移和速度图像
% figure(3)
% plot(Dt:Dt:Cn*720*Dt,Xx(:),'b-');
% hold on;
% grid on;
% title('displacement at x direction')
% figure(4)
% plot(Dt:Dt:Cn*720*Dt,Vx(:),'ro');
% hold on;
% grid on;
% title('velocity at x direction')
% figure(5)
% plot(Dt:Dt:Cn*720*Dt,Xy(:),'b-');
% hold on;
% grid on;
% title('displacement at y direction')
% figure(6)
% plot(Dt:Dt:Cn*720*Dt,Vy(:),'ro');
% hold on;
% grid on;
% title('velocity at y direction')
% figure(7)
% plot(Dt:Dt:Cn*720*Dt,Dx(:),'ro');
% hold on;
% figure(8)
% plot(Dt:Dt:Cn*720*Dt,Dy(:),'ro');
% hold on;
% grid on;