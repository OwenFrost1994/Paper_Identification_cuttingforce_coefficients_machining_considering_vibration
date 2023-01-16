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

% [M,N]=size(CFCL1);
% Upv=max(CFCL1(4,:));
% Downv=min(CFCL1(4,:));
% C=zeros(N,3);
% %黑灰色点图
% % C(:,1)=0.5*(Upv-CFCL1(4,:)')/(Upv-Downv);
% % C(:,2)=0.5*(Upv-CFCL1(4,:)')/(Upv-Downv);
% % C(:,3)=0.5*(Upv-CFCL1(4,:)')/(Upv-Downv);
% %黑蓝色点图
% C(:,3)=(Upv-CFCL1(4,:)')/(Upv-Downv);
% figure(1)
% for i=1:1:N
%     plot3(CFCL1(1,i),CFCL1(2,i),CFCL1(3,i),'o','Color',C(i,:),'Markersize',7,'linewidth',2.0)
%     hold on;
% end
% xlabel('Ktc(N/mm^2)')
% ylabel('Kte(N/mm)')
% zlabel('Krc(N/mm^2)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)

tcmax=max(CFCL1(1,:));
tcmin=min(CFCL1(1,:));
temax=max(CFCL1(2,:));
temin=min(CFCL1(2,:));
rcmax=max(CFCL1(3,:));
rcmin=min(CFCL1(3,:));
% figure(2)
scatter3(CFCL1(1,:),CFCL1(2,:),CFCL1(3,:),50,CFCL1(4,:),'o','linewidth',6.0);
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc(N/mm^2)','Fontname', 'Times New Roman','Fontsize',20)
ylabel('Kte(N/mm)','Fontname', 'Times New Roman','Fontsize',20)
zlabel('Krc(N/mm^2)','Fontname', 'Times New Roman','Fontsize',20)
xlim([tcmin tcmax])
ylim([temin temax])
zlim([rcmin rcmax])
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kre(N/mm)','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名

AV(:,1)=mean(CFCL1,2);
AV(:,2)=mean(CFCL2,2);
AV(:,3)=mean(CFCL3,2);
AV(:,4)=mean(CFCL4,2);
AV(:,5)=mean(CFCL5,2);
AV(:,6)=mean(CFCL6,2);
AV(:,7)=mean(CFCL7,2);
% figure(3)
subplot(1,2,1)
scatter3(AV(1,:),AV(2,:),AV(3,:),50,AV(4,:),'o','linewidth',6.0);
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktcav(N/mm^2)','Fontname', 'Times New Roman','Fontsize',20)
ylabel('Kteav(N/mm)','Fontname', 'Times New Roman','Fontsize',20)
zlabel('Krcav(N/mm^2)','Fontname', 'Times New Roman','Fontsize',20)
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kreav(N/mm)','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(1,2,2)
scatter(AV(1,:),AV(3,:),50,'o','linewidth',6.0);
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktcav(N/mm^2)')
ylabel('Krcav(N/mm^2)')

av(:,1)=mean(CFCS1,2);
av(:,2)=mean(CFCS2,2);
av(:,3)=mean(CFCS3,2);
av(:,4)=mean(CFCS4,2);
av(:,5)=mean(CFCS5,2);
av(:,6)=mean(CFCS6,2);
av(:,7)=mean(CFCS7,2);
av(:,8)=mean(CFCS8,2);
% figure(4)
subplot (1,2,1)
scatter3(av(1,:),av(2,:),av(3,:),50,av(4,:),'o','linewidth',6.0);
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktcav(N/mm^2)','Fontname', 'Times New Roman','Fontsize',20)
ylabel('Kteav(N/mm)','Fontname', 'Times New Roman','Fontsize',20)
zlabel('Krcav(N/mm^2)','Fontname', 'Times New Roman','Fontsize',20)
colorbar;
h = colorbar;%右侧颜色栏
set(get(h,'label'),'string','Kreav(N/mm)','Fontname', 'Times New Roman','Fontsize',20);%给右侧颜色栏命名
subplot(1,2,2)
scatter(av(1,:),av(3,:),50,'o','linewidth',6.0);
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktcav(N/mm^2)')
ylabel('Krcav(N/mm^2)')

CFCL=[CFCL1,CFCL2,CFCL3,CFCL4,CFCL5,CFCL6,CFCL7];
CFCS=[CFCS1,CFCS2,CFCS3,CFCS4,CFCS5,CFCS6,CFCS7,CFCS8];
figure(5)
subplot(1,2,1)
scatter(CFCL(1,:),CFCL(3,:),50,'.')
hold on;
scatter(AV(1,:),AV(3,:),50,'o','r','linewidth',6.0);
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
% text(AV(1,:)+100,AV(3,:),{'No.1槽铣','No.2槽铣','No.3槽铣','No.4侧铣','No.5侧铣','No.6侧铣','No.7半槽铣'},'Fontname', 'Times New Roman','FontSize',20);
text(AV(1,:)+100,AV(3,:),{'No.1 SL','No.2 SL','No.3 SL','No.4 FL','No.5 FL','No.6 FL','No.7 H-SL'},'Fontname', 'Times New Roman','FontSize',20);
subplot(1,2,2)
scatter(CFCS(1,:),CFCS(3,:),50,'.')
hold on;
scatter(av(1,:),av(3,:),50,'o','r','linewidth',6.0);
hold on;
set(gca,'Fontname', 'Times New Roman','FontSize',20);
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
% text(av(1,1:4)+100,av(3,1:4),{'No.1侧铣','No.2侧铣','No.3半槽铣','No.4半槽铣'},'Fontname', 'Times New Roman','FontSize',20);
% text(av(1,6:7)+100,av(3,6:7),{'No.6槽铣','No.7槽铣'},'Fontname', 'Times New Roman','FontSize',20);
% text(av(1,5)-20,av(3,5)-30,'No.5半槽铣','Fontname', 'Times New Roman','FontSize',20)
% text(av(1,8)-20,av(3,8)-30,'No.8槽铣','Fontname', 'Times New Roman','FontSize',20)
text(av(1,1:4)+100,av(3,1:4),{'No.1 FL','No.2 FL','No.3 H-SL','No.4 H-SL'},'Fontname', 'Times New Roman','FontSize',20);
text(av(1,6:7)+100,av(3,6:7),{'No.6 SL','No.7 SL'},'Fontname', 'Times New Roman','FontSize',20);
text(av(1,5)-20,av(3,5)-30,'No.5 H-SL','Fontname', 'Times New Roman','FontSize',20)
text(av(1,8)-20,av(3,8)-30,'No.8 SL','Fontname', 'Times New Roman','FontSize',20)
%%初步应用kmeans聚类方法
CFCL=CFCL(1:4,:)';%%取前四个参数，矩阵转置
%%10mm铣刀实验结果无初值，聚类为3类
[IdxL3,CtrsL3,SumDL3,DL3] = kmeans(CFCL,3);
%CFCL N*P的数据矩阵
%IdxL3 N*1的向量,存储的是每个点的聚类标号
%CtrsL3 K*P的矩阵,存储的是K个聚类质心位置
%SumDL3 1*K的和向量,存储的是类间所有点与该类质心点距离之和
%DL3 N*K的矩阵，存储的是每个点与所有质心的距离;
%%画出各个聚类的类别
figure(6)
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

%%10mm铣刀实验结果无初值，聚类为4类
[IdxL4,CtrsL4,SumDL4,DL4] = kmeans(CFCL,4);
%CFCL N*P的数据矩阵
%IdxL4 N*1的向量,存储的是每个点的聚类标号
%CtrsL4 K*P的矩阵,存储的是K个聚类质心位置
%SumDL4 1*K的和向量,存储的是类间所有点与该类质心点距离之和
%DL4 N*K的矩阵，存储的是每个点与所有质心的距离;
figure(7)
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
%%8mm铣刀实验结果无初值，聚类为3类
[IdxS3,CtrsS3,SumDS3,DS3] = kmeans(CFCS,3);
%CFCS N*P的数据矩阵
%IdxS3 N*1的向量,存储的是每个点的聚类标号
%CtrsS3 K*P的矩阵,存储的是K个聚类质心位置
%SumDS3 1*K的和向量,存储的是类间所有点与该类质心点距离之和
%DS3 N*K的矩阵，存储的是每个点与所有质心的距离;
%%画出各个聚类的类别
figure(8)
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

%%8mm铣刀实验结果无初值，聚类为4类
[IdxS4,CtrsS4,SumDS4,DS4] = kmeans(CFCS,4);
%CFCS N*P的数据矩阵
%IdxS4 N*1的向量,存储的是每个点的聚类标号
%CtrsS4 K*P的矩阵,存储的是K个聚类质心位置
%SumDS4 1*K的和向量,存储的是类间所有点与该类质心点距离之和
%DS4 N*K的矩阵，存储的是每个点与所有质心的距离;
figure(9)
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