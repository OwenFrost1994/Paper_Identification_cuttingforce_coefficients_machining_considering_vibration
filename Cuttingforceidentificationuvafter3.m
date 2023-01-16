clear;
clc;
close all;
%%不同实验组的结果 显示在一个图内
[K1]=xlsread('CFCL.xlsx',1);
[K2]=xlsread('CFCL.xlsx',2);
[K3]=xlsread('CFCL.xlsx',3);
[K4]=xlsread('CFCL.xlsx',4);
[K5]=xlsread('CFCL.xlsx',5);
[K6]=xlsread('CFCL.xlsx',6);
[K9]=xlsread('CFCL.xlsx',7);

[KK1]=xlsread('CFCL1.xlsx',1);
[KK2]=xlsread('CFCL1.xlsx',2);
[KK3]=xlsread('CFCL1.xlsx',3);
[KK4]=xlsread('CFCL1.xlsx',4);
[KK5]=xlsread('CFCL1.xlsx',5);
[KK6]=xlsread('CFCL1.xlsx',6);
[KK9]=xlsread('CFCL1.xlsx',7);

[m,n1]=size(K1);
A1=ones(1,n1);
A1=1*A1;
[m,n2]=size(K2);
A2=ones(1,n2);
A2=2*A2;
[m,n3]=size(K3);
A3=ones(1,n3);
A3=3*A3;
[m,n4]=size(K9);
A4=ones(1,n4);
A4=4*A4;
[m,n5]=size(K4);
A5=ones(1,n5);
A5=5*A5;
[m,n6]=size(K5);
A6=ones(1,n6);
A6=6*A6;
[m,n7]=size(K6);
A7=ones(1,n7);
A7=7*A7;

