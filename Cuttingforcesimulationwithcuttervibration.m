clear;
clc;
%%������Ԥ��ģ�ͣ�����״̬�£����ǵ��ߵ��񶯣������ߵ���δ���빤�������ﵶ��ֱ���Ѿ����ֺã���΢Ԫ��ʽ%%
%%���߼��β���%%
D=10;%%���߰뾶
N=4;%%���߳���
B=pi/6;%%����������
Cp=2*pi/N;%%�ݼ��

%%���߸նȲ���%%
kx=23030727.4827;%%x����ն�
ky=23030727.4827;%%y����ն�
cx=214.1390;%%x��������
cy=214.1390;%%y��������
mx=0.7037;%%x��������
my=0.7037;%%y��������

%%���ϲ���%%����GH909%%
Ktc=6662.16;%%���������ϵ��
Kte=61.27;%%�����п���ϵ��
Krc=4275.32;%%���������ϵ��
Kre=130.27;%%�����п���ϵ��
Kac=270.62;%%���������ϵ��
Kae=104.90;%%�����п���ϵ��

%%�ӹ�����%%
%%ϳ����ʽ:˳ϳ%%
Cm=1;%%ϳ����ʽ��˳ϳΪ1����ϳΪ0
S=1000;%%����ת��
f=200;%%�����ٶ�
ap=2;%%���������λmm��
ae=5;%%���������λmm��
Cn=10;%%Ȧ��circle number

%%������������%%
R=D/2;%%���߰뾶
kb=(2*tan(B))/D;%%k�¼���
fe=f/(N*S);%%feed every tooth
w=2*pi*S/60;%%���߽��ٶ�
T=2*pi/w;%%��������
if Cm==1%%˳ϳ
    Cst=pi-acos((R-ae)/R);%%�����
    Cex=pi;%%�г���
else%%��ϳ
    Cst=0;%%�����
    Cex=acos((R-ae)/R);%%�г���
end
Cs=0;%%��ʼ�Ƕ�
Dt=T/720;%%ʱ�䲽��
DC=Dt*w;%%�Ƕ�����
Ca=Cs;%%��ʼ�Ƕ�

%%���ִ洢��Ԫ%%
Fx=0;
Fy=0;
Fz=0;%%���������ۼӱ���
F=zeros(3,720*Cn);%%�洢���������������
Xx=zeros(1,720*Cn);%%������x�������λ��
Xy=zeros(1,720*Cn);%%������y�������λ��
Vx=zeros(1,720*Cn);%%������x��������ٶ�
Vy=zeros(1,720*Cn);%%������y��������ٶ�
Dx=zeros(1,720*Cn);%%������x�����λ�Ʊ仯����fv�ĵ�һ������
Dy=zeros(1,720*Cn);%%������y�����λ�Ʊ仯����fv�ĵڶ�������
apx=zeros(1,Cn*N);
apy=zeros(1,Cn*N);

%%��������ģ����Ĵ�ѭ��
for i=1:1:720*Cn;
    Ca=Ca+DC;%%΢Ԫ�Ƕȵ��Ӽ��㵶�ߵ�ת����
    if Ca>2*pi%%���ǵ��߶����ת���ڣ��ۼӵĵ��߽Ƕȳ���һ�ܾͼ�ȥһ��2��
        Ca=Ca-2*pi;
    else
    end

%%���㸽�ӽ�������iʱ�̵�������iʱ�̵�λ�ƣ�����i+1ʱ�̵�λ��
       if i<=(720/N)%%����ǵ�һ���������е�ʱ����м�ϱ���û��ǰһ�������г��Ĳ��Ʊ��棬��ʱ�൱�ڵ������񶯵����
           if i==1
               Dx(i)=1000*(0-0);%%ע�⵽����ѧ�����������е�λΪ�����Ƶ�λ������õ�λ�Ƶ�λΪm����ÿ�ݽ������ĵ�λ��mm
               Dy(i)=1000*(0-0);
           else
%                ii=i-1;
               Dx(i)=1000*(Xx(i)-0);%%ע�⵽����ѧ�����������е�λΪ�����Ƶ�λ������õ�λ�Ƶ�λΪm����ÿ�ݽ������ĵ�λ��mm
               Dy(i)=1000*(Xy(i)-0);
           end
       else
           q=floor((i)*N/720);%%����ǰ���ж��ٸ���������
           if (i-q*720/N)==0%%���������ĳһʱ��ǰ�������������������ڣ�Ӧ�ü�ȥһ��
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

%%���Ӽ��������ݵ���ѭ��
for j=1:1:N 
    C=Ca-(j-1)*Cp;%%���Ƕ�ݴ��ڵĳݼ���ͺ�
    if C<0
        C=C+2*pi;%%������ݽǶ�С������ת�����ĽǶ�
    else
    end
%%�жϼ���ýǶ��µ��еĻ������½�
if (kb*ap)<=abs(Cex-Cst)%%�޵��п�������г���������
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
if (kb*ap)>abs(Cex-Cst)%%�е��п�������г���������
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
%%���ú�������õ��ݵ�������
[fx,fy,fz]=cuttingforce(Ktc,Kte,Krc,Kre,Kac,Kae,C1,C2,kb,fe,Dx(i),Dy(i));
%%�ۼӼ����������ߵ�����
Fx=Fx+fx;Fy=Fy+fy;Fz=Fz+fz;
end
%%λ�Ƽ������
F(1,i)=Fx;F(2,i)=Fy;F(3,i)=Fz;%%�ھ����д洢������
Fx=0;Fy=0;Fz=0;%%���������ۼӱ�������
%%Runge-Kutta�����㵶�ߵ���λ�ƺ��ٶ�
if  i==1 %%�ж��Ƿ��ǳ�ʼ�㣨��һ���㣩
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
    else %%���ǳ�ʼ��
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

%%��������ͼ����ɫX�򣬺�ɫY����ɫZ��
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

%%���ĶԱȼӽ���%%
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


% %%���Ƶ�����x�����y�����λ�ƺ��ٶ�ͼ��
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