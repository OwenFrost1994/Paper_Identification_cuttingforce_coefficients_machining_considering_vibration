clear;
clc;
close all;
%%不同实验组的结果 显示在一个图内
K=[3250.0332;90.8541;1200.5036;115.1116;251.55;52.9445];
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

figure(1)
subplot(2,2,1)
plot([1,2,3,4,5,6,7,8,9],[K(1),K(1),K(1),K(1),K(1),K(1),K(1),K(1),K(1)],'y-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,9],[mean(K1(1,:)),mean(K2(1,:)),mean(K3(1,:)),mean(K4(1,:)),mean(K5(1,:)),mean(K6(1,:)),mean(K9(1,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,9],[mean(KK1(1,:)),mean(KK2(1,:)),mean(KK3(1,:)),mean(KK4(1,:)),mean(KK5(1,:)),mean(KK6(1,:)),mean(KK9(1,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('传统辨识方法','有异构因素','无异构因素')
xlabel('实验编号')
ylabel('K_t_c(N/mm^2)')

subplot(2,2,2)
plot([1,2,3,4,5,6,7,8,9],[K(3),K(3),K(3),K(3),K(3),K(3),K(3),K(3),K(3)],'y-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,9],[mean(K1(3,:)),mean(K2(3,:)),mean(K3(3,:)),mean(K4(3,:)),mean(K5(3,:)),mean(K6(3,:)),mean(K9(3,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,9],[mean(KK1(3,:)),mean(KK2(3,:)),mean(KK3(3,:)),mean(KK4(3,:)),mean(KK5(3,:)),mean(KK6(3,:)),mean(KK9(3,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('传统辨识方法','有异构因素','无异构因素')
xlabel('实验编号')
ylabel('K_r_c(N/mm^2)')

subplot(2,2,3)
plot([1,2,3,4,5,6,7,8,9],[K(2),K(2),K(2),K(2),K(2),K(2),K(2),K(2),K(2)],'y-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,9],[mean(K1(2,:)),mean(K2(2,:)),mean(K3(2,:)),mean(K4(2,:)),mean(K5(2,:)),mean(K6(2,:)),mean(K9(2,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,9],[mean(KK1(2,:)),mean(KK2(2,:)),mean(KK3(2,:)),mean(KK4(2,:)),mean(KK5(2,:)),mean(KK6(2,:)),mean(KK9(2,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('传统辨识方法','有异构因素','无异构因素')
xlabel('实验编号')
ylabel('K_t_e(N/mm)')

subplot(2,2,4)
plot([1,2,3,4,5,6,7,8,9],[K(4),K(4),K(4),K(4),K(4),K(4),K(4),K(4),K(4)],'y-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,9],[mean(K1(4,:)),mean(K2(4,:)),mean(K3(4,:)),mean(K4(4,:)),mean(K5(4,:)),mean(K6(4,:)),mean(K9(4,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,9],[mean(KK1(4,:)),mean(KK2(4,:)),mean(KK3(4,:)),mean(KK4(4,:)),mean(KK5(4,:)),mean(KK6(4,:)),mean(KK9(4,:))],3);
Av=polyval(AV,1:0.1:9);
plot(1:0.1:9,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('传统辨识方法','有异构因素','无异构因素')
xlabel('实验编号')
ylabel('K_r_e(N/mm)')

figure(1);
subplot(2,2,1)
[m,n]=size(K1);
plot(ones(1,n),K1(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(ones(1,n),K1(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(ones(1,n),K1(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(ones(1,n),K1(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;


figure(1)
subplot(2,2,1)
[m,n]=size(K2);
A=zeros(1,n);A=2;
plot(A,K2(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,K2(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,K2(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,K2(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;

figure(1)
[m,n]=size(K3);
A=zeros(1,n);A=3;
subplot(2,2,1)
plot(A,K3(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,K3(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,K3(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,K3(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(K4);
A=zeros(1,n);A=4;
figure(1)
subplot(2,2,1)
plot(A,K4(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,K4(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,K4(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,K4(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(K5);
A=zeros(1,n);A=5;
figure(1)
subplot(2,2,1)
plot(A,K5(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,K5(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,K5(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,K5(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(K6);
A=zeros(1,n);A=6;
figure(1)
subplot(2,2,1)
plot(A,K6(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,K6(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,K6(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,K6(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(K9);
A=zeros(1,n);A=9;
figure(1)
subplot(2,2,1)
plot(A,K9(1,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,K9(3,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,K9(2,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,K9(4,:),'b+','Markersize',10,'Markerface','white','linewidth',1.0);
hold on;
grid on;

figure(1);
subplot(2,2,1)
[m,n]=size(KK1);
plot(ones(1,n),KK1(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(ones(1,n),KK1(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(ones(1,n),KK1(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(ones(1,n),KK1(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;


figure(1)
subplot(2,2,1)
[m,n]=size(KK2);
A=zeros(1,n);A=2;
plot(A,KK2(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,KK2(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,KK2(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,KK2(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

figure(1)
[m,n]=size(KK3);
A=zeros(1,n);A=3;
subplot(2,2,1)
plot(A,KK3(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,KK3(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,KK3(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,KK3(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(KK4);
A=zeros(1,n);A=4;
figure(1)
subplot(2,2,1)
plot(A,KK4(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,KK4(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,KK4(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,KK4(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(KK5);
A=zeros(1,n);A=5;
figure(1)
subplot(2,2,1)
plot(A,KK5(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,KK5(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,KK5(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,KK5(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(KK6);
A=zeros(1,n);A=6;
figure(1)
subplot(2,2,1)
plot(A,KK6(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,KK6(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,KK6(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,KK6(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(KK9);
A=zeros(1,n);A=9;
figure(1)
subplot(2,2,1)
plot(A,KK9(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,KK9(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,KK9(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,KK9(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;

MEAN(1,1)=mean(K1(1,:));MEAN(1,2)=mean(K2(1,:));MEAN(1,3)=mean(K3(1,:));MEAN(1,4)=mean(K4(1,:));MEAN(1,5)=mean(K5(1,:));MEAN(1,6)=mean(K6(1,:));MEAN(1,9)=mean(K9(1,:));
MEAN(2,1)=mean(K1(2,:));MEAN(2,2)=mean(K2(2,:));MEAN(2,3)=mean(K3(2,:));MEAN(2,4)=mean(K4(2,:));MEAN(2,5)=mean(K5(2,:));MEAN(2,6)=mean(K6(2,:));MEAN(2,9)=mean(K9(2,:));
MEAN(3,1)=mean(K1(3,:));MEAN(3,2)=mean(K2(3,:));MEAN(3,3)=mean(K3(3,:));MEAN(3,4)=mean(K4(3,:));MEAN(3,5)=mean(K5(3,:));MEAN(3,6)=mean(K6(3,:));MEAN(3,9)=mean(K9(3,:));
MEAN(4,1)=mean(K1(4,:));MEAN(4,2)=mean(K2(4,:));MEAN(4,3)=mean(K3(4,:));MEAN(4,4)=mean(K4(4,:));MEAN(4,5)=mean(K5(4,:));MEAN(4,6)=mean(K6(4,:));MEAN(4,9)=mean(K9(4,:));

SD(1,1)=std(K1(1,:));SD(1,2)=std(K2(1,:));SD(1,3)=std(K3(1,:));SD(1,4)=std(K4(1,:));SD(1,5)=std(K5(1,:));SD(1,6)=std(K6(1,:));SD(1,9)=std(K9(1,:));
SD(2,1)=std(K1(2,:));SD(2,2)=std(K2(2,:));SD(2,3)=std(K3(2,:));SD(2,4)=std(K4(2,:));SD(2,5)=std(K5(2,:));SD(2,6)=std(K6(2,:));SD(2,9)=std(K9(2,:));
SD(3,1)=std(K1(3,:));SD(3,2)=std(K2(3,:));SD(3,3)=std(K3(3,:));SD(3,4)=std(K4(3,:));SD(3,5)=std(K5(3,:));SD(3,6)=std(K6(3,:));SD(3,9)=std(K9(3,:));
SD(4,1)=std(K1(4,:));SD(4,2)=std(K2(4,:));SD(4,3)=std(K3(4,:));SD(4,4)=std(K4(4,:));SD(4,5)=std(K5(4,:));SD(4,6)=std(K6(4,:));SD(4,9)=std(K9(4,:));

MEAN1(1,1)=mean(KK1(1,:));MEAN1(1,2)=mean(KK2(1,:));MEAN1(1,3)=mean(KK3(1,:));MEAN1(1,4)=mean(KK4(1,:));MEAN1(1,5)=mean(KK5(1,:));MEAN1(1,6)=mean(KK6(1,:));MEAN1(1,9)=mean(KK9(1,:));
MEAN1(2,1)=mean(KK1(2,:));MEAN1(2,2)=mean(KK2(2,:));MEAN1(2,3)=mean(KK3(2,:));MEAN1(2,4)=mean(KK4(2,:));MEAN1(2,5)=mean(KK5(2,:));MEAN1(2,6)=mean(KK6(2,:));MEAN1(2,9)=mean(KK9(2,:));
MEAN1(3,1)=mean(KK1(3,:));MEAN1(3,2)=mean(KK2(3,:));MEAN1(3,3)=mean(KK3(3,:));MEAN1(3,4)=mean(KK4(3,:));MEAN1(3,5)=mean(KK5(3,:));MEAN1(3,6)=mean(KK6(3,:));MEAN1(3,9)=mean(KK9(3,:));
MEAN1(4,1)=mean(KK1(4,:));MEAN1(4,2)=mean(KK2(4,:));MEAN1(4,3)=mean(KK3(4,:));MEAN1(4,4)=mean(KK4(4,:));MEAN1(4,5)=mean(KK5(4,:));MEAN1(4,6)=mean(KK6(4,:));MEAN1(4,9)=mean(KK9(4,:));

SD1(1,1)=std(KK1(1,:));SD1(1,2)=std(KK2(1,:));SD1(1,3)=std(KK3(1,:));SD1(1,4)=std(KK4(1,:));SD1(1,5)=std(KK5(1,:));SD1(1,6)=std(KK6(1,:));SD1(1,9)=std(KK9(1,:));
SD1(2,1)=std(KK1(2,:));SD1(2,2)=std(KK2(2,:));SD1(2,3)=std(KK3(2,:));SD1(2,4)=std(KK4(2,:));SD1(2,5)=std(KK5(2,:));SD1(2,6)=std(KK6(2,:));SD1(2,9)=std(KK9(2,:));
SD1(3,1)=std(KK1(3,:));SD1(3,2)=std(KK2(3,:));SD1(3,3)=std(KK3(3,:));SD1(3,4)=std(KK4(3,:));SD1(3,5)=std(KK5(3,:));SD1(3,6)=std(KK6(3,:));SD1(3,9)=std(KK9(3,:));
SD1(4,1)=std(KK1(4,:));SD1(4,2)=std(KK2(4,:));SD1(4,3)=std(KK3(4,:));SD1(4,4)=std(KK4(4,:));SD1(4,5)=std(KK5(4,:));SD1(4,6)=std(KK6(4,:));SD1(4,9)=std(KK9(4,:));

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

figure(2)
subplot(2,2,1)
plot([1,2,3,4,5,6,7,8],[K(1),K(1),K(1),K(1),K(1),K(1),K(1),K(1)],'y-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(k1(1,:)),mean(k2(1,:)),mean(k3(1,:)),mean(k4(1,:)),mean(k5(1,:)),mean(k6(1,:)),mean(k7(1,:)),mean(k8(1,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(kk1(1,:)),mean(kk2(1,:)),mean(kk3(1,:)),mean(kk4(1,:)),mean(kk5(1,:)),mean(kk6(1,:)),mean(kk7(1,:)),mean(kk8(1,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('传统辨识方法','有异构因素','无异构因素')
xlabel('实验编号')
ylabel('K_t_c(N/mm^2)')

subplot(2,2,2)
plot([1,2,3,4,5,6,7,8],[K(3),K(3),K(3),K(3),K(3),K(3),K(3),K(3)],'y-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(k1(3,:)),mean(k2(3,:)),mean(k3(3,:)),mean(k4(3,:)),mean(k5(3,:)),mean(k6(3,:)),mean(k7(3,:)),mean(k8(3,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(kk1(3,:)),mean(kk2(3,:)),mean(kk3(3,:)),mean(kk4(3,:)),mean(kk5(3,:)),mean(kk6(3,:)),mean(kk7(3,:)),mean(kk8(3,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('传统辨识方法','有异构因素','无异构因素')
xlabel('实验编号')
ylabel('K_r_c(N/mm^2)')

subplot(2,2,3)
plot([1,2,3,4,5,6,7,8],[K(2),K(2),K(2),K(2),K(2),K(2),K(2),K(2)],'y-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(k1(2,:)),mean(k2(2,:)),mean(k3(2,:)),mean(k4(2,:)),mean(k5(2,:)),mean(k6(2,:)),mean(k7(2,:)),mean(k8(2,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(kk1(2,:)),mean(kk2(2,:)),mean(kk3(2,:)),mean(kk4(2,:)),mean(kk5(2,:)),mean(kk6(2,:)),mean(kk7(2,:)),mean(kk8(2,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('传统辨识方法','有异构因素','无异构因素')
xlabel('实验编号')
ylabel('K_t_e(N/mm)')

subplot(2,2,4)
plot([1,2,3,4,5,6,7,8],[K(4),K(4),K(4),K(4),K(4),K(4),K(4),K(4)],'y-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(k1(4,:)),mean(k2(4,:)),mean(k3(4,:)),mean(k4(4,:)),mean(k5(4,:)),mean(k6(4,:)),mean(k7(4,:)),mean(k8(4,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
AV=polyfit([1,2,3,4,5,6,7,8],[mean(kk1(4,:)),mean(kk2(4,:)),mean(kk3(4,:)),mean(kk4(4,:)),mean(kk5(4,:)),mean(kk6(4,:)),mean(kk7(4,:)),mean(kk8(4,:))],3);
Av=polyval(AV,1:0.1:8);
plot(1:0.1:8,Av,'r-.','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
grid on;
xlim([0 9]);
set(gca,'FontName','Times New Roman', 'FontSize', 24)
set(get(gca,'XLabel'),'FontName','Times New Roman','Fontsize',24)
set(get(gca,'YLabel'),'FontName','Times New Roman','Fontsize',24)
legend('传统辨识方法','有异构因素','无异构因素')
xlabel('实验编号')
ylabel('K_r_e(N/mm)')

figure(2);
subplot(2,2,1)
[m,n]=size(k1);
plot(ones(1,n),k1(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(ones(1,n),k1(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(ones(1,n),k1(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(ones(1,n),k1(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;


figure(2)
subplot(2,2,1)
[m,n]=size(k2);
A=zeros(1,n);A=2;
plot(A,k2(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,k2(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,k2(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,k2(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

figure(2)
[m,n]=size(k3);
A=zeros(1,n);A=3;
subplot(2,2,1)
plot(A,k3(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,k3(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,k3(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,k3(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(k4);
A=zeros(1,n);A=4;
figure(2)
subplot(2,2,1)
plot(A,k4(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,k4(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,k4(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,k4(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(k5);
A=zeros(1,n);A=5;
figure(2)
subplot(2,2,1)
plot(A,k5(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,k5(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,k5(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,k5(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(k6);
A=zeros(1,n);A=6;
figure(2)
subplot(2,2,1)
plot(A,k6(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,k6(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,k6(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,k6(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(k7);
A=zeros(1,n);A=7;
figure(2)
subplot(2,2,1)
plot(A,k7(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,k7(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,k7(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,k7(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;

[m,n]=size(k8);
A=zeros(1,n);A=8;
figure(2)
subplot(2,2,1)
plot(A,k8(1,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,k8(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,k8(2,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,k8(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;

figure(2);
subplot(2,2,1)
[m,n]=size(kk1);
plot(ones(1,n),kk1(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(ones(1,n),kk1(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(ones(1,n),kk1(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(ones(1,n),kk1(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;


figure(2)
subplot(2,2,1)
[m,n]=size(kk2);
A=zeros(1,n);A=2;
plot(A,kk2(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,kk2(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,kk2(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,kk2(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

figure(2)
[m,n]=size(kk3);
A=zeros(1,n);A=3;
subplot(2,2,1)
plot(A,kk3(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,kk3(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,kk3(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,kk3(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(kk4);
A=zeros(1,n);A=4;
figure(2)
subplot(2,2,1)
plot(A,kk4(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,kk4(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,kk4(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,kk4(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(kk5);
A=zeros(1,n);A=5;
figure(2)
subplot(2,2,1)
plot(A,kk5(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,kk5(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,kk5(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,kk5(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(kk6);
A=zeros(1,n);A=6;
figure(2)
subplot(2,2,1)
plot(A,kk6(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,kk6(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,kk6(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,kk6(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;

[m,n]=size(kk7);
A=zeros(1,n);A=7;
figure(2)
subplot(2,2,1)
plot(A,kk7(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,kk7(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,kk7(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,kk7(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;

[m,n]=size(kk8);
A=zeros(1,n);A=8;
figure(2)
subplot(2,2,1)
plot(A,kk8(1,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,2)
plot(A,kk8(3,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,3)
plot(A,kk8(2,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
subplot(2,2,4)
plot(A,kk8(4,:),'ko','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
grid on;

MEAN2(1,1)=mean(k1(1,:));MEAN2(1,2)=mean(k2(1,:));MEAN2(1,3)=mean(k3(1,:));MEAN2(1,4)=mean(k4(1,:));MEAN2(1,5)=mean(k5(1,:));MEAN2(1,6)=mean(k6(1,:));MEAN2(1,7)=mean(k7(1,:));MEAN2(1,8)=mean(k8(1,:));
MEAN2(2,1)=mean(k1(2,:));MEAN2(2,2)=mean(k2(2,:));MEAN2(2,3)=mean(k3(2,:));MEAN2(2,4)=mean(k4(2,:));MEAN2(2,5)=mean(k5(2,:));MEAN2(2,6)=mean(k6(2,:));MEAN2(2,7)=mean(k7(2,:));MEAN2(2,8)=mean(k8(2,:));
MEAN2(3,1)=mean(k1(3,:));MEAN2(3,2)=mean(k2(3,:));MEAN2(3,3)=mean(k3(3,:));MEAN2(3,4)=mean(k4(3,:));MEAN2(3,5)=mean(k5(3,:));MEAN2(3,6)=mean(k6(3,:));MEAN2(3,7)=mean(k7(3,:));MEAN2(3,8)=mean(k8(3,:));
MEAN2(4,1)=mean(k1(4,:));MEAN2(4,2)=mean(k2(4,:));MEAN2(4,3)=mean(k3(4,:));MEAN2(4,4)=mean(k4(4,:));MEAN2(4,5)=mean(k5(4,:));MEAN2(4,6)=mean(k6(4,:));MEAN2(4,7)=mean(k7(4,:));MEAN2(4,8)=mean(k8(4,:));

MEAN3(1,1)=mean(kk1(1,:));MEAN3(1,2)=mean(kk2(1,:));MEAN3(1,3)=mean(kk3(1,:));MEAN3(1,4)=mean(kk4(1,:));MEAN3(1,5)=mean(kk5(1,:));MEAN3(1,6)=mean(kk6(1,:));MEAN3(1,7)=mean(kk7(1,:));MEAN3(1,8)=mean(kk8(1,:));
MEAN3(2,1)=mean(kk1(2,:));MEAN3(2,2)=mean(kk2(2,:));MEAN3(2,3)=mean(kk3(2,:));MEAN3(2,4)=mean(kk4(2,:));MEAN3(2,5)=mean(kk5(2,:));MEAN3(2,6)=mean(kk6(2,:));MEAN3(2,7)=mean(kk7(2,:));MEAN3(2,8)=mean(kk8(2,:));
MEAN3(3,1)=mean(kk1(3,:));MEAN3(3,2)=mean(kk2(3,:));MEAN3(3,3)=mean(kk3(3,:));MEAN3(3,4)=mean(kk4(3,:));MEAN3(3,5)=mean(kk5(3,:));MEAN3(3,6)=mean(kk6(3,:));MEAN3(3,7)=mean(kk7(3,:));MEAN3(3,8)=mean(kk8(3,:));
MEAN3(4,1)=mean(kk1(4,:));MEAN3(4,2)=mean(kk2(4,:));MEAN3(4,3)=mean(kk3(4,:));MEAN3(4,4)=mean(kk4(4,:));MEAN3(4,5)=mean(kk5(4,:));MEAN3(4,6)=mean(kk6(4,:));MEAN3(4,7)=mean(kk7(4,:));MEAN3(4,8)=mean(kk8(4,:));


SD2(1,1)=std(k1(1,:));SD2(1,2)=std(k2(1,:));SD2(1,3)=std(k3(1,:));SD2(1,4)=std(k4(1,:));SD2(1,5)=std(k5(1,:));SD2(1,6)=std(k6(1,:));SD2(1,7)=std(k7(1,:));SD2(1,8)=std(k8(1,:));
SD2(2,1)=std(k1(2,:));SD2(2,2)=std(k2(2,:));SD2(2,3)=std(k3(2,:));SD2(2,4)=std(k4(2,:));SD2(2,5)=std(k5(2,:));SD2(2,6)=std(k6(2,:));SD2(2,7)=std(k7(2,:));SD2(2,8)=std(k8(2,:));
SD2(3,1)=std(k1(3,:));SD2(3,2)=std(k2(3,:));SD2(3,3)=std(k3(3,:));SD2(3,4)=std(k4(3,:));SD2(3,5)=std(k5(3,:));SD2(3,6)=std(k6(3,:));SD2(3,7)=std(k7(3,:));SD2(3,8)=std(k8(3,:));
SD2(4,1)=std(k1(4,:));SD2(4,2)=std(k2(4,:));SD2(4,3)=std(k3(4,:));SD2(4,4)=std(k4(4,:));SD2(4,5)=std(k5(4,:));SD2(4,6)=std(k6(4,:));SD2(4,7)=std(k7(4,:));SD2(4,8)=std(k8(4,:));

SD3(1,1)=std(kk1(1,:));SD3(1,2)=std(kk2(1,:));SD3(1,3)=std(kk3(1,:));SD3(1,4)=std(kk4(1,:));SD3(1,5)=std(kk5(1,:));SD3(1,6)=std(kk6(1,:));SD3(1,7)=std(kk7(1,:));SD3(1,8)=std(kk8(1,:));
SD3(2,1)=std(kk1(2,:));SD3(2,2)=std(kk2(2,:));SD3(2,3)=std(kk3(2,:));SD3(2,4)=std(kk4(2,:));SD3(2,5)=std(kk5(2,:));SD3(2,6)=std(kk6(2,:));SD3(2,7)=std(kk7(2,:));SD3(2,8)=std(kk8(2,:));
SD3(3,1)=std(kk1(3,:));SD3(3,2)=std(kk2(3,:));SD3(3,3)=std(kk3(3,:));SD3(3,4)=std(kk4(3,:));SD3(3,5)=std(kk5(3,:));SD3(3,6)=std(kk6(3,:));SD3(3,7)=std(kk7(3,:));SD3(3,8)=std(kk8(3,:));
SD3(4,1)=std(kk1(4,:));SD3(4,2)=std(kk2(4,:));SD3(4,3)=std(kk3(4,:));SD3(4,4)=std(kk4(4,:));SD3(4,5)=std(kk5(4,:));SD3(4,6)=std(kk6(4,:));SD3(4,7)=std(kk7(4,:));SD3(4,8)=std(kk8(4,:));