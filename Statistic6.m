%%有initial centroids聚类
clear
clc
close all
%%看均值和方差的变化
[CFCL1]=xlsread('CFCL.xlsx',1);
[CFCL2]=xlsread('CFCL.xlsx',2);
[CFCL3]=xlsread('CFCL.xlsx',3);
[CFCL4]=xlsread('CFCL.xlsx',4);
[CFCL5]=xlsread('CFCL.xlsx',5);
[CFCL6]=xlsread('CFCL.xlsx',6);
[CFCL7]=xlsread('CFCL.xlsx',7);

[CFCS1]=xlsread('CFCS.xlsx',1);
[CFCS2]=xlsread('CFCS.xlsx',2);
[CFCS3]=xlsread('CFCS.xlsx',3);
[CFCS4]=xlsread('CFCS.xlsx',4);
[CFCS5]=xlsread('CFCS.xlsx',5);
[CFCS6]=xlsread('CFCS.xlsx',6);
[CFCS7]=xlsread('CFCS.xlsx',7);
[CFCS8]=xlsread('CFCS.xlsx',8);

AV(:,1)=mean(CFCL1,2);
AV(:,2)=mean(CFCL2,2);
AV(:,3)=mean(CFCL3,2);
AV(:,4)=mean(CFCL4,2);
AV(:,5)=mean(CFCL5,2);
AV(:,6)=mean(CFCL6,2);
AV(:,7)=mean(CFCL7,2);
AV=AV(1:4,:);

av(:,1)=mean(CFCS1,2);
av(:,2)=mean(CFCS2,2);
av(:,3)=mean(CFCS3,2);
av(:,4)=mean(CFCS4,2);
av(:,5)=mean(CFCS5,2);
av(:,6)=mean(CFCS6,2);
av(:,7)=mean(CFCS7,2);
av(:,8)=mean(CFCS8,2);
av=av(1:4,:);

CFCL=[CFCL1,CFCL2,CFCL3,CFCL4,CFCL5,CFCL6,CFCL7];
CFCS=[CFCS1,CFCS2,CFCS3,CFCS4,CFCS5,CFCS6,CFCS7,CFCS8];

