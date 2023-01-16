clear;
clc;
%%�ڿ��ǵ���ƫ�ĵ�����µķ�����������ϵ����ʶ%%
%%���߼��β���%%
D=10;%%���߰뾶
N=4;%%���߳���
B=pi/6;%%����������
Cp=2*pi/N;%%�ݼ��

%%�����ƺ�%%
%AL7075�п���+AL7050�����Լ�����%

%%���߸նȲ���%%
%%���ﲻ��Ҫ%%

%%�ӹ�����%%
%%ϳ����ʽ:˳ϳ%%
Cm=1;%%ϳ����ʽ��˳ϳΪ1����ϳΪ0
S=2000;%%����ת��
f=600;%%�����ٶ�
fs=10000;%%����Ƶ��
ap=1;%%���������λmm��
ae=3;%%���������λmm��

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
DC=Ts*w;%%����������ĽǶȼ��
FO=xlsread('datafornonlinearandcutteroffset.xls');
DNs=floor(Ns*Cst/(2*pi));
F=zeros(Ns,4);
F=FO(10*Ns+1+DNs:11*Ns+DNs,:);%%��ȡһ�����ڵ�������
clear FO;%%���FO��ռ�ڴ�ռ�
X0=zeros(6+N,1);
Xk=zeros(6+N,1);
Xk1=zeros(6+N,1);
for i=1:1:Ns
    F(i,1)=i*DC+Cst;
end
figure(1);%%�����һ�����ڵ���������ͼ
plot(F(:,1),F(:,2),'b');
hold on;
plot(F(:,1),F(:,3),'r');
hold on;
plot(F(:,1),F(:,4),'g');
hold on;
%%���̶�����ϵ����ת��Ϊ��̬����ϵ����%%
FS=zeros(1,3);%%static coordinate system�������
FR=zeros(1,3);%%rotatory coordinate system�������
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
    %%��ͬ����״̬�µ�Ƭ��������ߴ���������ĵ��ͺ󣬲�����һ���ͺ��
    if  C<C0
        l=(C-Cst)/kb;
        C=0.5*(C+Cst);
    else
        l=ap;%%��ʱ����΢Ԫ�ĳ���
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
% figure(2);%%�����һ�����ڵ���������ͼ
% plot(F(:,1),F(:,2),'b');
% hold on;
% plot(F(:,1),F(:,3),'r');
% hold on;
% plot(F(:,1),F(:,4),'g');
% hold on;
%��һ����������ֵ%%
%��ȡ�����������ĵ���%%
%ÿ�����ݵĳݼ�����%%
% F1=F(1:75,:);
% F2=F(76:150,:);
% F3=F(151:225,:);
% F4=F(226:300,:);

N1=ceil(Ns*ap*kb/(2*pi));
F1=F(1+N1:51,:);%%��ȡ��һ������������
F2=F(76+N1:96,:);%%��ȡ�ڶ������ݵ�������
F3=F(152+N1:205,:);%%��ȡ���������ݵ�������
F4=F(226+N1:279,:);%%��ȡ���ĸ����ݵ�������

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

%%��һ�ֳ�ֵ��,ƫ�������п���ϵ������ֵΪ0%%
% bT=[F1(:,2);F2(:,2);F3(:,2);F4(:,2)];%%׼�����������󣬵�ʽ�Ҳೣ������Ƚϼ򵥣�bTΪ��������,bRΪ��������
% bR=[F1(:,3);F2(:,3);F3(:,3);F4(:,3)];
% bT=log(bT);%%ȡlnֵ֮�������������ֵ
% bR=log(bR);
% [m1,n1]=size(F1);
% [m2,n2]=size(F2);
% [m3,n3]=size(F3);
% [m4,n4]=size(F4);
% AT=ones(m1+m2+m3+m4,2);%%׼��ϵ������ATΪ�������ģ�ARΪ��������
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