figure(1)
AV=polyfit([1,2,3,4,5,6,7],[mean(K1(1,:)),mean(K2(1,:)),mean(K3(1,:)),mean(K9(1,:)),mean(K4(1,:)),mean(K5(1,:)),mean(K6(1,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7],[mean(KK1(1,:)),mean(KK2(1,:)),mean(KK3(1,:)),mean(KK9(1,:)),mean(KK4(1,:)),mean(KK5(1,:)),mean(KK6(1,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(A1(1),K1(1,1),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(1),KK1(1,1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(2:n1),K1(1,2:n1),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(2:n1),KK1(1,2:n1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A2,K2(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A2,KK2(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A3,K3(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A3,KK3(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A4,K9(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A4,KK9(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A5,K4(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A5,KK4(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A6,K5(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A6,KK5(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A7,K6(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A7,KK6(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([0 8]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('with vibration','without vibration','with vibration','without vibration')
xlabel('Test No.')
ylabel('K_t_c(N/mm^2)')

figure(2)
AV=polyfit([1,2,3,4,5,6,7],[mean(K1(3,:)),mean(K2(3,:)),mean(K3(3,:)),mean(K9(3,:)),mean(K4(3,:)),mean(K5(3,:)),mean(K6(3,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7],[mean(KK1(3,:)),mean(KK2(3,:)),mean(KK3(3,:)),mean(KK9(3,:)),mean(KK4(3,:)),mean(KK5(3,:)),mean(KK6(3,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(A1(1),K1(3,1),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(1),KK1(3,1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(2:n1),K1(3,2:n1),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(2:n1),KK1(3,2:n1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A2,K2(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A2,KK2(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A3,K3(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A3,KK3(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A4,K9(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A4,KK9(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A5,K4(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A5,KK4(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A6,K5(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A6,KK5(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A7,K6(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A7,KK6(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([0 8]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('with vibration','without vibration','with vibration','without vibration')
xlabel('Test No.')
ylabel('K_r_c(N/mm^2)')

figure(3)
AV=polyfit([1,2,3,4,5,6,7],[mean(K1(2,:)),mean(K2(2,:)),mean(K3(2,:)),mean(K9(2,:)),mean(K4(2,:)),mean(K5(2,:)),mean(K6(2,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7],[mean(KK1(2,:)),mean(KK2(2,:)),mean(KK3(2,:)),mean(KK9(2,:)),mean(KK4(2,:)),mean(KK5(2,:)),mean(KK6(2,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(A1(1),K1(2,1),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(1),KK1(2,1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(2:n1),K1(2,2:n1),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(2:n1),KK1(2,2:n1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A2,K2(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A2,KK2(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A3,K3(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A3,KK3(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A4,K9(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A4,KK9(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A5,K4(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A5,KK4(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A6,K5(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A6,KK5(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A7,K6(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A7,KK6(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([0 8]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('with vibration','without vibration','with vibration','without vibration')
xlabel('Test No.')
ylabel('K_t_e(N/mm)')

figure(4)
AV=polyfit([1,2,3,4,5,6,7],[mean(K1(4,:)),mean(K2(4,:)),mean(K3(4,:)),mean(K9(4,:)),mean(K4(4,:)),mean(K5(4,:)),mean(K6(4,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7],[mean(KK1(4,:)),mean(KK2(4,:)),mean(KK3(4,:)),mean(KK9(4,:)),mean(KK4(4,:)),mean(KK5(4,:)),mean(KK6(4,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(A1(1),K1(4,1),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(1),KK1(4,1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(2:n1),K1(4,2:n1),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A1(2:n1),KK1(4,2:n1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A2,K2(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A2,KK2(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A3,K3(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A3,KK3(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A4,K9(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A4,KK9(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A5,K4(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A5,KK4(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A6,K5(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A6,KK5(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(A7,K6(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
plot(A7,KK6(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([0 8]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('with vibration','without vibration','with vibration','without vibration')
xlabel('Test No.')
ylabel('K_r_e(N/mm)')


[k1]=xlsread('CFCS.xlsx',1);
[k2]=xlsread('CFCS.xlsx',2);
[k3]=xlsread('CFCS.xlsx',3);
[k4]=xlsread('CFCS.xlsx',4);
[k5]=xlsread('CFCS.xlsx',5);
[k6]=xlsread('CFCS.xlsx',6);
[k7]=xlsread('CFCS.xlsx',7);
[k8]=xlsread('CFCS.xlsx',8);

[kk1]=xlsread('CFCS1.xlsx',1);
[kk2]=xlsread('CFCS1.xlsx',2);
[kk3]=xlsread('CFCS1.xlsx',3);
[kk4]=xlsread('CFCS1.xlsx',4);
[kk5]=xlsread('CFCS1.xlsx',5);
[kk6]=xlsread('CFCS1.xlsx',6);
[kk7]=xlsread('CFCS1.xlsx',7);
[kk8]=xlsread('CFCS1.xlsx',8);

[m,n1]=size(k6);
a1=ones(1,n1);
a1=1*a1;
[m,n2]=size(k7);
a2=ones(1,n2);
a2=2*a2;
[m,n3]=size(k8);
a3=ones(1,n3);
a3=3*a3;
[m,n4]=size(k3);
a4=ones(1,n4);
a4=4*a4;
[m,n5]=size(k4);
a5=ones(1,n5);
a5=5*a5;
[m,n6]=size(k5);
a6=ones(1,n6);
a6=6*a6;
[m,n7]=size(k2);
a7=ones(1,n7);
a7=7*a7;
[m,n8]=size(k1);
a8=ones(1,n8);
a8=8*a8;

figure(5)
subplot(2,2,1)
AV=polyfit([1,2,3,4,5,6,7,8],[mean(k6(1,:)),mean(k7(1,:)),mean(k8(1,:)),mean(k3(1,:)),mean(k4(1,:)),mean(k5(1,:)),mean(k2(1,:)),mean(k1(1,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(kk6(1,:)),mean(kk7(1,:)),mean(kk8(1,:)),mean(kk3(1,:)),mean(kk4(1,:)),mean(kk5(1,:)),mean(kk2(1,:)),mean(kk1(1,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(a1(1),k6(1,1),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(1),kk6(1,1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(2:n1),k6(1,2:n1),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(2:n1),kk6(1,2:n1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a2,k7(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a2,kk7(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a3,k8(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a3,kk8(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a4,k3(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a4,kk3(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a5,k4(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a5,kk4(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a6,k5(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a6,kk5(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a7,k2(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a7,kk2(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a8,k1(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a8,kk1(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('with vibration','without vibration','with vibration','without vibration')
xlabel('Test No.')
ylabel('K_t_c(N/mm^2)')

figure(6)
AV=polyfit([1,2,3,4,5,6,7,8],[mean(k6(3,:)),mean(k7(3,:)),mean(k8(3,:)),mean(k3(3,:)),mean(k4(3,:)),mean(k5(3,:)),mean(k2(3,:)),mean(k1(3,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(kk6(3,:)),mean(kk7(3,:)),mean(kk8(3,:)),mean(kk3(3,:)),mean(kk4(3,:)),mean(kk5(3,:)),mean(kk2(3,:)),mean(kk1(3,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(a1(1),k6(3,1),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(1),kk6(3,1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(2:n1),k6(3,2:n1),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(2:n1),kk6(3,2:n1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a2,k7(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a2,kk7(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a3,k8(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a3,kk8(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a4,k3(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a4,kk3(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a5,k4(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a5,kk4(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a6,k5(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a6,kk5(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a7,k2(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a7,kk2(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a8,k1(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a8,kk1(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('with vibration','without vibration','with vibration','without vibration')
xlabel('Test No.')
ylabel('K_r_c(N/mm^2)')

figure(7)
AV=polyfit([1,2,3,4,5,6,7,8],[mean(k6(2,:)),mean(k7(2,:)),mean(k8(2,:)),mean(k3(2,:)),mean(k4(2,:)),mean(k5(2,:)),mean(k2(2,:)),mean(k1(2,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(kk6(2,:)),mean(kk7(2,:)),mean(kk8(2,:)),mean(kk3(2,:)),mean(kk4(2,:)),mean(kk5(2,:)),mean(kk2(2,:)),mean(kk1(2,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(a1(1),k6(2,1),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(1),kk6(2,1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(2:n1),k6(2,2:n1),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(2:n1),kk6(2,2:n1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a2,k7(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a2,kk7(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a3,k8(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a3,kk8(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a4,k3(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a4,kk3(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a5,k4(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a5,kk4(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a6,k5(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a6,kk5(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a7,k2(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a7,kk2(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a8,k1(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a8,kk1(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('with vibration','without vibration','with vibration','without vibration')
xlabel('Test No.')
ylabel('K_t_e(N/mm)')

figure(8)
AV=polyfit([1,2,3,4,5,6,7,8],[mean(k6(4,:)),mean(k7(4,:)),mean(k8(4,:)),mean(k3(4,:)),mean(k4(4,:)),mean(k5(4,:)),mean(k2(4,:)),mean(k1(4,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(kk6(4,:)),mean(kk7(4,:)),mean(kk8(4,:)),mean(kk3(4,:)),mean(kk4(4,:)),mean(kk5(4,:)),mean(kk2(4,:)),mean(kk1(4,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(a1(1),k6(4,1),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(1),kk6(4,1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(2:n1),k6(4,2:n1),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a1(2:n1),kk6(4,2:n1),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a2,k7(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a2,kk7(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a3,k8(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a3,kk8(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a4,k3(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a4,kk3(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a5,k4(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a5,kk4(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a6,k5(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a6,kk5(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a7,k2(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a7,kk2(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a8,k1(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(a8,kk1(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('with vibration','without vibration','with vibration','without vibration')
xlabel('Test No.')
ylabel('K_r_e(N/mm)')
