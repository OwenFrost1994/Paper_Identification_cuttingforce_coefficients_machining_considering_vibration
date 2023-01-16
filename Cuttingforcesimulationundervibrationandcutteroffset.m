clear;
clc;
%%切削力预测模型，理想状态下，考虑刀具的振动，但刀具的振动未脱离工件，%%
%%考虑偏心，但是所有刀齿都切入，非线性切削力系数，这里刀刃为微元形式%%
%%刀具几何参数%%
D=10;%%刀具半径
N=4;%%刀具齿数
B=pi/6;%%刀具螺旋角
Cp=2*pi/N;%%齿间角
dl=0.02;%%微元长度

%%刀具偏心参数%%
r=32.30;%%ρ，单位um
rs=91.51;%%λ，单位°

%%刀具刚度参数%%
kx=13543571.05;%%x方向刚度
ky=14808892.07;%%y方向刚度
cx=0.033112;%%x方向阻尼
cy=0.032257;%%y方向阻尼
mx=6.788226;%%x方向质量
my=7.104583;%%y方向质量

%%材料参数%%材料AL7075%%（新加坡文章7075的刃口力和万敏文章的7050剪切力）
Ktc=758.17;%%切向剪切力系数常数
mt=0.1723;%%切向剪切力系数指数
Kte=14.0371;%%切向刃口力系数
Krc=86.10;%%径向剪切力系数常数
mr=0.6609;%%径向剪切力系数指数
Kre=16.5002;%%径向刃口力系数
Kac=143.10;%%轴向剪切力系数常数
ma=0.1555;%%轴向剪切力系数指数
Kae=-1.25118;%%轴向刃口力系数

%%加工参数%%
%%铣削方式:顺铣%%
Cm=1;%%铣削方式，顺铣为1，逆铣为0
S=2000;%%主轴转速
f=600;%%进给速度
fs=10000;%%采样频率
ap=1;%%轴向切深（单位mm）
ae=3;%%径向切深（单位mm）
Cn=4;%%圈数circle number
    
%%基本参数计算%%
R=D/2;%%刀具半径
kb=(2*tan(B))/D;%%kβ计算
fe=f/(N*S);%%feed every tooth
w=2*pi*S/60;%%刀具角速度
T=2*pi/w;%%刀具周期
Ns=floor(60*fs/S);%%一个周期内的采样点个数
r=r/1000;%%偏心量单位转换为mm
rs=rs*2*pi/360;%%角度化弧度
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
F=zeros(3,Ns*Cn);%%存储三个方向的切削力
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
    %迭代计算该时刻的切削力
%     for k=1:1:2
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
            if j==1
                si=r*(cos(rs-Cd)-cos(rs-Cd-2*(N-2)*pi/N));
            else
                si=r*(cos(rs-Cd-2*(j-1)*pi/N)-cos(rs-Cd-2*(j-2)*pi/N));
            end
            fa=fe*sin(Cd)+Dx(i)*sin(Cd)+Dy(i)*cos(Cd)+si;%计算实际进给量
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
    F(1,i)=Fx;F(2,i)=Fy;F(3,i)=Fz;%%在矩阵中存储切削力
    Fx=0;Fy=0;Fz=0;%%刀具受力累加变量归零
    %Runge-Kutta法计算刀具的振动位移和速度
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
%     end
end

%%绘制力的图像，蓝色X向，红色Y向，绿色Z向
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
% %%绘制刀具在x方向和y方向的位移和速度图像
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