%%�ڶ��ֳ�ֵ�ⷨ%%
%%ȡ����������������������С�ģ���Ϊԭ����һ����Ϊ�����п���ϵ���ĳ�ֵ%%
Kte=0.5*min([min(F1(:,2));min(F2(:,2));min(F3(:,2));min(F4(:,2))]);%%�����п���ϵ����ֵ
Kre=0.5*min([min(F1(:,3));min(F2(:,3));min(F3(:,3));min(F4(:,3))]);%%�����п���ϵ����ֵ
bT=[F1(:,2);F2(:,2);F3(:,2);F4(:,2)];%%׼�����������󣬵�ʽ�Ҳೣ������Ƚϼ򵥣�bTΪ��������,bRΪ��������
bR=[F1(:,3);F2(:,3);F3(:,3);F4(:,3)];
bT=log(bT-Kte);%%��ȥ�п���ȡlnֵ֮�������������ֵ
bR=log(bR-Kre);
[m1,n1]=size(F1);
[m2,n2]=size(F2);
[m3,n3]=size(F3);
[m4,n4]=size(F4);
AT=ones(m1+m2+m3+m4,2);%%׼��ϵ������ATΪ�������ģ�ARΪ��������
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

%%�����������Ľ�%%
el=20;%%�������������,��
a=4;%%��ֵ
b=1.3;%%��ֵ

%%�������������Ǻ�����ָ�����֣�����ȡ����ֵ�����һ��Ҫע�⣬����������ĺ���Ҫע���������壬ʵ����ָ������Ϊ��ֵ����˼��û����%%
Xk=X0;%%��ֵXk
k=0;%%ѭ����������
%%���㺯��f(k)(x)=f(x(k));k=0%%
%%����ļ��㲻��ֱ���þ�������������ɱ����ô��жϵ�ѭ������%%
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
fk=[fk01;fk02]-[F1(:,2);F2(:,2);F3(:,2);F4(:,2);F1(:,3);F2(:,3);F3(:,3);F4(:,3)];%%��Ҫ���Ǽ�ȥ��ʵֵ

%%�����ſɱȾ���%%
%%�ſɱȾ�����Ӿ���%%
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
%%���㺯��f(k)(x)=f(x(k));
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
fk=[fk01;fk02]-[F1(:,2);F2(:,2);F3(:,2);F4(:,2);F1(:,3);F2(:,3);F3(:,3);F4(:,3)];%%��Ҫ���Ǽ�ȥ��ʵֵ
%%�����ſɱȾ���%%
%%�ſɱȾ�����Ӿ���%%
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
%%����Xk+1%%
Xk1=Xk-(Jk'*Jk+a*eye(size(Jk'*Jk)))\(Jk'*fk);
%%���㺯��f(k+1)(x)=f(x(k+1))%%
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
fk1=[fk01;fk02]-[F1(:,2);F2(:,2);F3(:,2);F4(:,2);F1(:,3);F2(:,3);F3(:,3);F4(:,3)];%%��Ҫ���Ǽ�ȥ��ʵֵ
while norm(Jk'*fk,'fro')>=el
% while norm(fk1,'fro')>=norm(fk,'fro')
% while sum(abs(fk1))>=sum(abs(fk))
    if norm(fk1,'fro')>=norm(fk,'fro')
        while norm(fk1,'fro')>=norm(fk,'fro')
            a=b*a;
            %%����Xk+1%%
            Xk1=Xk-(Jk'*Jk+a*eye(size(Jk'*Jk)))\(Jk'*fk);
            %%���㺯��f(k+1)(x)=f(x(k+1))%%
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
            fk1=[fk01;fk02]-[F1(:,2);F2(:,2);F3(:,2);F4(:,2);F1(:,3);F2(:,3);F3(:,3);F4(:,3)];%%��Ҫ���Ǽ�ȥ��ʵֵ
        end
    else
        break;
    end
end
    Xk=Xk1;
    k=k+1;
end
x=Xk;