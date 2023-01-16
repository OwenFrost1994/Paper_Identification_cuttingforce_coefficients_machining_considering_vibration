clear;
clc;
%%在考虑刀具偏心的情况下的非线性切削力系数辨识%%
%%刀具几何参数%%
D=10;%%刀具半径
N=4;%%刀具齿数
B=pi/6;%%刀具螺旋角
Cp=2*pi/N;%%齿间角

%%材料牌号%%
%AL7075刃口力+AL7050非线性剪切力%

%%刀具刚度参数%%
%%这里不需要%%

%%加工参数%%
%%铣削方式:顺铣%%
Cm=1;%%铣削方式，顺铣为1，逆铣为0
S=2000;%%主轴转速
f=600;%%进给速度
fs=10000;%%采样频率
ap=1;%%轴向切深（单位mm）
ae=3;%%径向切深（单位mm）

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
DC=Ts*w;%%两个采样点的角度间隔
FO=xlsread('datafornonlinearandcutteroffset.xls');
DNs=floor(Ns*Cst/(2*pi));
F=zeros(Ns,4);
F=FO(10*Ns+1+DNs:11*Ns+DNs,:);%%提取一个周期的切削力
clear FO;%%清除FO所占内存空间
X0=zeros(6+N,1);
Xk=zeros(6+N,1);
Xk1=zeros(6+N,1);
for i=1:1:Ns
    F(i,1)=i*DC+Cst;