%%基于前面的研究利用均值设计初始中心
%%初始中心选取方法有多种
%%1；2，3，7；4，5，6
%%1；2，3，4，5，7；6
ICEL3(1,:)=AV(:,1)';
ICEL3(2,:)=(AV(:,2)'+AV(:,3)'+AV(:,7)')/3;
ICEL3(3,:)=(AV(:,4)'+AV(:,5)'+AV(:,6)')/3;
% ICEL3(1,:)=AV(:,1)';
% ICEL3(2,:)=(AV(:,2)'+AV(:,3)'+AV(:,4)'+AV(:,5)'+AV(:,7)')/3;
% ICEL3(3,:)=AV(:,6)';
%%应用kmeans聚类方法
CFCL=CFCL(1:4,:)';%%取前四个参数，矩阵转置
%%10mm铣刀实验结果有初值，聚类为3类
[IdxL3,CtrsL3,SumDL3,DL3] = kmeans(CFCL,3,'Start',ICEL3);

%%画出各个聚类的类别
figure(1)
subplot(2,3,1)
scatter3(CFCL(IdxL3==1,1),CFCL(IdxL3==1,2),CFCL(IdxL3==1,3),50,CFCL(IdxL3==1,4),'o','linewidth',6.0);
hold on;
plot3(CtrsL3(1,1),CtrsL3(1,2),CtrsL3(1,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,3,2)
scatter3(CFCL(IdxL3==2,1),CFCL(IdxL3==2,2),CFCL(IdxL3==2,3),50,CFCL(IdxL3==2,4),'o','linewidth',6.0);
hold on;
plot3(CtrsL3(2,1),CtrsL3(2,2),CtrsL3(2,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,3,3)
scatter3(CFCL(IdxL3==3,1),CFCL(IdxL3==3,2),CFCL(IdxL3==3,3),50,CFCL(IdxL3==3,4),'o','linewidth',6.0);
hold on;
plot3(CtrsL3(3,1),CtrsL3(3,2),CtrsL3(3,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,3,4)
scatter3(CFCL(IdxL3==1,1),CFCL(IdxL3==1,2),CFCL(IdxL3==1,3),50,'ro','linewidth',6.0);
hold on;
scatter3(CFCL(IdxL3==2,1),CFCL(IdxL3==2,2),CFCL(IdxL3==2,3),50,'bo','linewidth',6.0);
hold on;
scatter3(CFCL(IdxL3==3,1),CFCL(IdxL3==3,2),CFCL(IdxL3==3,3),50,'ko','linewidth',6.0);
hold on;
plot3(CtrsL3(:,1),CtrsL3(:,2),CtrsL3(:,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
legend('G1','G2','G3','Centroids')
subplot(2,3,6)
scatter(CFCL(IdxL3==1,1),CFCL(IdxL3==1,3),50,'ro','linewidth',6.0);
hold on;
scatter(CFCL(IdxL3==2,1),CFCL(IdxL3==2,3),50,'bo','linewidth',6.0);
hold on;
scatter(CFCL(IdxL3==3,1),CFCL(IdxL3==3,3),50,'ko','linewidth',6.0);
hold on;
plot(CtrsL3(:,1),CtrsL3(:,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
grid on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Krc')
legend('G1','G2','G3','Centroids')

%%10mm铣刀实验结果有初值，聚类为4类
%初始点选取按照1；2，3，7；4，5；6
ICEL4(1,:)=AV(:,1)';
ICEL4(2,:)=(AV(:,2)'+AV(:,3)'+AV(:,7)')/3;
ICEL4(3,:)=(AV(:,4)'+AV(:,5)')/2;
ICEL4(4,:)=AV(:,6)';
[IdxL4,CtrsL4,SumDL4,DL4] = kmeans(CFCL,4,'Start',ICEL4);
figure(2)
subplot(2,4,1)
scatter3(CFCL(IdxL4==1,1),CFCL(IdxL4==1,2),CFCL(IdxL4==1,3),50,CFCL(IdxL4==1,4),'o','linewidth',6.0);
hold on;
plot3(CtrsL4(1,1),CtrsL4(1,2),CtrsL4(1,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,4,2)
scatter3(CFCL(IdxL4==2,1),CFCL(IdxL4==2,2),CFCL(IdxL4==2,3),50,CFCL(IdxL4==2,4),'o','linewidth',6.0);
hold on;
plot3(CtrsL4(2,1),CtrsL4(2,2),CtrsL4(2,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,4,3)
scatter3(CFCL(IdxL4==3,1),CFCL(IdxL4==3,2),CFCL(IdxL4==3,3),50,CFCL(IdxL4==3,4),'o','linewidth',6.0);
hold on;
plot3(CtrsL4(3,1),CtrsL4(3,2),CtrsL4(3,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,4,4)
scatter3(CFCL(IdxL4==4,1),CFCL(IdxL4==4,2),CFCL(IdxL4==4,3),50,CFCL(IdxL4==4,4),'o','linewidth',6.0);
hold on;
plot3(CtrsL4(4,1),CtrsL4(4,2),CtrsL4(4,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,4,5)
scatter3(CFCL(IdxL4==1,1),CFCL(IdxL4==1,2),CFCL(IdxL4==1,3),50,'ro','linewidth',6.0);
hold on;
scatter3(CFCL(IdxL4==2,1),CFCL(IdxL4==2,2),CFCL(IdxL4==2,3),50,'bo','linewidth',6.0);
hold on;
scatter3(CFCL(IdxL4==3,1),CFCL(IdxL4==3,2),CFCL(IdxL4==3,3),50,'ko','linewidth',6.0);
hold on;
scatter3(CFCL(IdxL4==4,1),CFCL(IdxL4==4,2),CFCL(IdxL4==4,3),50,'yo','linewidth',6.0);
hold on;
plot3(CtrsL4(:,1),CtrsL4(:,2),CtrsL4(:,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
legend('G1','G2','G3','G4','Centroids')
subplot(2,4,8)
scatter(CFCL(IdxL4==1,1),CFCL(IdxL4==1,3),50,'ro','linewidth',6.0);
hold on;
scatter(CFCL(IdxL4==2,1),CFCL(IdxL4==2,3),50,'bo','linewidth',6.0);
hold on;
scatter(CFCL(IdxL4==3,1),CFCL(IdxL4==3,3),50,'ko','linewidth',6.0);
hold on;
scatter(CFCL(IdxL4==4,1),CFCL(IdxL4==4,3),50,'yo','linewidth',6.0);
hold on;
plot(CtrsL4(:,1),CtrsL4(:,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
grid on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Krc')
legend('G1','G2','G3','G4','Centroids')


CFCS=CFCS(1:4,:)';%%取前四个参数，矩阵转置
%初始点选取按照4,5,7,8;3,6;1,2
ICES3(1,:)=(av(:,4)'+av(:,5)'+av(:,7)'+av(:,8)')/4;
ICES3(2,:)=(av(:,3)'+av(:,6)')/2;
ICES3(3,:)=(av(:,1)'+av(:,2)')/2;
%%8mm铣刀实验结果有初值，聚类为3类
[IdxS3,CtrsS3,SumDS3,DS3] = kmeans(CFCS,3,'Start',ICES3);
figure(3)
subplot(2,3,1)
scatter3(CFCS(IdxS3==1,1),CFCS(IdxS3==1,2),CFCS(IdxS3==1,3),50,CFCS(IdxS3==1,4),'o','linewidth',6.0);
hold on;
plot3(CtrsS3(1,1),CtrsS3(1,2),CtrsS3(1,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,3,2)
scatter3(CFCS(IdxS3==2,1),CFCS(IdxS3==2,2),CFCS(IdxS3==2,3),50,CFCS(IdxS3==2,4),'o','linewidth',6.0);
hold on;
plot3(CtrsS3(2,1),CtrsS3(2,2),CtrsS3(2,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,3,3)
scatter3(CFCS(IdxS3==3,1),CFCS(IdxS3==3,2),CFCS(IdxS3==3,3),50,CFCS(IdxS3==3,4),'o','linewidth',6.0);
hold on;
plot3(CtrsS3(3,1),CtrsS3(3,2),CtrsS3(3,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,3,4)
scatter3(CFCS(IdxS3==1,1),CFCS(IdxS3==1,2),CFCS(IdxS3==1,3),50,'ro','linewidth',6.0);
hold on;
scatter3(CFCS(IdxS3==2,1),CFCS(IdxS3==2,2),CFCS(IdxS3==2,3),50,'bo','linewidth',6.0);
hold on;
scatter3(CFCS(IdxS3==3,1),CFCS(IdxS3==3,2),CFCS(IdxS3==3,3),50,'ko','linewidth',6.0);
hold on;
plot3(CtrsS3(:,1),CtrsS3(:,2),CtrsS3(:,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
legend('G1','G2','G3','Centroids')
subplot(2,3,6)
scatter(CFCS(IdxS3==1,1),CFCS(IdxS3==1,3),50,'ro','linewidth',6.0);
hold on;
scatter(CFCS(IdxS3==2,1),CFCS(IdxS3==2,3),50,'bo','linewidth',6.0);
hold on;
scatter(CFCS(IdxS3==3,1),CFCS(IdxS3==3,3),50,'ko','linewidth',6.0);
hold on;
plot(CtrsS3(:,1),CtrsS3(:,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
grid on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Krc')
legend('G1','G2','G3','Centroids')

%%8mm铣刀实验结果有初值，聚类为4类
%%初始点的选取为
ICES4(1,:)=av(:,6)';
ICES4(2,:)=av(:,3)';
ICES4(3,:)=(av(:,4)'+av(:,5)'+av(:,7)'+av(:,8)')/4;
ICES4(4,:)=(av(:,1)'+av(:,2)')/2;
[IdxS4,CtrsS4,SumDS4,DS4] = kmeans(CFCS,4,'Start',ICES4);
figure(4)
subplot(2,4,1)
scatter3(CFCS(IdxS4==1,1),CFCS(IdxS4==1,2),CFCS(IdxS4==1,3),50,CFCS(IdxS4==1,4),'o','linewidth',6.0);
hold on;
plot3(CtrsS4(1,1),CtrsS4(1,2),CtrsS4(1,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,4,2)
scatter3(CFCS(IdxS4==2,1),CFCS(IdxS4==2,2),CFCS(IdxS4==2,3),50,CFCS(IdxS4==2,4),'o','linewidth',6.0);
hold on;
plot3(CtrsS4(2,1),CtrsS4(2,2),CtrsS4(2,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,4,3)
scatter3(CFCS(IdxS4==3,1),CFCS(IdxS4==3,2),CFCS(IdxS4==3,3),50,CFCS(IdxS4==3,4),'o','linewidth',6.0);
hold on;
plot3(CtrsS4(3,1),CtrsS4(3,2),CtrsS4(3,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,4,4)
scatter3(CFCS(IdxS4==4,1),CFCS(IdxS4==4,2),CFCS(IdxS4==4,3),50,CFCS(IdxS4==4,4),'o','linewidth',6.0);
hold on;
plot3(CtrsS4(4,1),CtrsS4(4,2),CtrsS4(4,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(2,4,5)
scatter3(CFCS(IdxS4==1,1),CFCS(IdxS4==1,2),CFCS(IdxS4==1,3),50,'ro','linewidth',6.0);
hold on;
scatter3(CFCS(IdxS4==2,1),CFCS(IdxS4==2,2),CFCS(IdxS4==2,3),50,'bo','linewidth',6.0);
hold on;
scatter3(CFCS(IdxS4==3,1),CFCS(IdxS4==3,2),CFCS(IdxS4==3,3),50,'ko','linewidth',6.0);
hold on;
scatter3(CFCS(IdxS4==4,1),CFCS(IdxS4==4,2),CFCS(IdxS4==4,3),50,'yo','linewidth',6.0);
hold on;
plot3(CtrsS4(:,1),CtrsS4(:,2),CtrsS4(:,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Kte')
zlabel('Krc')
legend('G1','G2','G3','G4','Centroids')
subplot(2,4,8)
scatter(CFCS(IdxS4==1,1),CFCS(IdxS4==1,3),50,'ro','linewidth',6.0);
hold on;
scatter(CFCS(IdxS4==2,1),CFCS(IdxS4==2,3),50,'bo','linewidth',6.0);
hold on;
scatter(CFCS(IdxS4==3,1),CFCS(IdxS4==3,3),50,'ko','linewidth',6.0);
hold on;
scatter(CFCS(IdxS4==4,1),CFCS(IdxS4==4,3),50,'yo','linewidth',6.0);
hold on;
plot(CtrsS4(:,1),CtrsS4(:,3),'mx','MarkerSize',30,'LineWidth',6)
hold on;
grid on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc')
ylabel('Krc')
legend('G1','G2','G3','G4','Centroids')