end
figure(1);%%绘出这一个周期的切削力的图
plot(F(:,1),F(:,2),'b');
hold on;
plot(F(:,1),F(:,3),'r');
hold on;
plot(F(:,1),F(:,4),'g');
hold on;
%%将固定坐标系的力转换为动态坐标系的力%%
FS=zeros(1,3);%%static coordinate system里面的力
FR=zeros(1,3);%%rotatory coordinate system里面的力
C0=Cst+ap*kb;
for i=1:1:Ns
    if i>75&&i<=150
        F(i,1)=F(i,1)-Cp;
    else if i>150&&i<=225
            F(i,1)=F(i,1)-2*Cp;
        else if i>225
                F(i,1)=F(i,1)-3*Cp;
            else
            end
        end
    end
    C=F(i,1);
    %%不同切入状态下刀片由于纵向尺寸带来的中心点滞后，产生了一个滞后角
    if  C<C0
        l=(C-Cst)/kb;
        C=0.5*(C+Cst);
    else
        l=ap;%%此时切入微元的长度
        C=C-0.5*ap*kb;
    end
    FS(1)=F(i,2);
    FS(2)=F(i,3);
    FS(3)=F(i,4);
    if C==Cst&&C==Cex
        FR=[0;0;0];
    else
        T=[-cos(C),-sin(C),0;sin(C),-cos(C),0;0,0,1];
        FR=(inv(T)*(FS)')'/l;
    end
    F(i,2)=FR(1);
    F(i,3)=FR(2);
    F(i,4)=FR(3);
end
% figure(2);%%绘出这一个周期的切削力的图
% plot(F(:,1),F(:,2),'b');
% hold on;
% plot(F(:,1),F(:,3),'r');
% hold on;
% plot(F(:,1),F(:,4),'g');
% hold on;
%第一步尝试求解初值%%
%提取出正在切削的刀齿%%
%每个刀齿的齿间周期%%
% F1=F(1:75,:);
% F2=F(76:150,:);
% F3=F(151:225,:);
% F4=F(226:300,:);

N1=ceil(Ns*ap*kb/(2*pi));
F1=F(1+N1:51,:);%%提取第一个刀齿切削段
F2=F(76+N1:96,:);%%提取第二个刀齿的切削段
F3=F(152+N1:205,:);%%提取第三个刀齿的切削段
F4=F(226+N1:279,:);%%提取第四个刀齿的切削段

% figure(3);
% subplot(2,2,1);
% plot(F1(:,1),F1(:,2),'b');
% hold on;
% plot(F1(:,1),F1(:,3),'r');
% hold on;
% plot(F1(:,1),F1(:,4),'g');
% hold on;
% subplot(2,2,2);
% plot(F2(:,1),F2(:,2),'b');
% hold on;
% plot(F2(:,1),F2(:,3),'r');
% hold on;
% plot(F2(:,1),F2(:,4),'g');
% hold on;
% subplot(2,2,3);
% plot(F3(:,1),F3(:,2),'b');
% hold on;
% plot(F3(:,1),F3(:,3),'r');
% hold on;
% plot(F3(:,1),F3(:,4),'g');
% hold on;
% subplot(2,2,4);
% plot(F4(:,1),F4(:,2),'b');
% hold on;
% plot(F4(:,1),F4(:,3),'r');
% hold on;
% plot(F4(:,1),F4(:,4),'g');
% hold on;

%%第一种初值求法,偏心量和刃口力系数都赋值为0%%
% bT=[F1(:,2);F2(:,2);F3(:,2);F4(:,2)];%%准备线性求解矩阵，等式右侧常数矩阵比较简单，bT为切向力的,bR为径向力的
% bR=[F1(:,3);F2(:,3);F3(:,3);F4(:,3)];
% bT=log(bT);%%取ln值之后才能用于求解初值
% bR=log(bR);
% [m1,n1]=size(F1);
% [m2,n2]=size(F2);
% [m3,n3]=size(F3);
% [m4,n4]=size(F4);
% AT=ones(m1+m2+m3+m4,2);%%准备系数矩阵，AT为切向力的，AR为径向力的
% AR=ones(m1+m2+m3+m4,2);
% F1C=F1(:,1);F2C=F2(:,1);F3C=F3(:,1);F4C=F4(:,1);
% F1C=fe*(sin(F1C));F2C=fe*(sin(F2C));F3C=fe*(sin(F3C));F4C=fe*(sin(F4C));
% AT(:,1)=[log(F1C);log(F2C);log(F3C);log(F4C)];
% AR(:,1)=[log(F1C);log(F2C);log(F3C);log(F4C)];
% x1=(AT'*AT)\(AT'*bT);
% x2=(AR'*AR)\(AR'*bR);
% mT=1-x1(1);Ktc=exp(x1(2));
% mR=1-x2(1);Krc=exp(x2(2));
% 
% X0(1)=Ktc+200;X0(2)=mT-0.2;X0(4)=Krc;X0(5)=mR-0.1;

%%第二种初值解法%%
%%取出样本矩阵里面切向力最小的，变为原来的一半作为切向刃口力系数的初值%%
Kte=0.5*min([min(F1(:,2));min(F2(:,2));min(F3(:,2));min(F4(:,2))]);%%切向刃口力系数初值
Kre=0.5*min([min(F1(:,3));min(F2(:,3));min(F3(:,3));min(F4(:,3))]);%%径向刃口力系数初值
bT=[F1(:,2);F2(:,2);F3(:,2);F4(:,2)];%%准备线性求解矩阵，等式右侧常数矩阵比较简单，bT为切向力的,bR为径向力的
bR=[F1(:,3);F2(:,3);F3(:,3);F4(:,3)];
bT=log(bT-Kte);%%减去刃口力取ln值之后才能用于求解初值
bR=log(bR-Kre);
[m1,n1]=size(F1);
[m2,n2]=size(F2);
[m3,n3]=size(F3);
[m4,n4]=size(F4);
AT=ones(m1+m2+m3+m4,2);%%准备系数矩阵，AT为切向力的，AR为径向力的
AR=ones(m1+m2+m3+m4,2);
F1C=F1(:,1);F2C=F2(:,1);F3C=F3(:,1);F4C=F4(:,1);
F1C=fe*(sin(F1C));F2C=fe*(sin(F2C));F3C=fe*(sin(F3C));F4C=fe*(sin(F4C));
AT(:,1)=[log(F1C);log(F2C);log(F3C);log(F4C)];
AR(:,1)=[log(F1C);log(F2C);log(F3C);log(F4C)];
x1=(AT'*AT)\(AT'*bT);
x2=(AR'*AR)\(AR'*bR);
mT=1-x1(1);Ktc=exp(x1(2));
mR=1-x2(1);Krc=exp(x2(2));
X0(1)=Ktc;X0(2)=mT;X0(3)=Kte;X0(4)=Krc;X0(5)=mR;X0(6)=Kre;%X0(7)=0.005;X0(8)=-0.005;X0(9)=0.005;X0(10)=0.005;

%%迭代计算最后的解%%
el=20;%%迭代计算的误差极限,ε
a=4;%%α值
b=1.3;%%β值

%%这个程序的问题是函数有指数部分，可能取到负值，这个一定要注意，有物理意义的函数要注意物理意义，实际上指数下面为负值的意思是没切上%%
Xk=X0;%%赋值Xk
k=0;%%循环计数变量
%%计算函数f(k)(x)=f(x(k));k=0%%
%%这里的计算不能直接用矩阵行列运算完成必须用带判断的循环来做%%
m=m1+m2+m3+m4;
H1=[fe*sin(F1(:,1))+Xk(7);fe*sin(F2(:,1))+Xk(8);fe*sin(F3(:,1))+Xk(9);fe*sin(F4(:,1))+Xk(10)];
fk01=zeros(m,1);
fk02=zeros(m,1);
for i=1:1:m
    if H1(i)<=0;
        fk01(i)=Xk(1)*0+Xk(3);
    else
        fk01(i)=Xk(1)*((H1(i))^(1-Xk(2)))+Xk(3);
    end
end
for i=1:1:m
    if H1(i)<=0;
        fk02(i)=Xk(4)*0+Xk(6);
    else
        fk02(i)=Xk(4)*((H1(i))^(1-Xk(5)))+Xk(6);
    end
end
fk=[fk01;fk02]-[F1(:,2);F2(:,2);F3(:,2);F4(:,2);F1(:,3);F2(:,3);F3(:,3);F4(:,3)];%%不要忘记减去真实值

%%计算雅可比矩阵%%
%%雅可比矩阵的子矩阵%%
A=ones(m,3);
B=ones(m,3);
C=zeros(m,3);
D=zeros(m,N);
E=zeros(m,N);
for i=1:1:m
    if H1(i)<=0;
        A(i,1)=0;
        A(i,2)=0;
    else
        A(i,1)=(H1(i))^(1-Xk(2));
        A(i,2)=(-Xk(1))*((H1(i))^(1-Xk(2)))*log(H1(i));
    end
end
for i=1:1:m
    if H1(i)<=0;
        B(i,1)=0;
        B(i,2)=0;
    else
        B(i,1)=(H1(i))^(1-Xk(2));
        B(i,2)=(-Xk(4))*((H1(i))^(1-Xk(5)))*log(H1(i));
    end
end
for i=1:1:m
    if H1(i)<=0;
        if i<=m1;
            D(i,1)=0;
        else if i<=(m1+m2);
                D(i,2)=0;
            else if i<=(m1+m2+m3);
                    D(i,3)=0;
                else
                    D(i,4)=0;
                end
            end
        end
    else if i<=m1
        D(i,1)=Xk(1)*(1-Xk(2))*(H1(i)^(-Xk(2)));
        else if i<=(m1+m2);
                D(i,2)=Xk(1)*(1-Xk(2))*(H1(i)^(-Xk(2)));
            else if i<=(m1+m2+m3);
                    D(i,3)=Xk(1)*(1-Xk(2))*(H1(i)^(-Xk(2)));
                else
                    D(i,4)=Xk(1)*(1-Xk(2))*(H1(i)^(-Xk(2)));
                end
            end
        end
    end
end
for i=1:1:m
    if H1(i)<=0;
        if i<=m1;
            E(i,1)=0;
        else if i<=(m1+m2);
                E(i,2)=0;
            else if i<=(m1+m2+m3);
                    E(i,3)=0;
                else
                    E(i,4)=0;
                end
            end
        end
    else if i<=m1
        E(i,1)=Xk(4)*(1-Xk(5))*(H1(i)^(-Xk(5)));
        else if i<=(m1+m2);
                E(i,2)=Xk(4)*(1-Xk(5))*(H1(i)^(-Xk(5)));
            else if i<=(m1+m2+m3);
                    E(i,3)=Xk(4)*(1-Xk(5))*(H1(i)^(-Xk(5)));
                else
                    E(i,4)=Xk(4)*(1-Xk(5))*(H1(i)^(-Xk(5)));
                end
            end
        end
    end
end
Jk=[A,C,D;C,B,E];

while norm(Jk'*fk,'fro')>=el
% figure(5);
% plot(k,norm(Jk'*fk,'fro'),'ro');
% hold on;
%%计算函数f(k)(x)=f(x(k));
H1=[fe*sin(F1(:,1))+Xk(7);fe*sin(F2(:,1))+Xk(8);fe*sin(F3(:,1))+Xk(9);fe*sin(F4(:,1))+Xk(10)];
fk01=zeros(m,1);
fk02=zeros(m,1);
for i=1:1:m
    if H1(i)<=0;
        fk01(i)=Xk(1)*0+Xk(3);
    else
        fk01(i)=Xk(1)*((H1(i))^(1-Xk(2)))+Xk(3);
    end
end
for i=1:1:m
    if H1(i)<=0;
        fk02(i)=Xk(4)*0+Xk(6);
    else
        fk02(i)=Xk(4)*((H1(i))^(1-Xk(5)))+Xk(6);
    end
end
fk=[fk01;fk02]-[F1(:,2);F2(:,2);F3(:,2);F4(:,2);F1(:,3);F2(:,3);F3(:,3);F4(:,3)];%%不要忘记减去真实值
%%计算雅可比矩阵%%
%%雅可比矩阵的子矩阵%%
for i=1:1:m
    if H1(i)<=0;
        A(i,1)=0;
        A(i,2)=0;
    else
        A(i,1)=(H1(i))^(1-Xk(2));
        A(i,2)=(-Xk(1))*((H1(i))^(1-Xk(2)))*log(H1(i));
    end
end
for i=1:1:m
    if H1(i)<=0;
        B(i,1)=0;
        B(i,2)=0;
    else
        B(i,1)=(H1(i))^(1-Xk(2));
        B(i,2)=(-Xk(4))*((H1(i))^(1-Xk(5)))*log(H1(i));
    end
end
for i=1:1:m
    if H1(i)<=0;
        if i<=m1;
            D(i,1)=0;
        else if i<=(m1+m2);
                D(i,2)=0;
            else if i<=(m1+m2+m3);
                    D(i,3)=0;
                else
                    D(i,4)=0;
                end
            end
        end
    else if i<=m1
        D(i,1)=Xk(1)*(1-Xk(2))*(H1(i)^(-Xk(2)));
        else if i<=(m1+m2);
                D(i,2)=Xk(1)*(1-Xk(2))*(H1(i)^(-Xk(2)));
            else if i<=(m1+m2+m3);
                    D(i,3)=Xk(1)*(1-Xk(2))*(H1(i)^(-Xk(2)));
                else
                    D(i,4)=Xk(1)*(1-Xk(2))*(H1(i)^(-Xk(2)));
                end
            end
        end
    end
end
for i=1:1:m
    if H1(i)<=0;
        if i<=m1;
            E(i,1)=0;
        else if i<=(m1+m2);
                E(i,2)=0;
            else if i<=(m1+m2+m3);
                    E(i,3)=0;
                else
                    E(i,4)=0;
                end
            end
        end
    else if i<=m1
        E(i,1)=Xk(4)*(1-Xk(5))*(H1(i)^(-Xk(5)));
        else if i<=(m1+m2);
                E(i,2)=Xk(4)*(1-Xk(5))*(H1(i)^(-Xk(5)));
            else if i<=(m1+m2+m3);
                    E(i,3)=Xk(4)*(1-Xk(5))*(H1(i)^(-Xk(5)));
                else
                    E(i,4)=Xk(4)*(1-Xk(5))*(H1(i)^(-Xk(5)));
                end
            end
        end
    end
end
Jk=[A,C,D;C,B,E];
%%计算Xk+1%%
Xk1=Xk-(Jk'*Jk+a*eye(size(Jk'*Jk)))\(Jk'*fk);
%%计算函数f(k+1)(x)=f(x(k+1))%%
H1=[fe*sin(F1(:,1))+Xk1(7);fe*sin(F2(:,1))+Xk1(8);fe*sin(F3(:,1))+Xk1(9);fe*sin(F4(:,1))+Xk1(10)];
fk01=zeros(m,1);
fk02=zeros(m,1);
for i=1:1:m
    if H1(i)<=0;
        fk01(i)=Xk1(1)*0+Xk1(3);
    else
        fk01(i)=Xk1(1)*((H1(i))^(1-Xk1(2)))+Xk1(3);
    end
end
for i=1:1:m
    if H1(i)<=0;
        fk02(i)=Xk1(4)*0+Xk1(6);
    else
        fk02(i)=Xk1(4)*((H1(i))^(1-Xk1(5)))+Xk1(6);
    end
end
fk1=[fk01;fk02]-[F1(:,2);F2(:,2);F3(:,2);F4(:,2);F1(:,3);F2(:,3);F3(:,3);F4(:,3)];%%不要忘记减去真实值
while norm(Jk'*fk,'fro')>=el
% while norm(fk1,'fro')>=norm(fk,'fro')
% while sum(abs(fk1))>=sum(abs(fk))
    if norm(fk1,'fro')>=norm(fk,'fro')
        while norm(fk1,'fro')>=norm(fk,'fro')
            a=b*a;
            %%计算Xk+1%%
            Xk1=Xk-(Jk'*Jk+a*eye(size(Jk'*Jk)))\(Jk'*fk);
            %%计算函数f(k+1)(x)=f(x(k+1))%%
            H1=[fe*sin(F1(:,1))+Xk1(7);fe*sin(F2(:,1))+Xk1(8);fe*sin(F3(:,1))+Xk1(9);fe*sin(F4(:,1))+Xk1(10)];
            fk01=zeros(m,1);
            fk02=zeros(m,1);
            for i=1:1:m
                if H1(i)<=0;
                    fk01(i)=Xk1(1)*0+Xk1(3);
                else
                    fk01(i)=Xk1(1)*((H1(i))^(1-Xk1(2)))+Xk1(3);
                end
            end
            for i=1:1:m
                if H1(i)<=0;
                    fk02(i)=Xk1(4)*0+Xk1(6);
                else
                    fk02(i)=Xk1(4)*((H1(i))^(1-Xk1(5)))+Xk1(6);
                end
            end
            fk1=[fk01;fk02]-[F1(:,2);F2(:,2);F3(:,2);F4(:,2);F1(:,3);F2(:,3);F3(:,3);F4(:,3)];%%不要忘记减去真实值
        end
    else
        break;
    end
end
    Xk=Xk1;
    k=k+1;
end
x=Xk;