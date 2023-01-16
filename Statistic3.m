%%以坐标变化的形式展示辨识结果
[CFCL1]=xlsread('CFCL.xlsx',1);
[CFCL2]=xlsread('CFCL.xlsx',2);
[CFCL3]=xlsread('CFCL.xlsx',3);
[CFCL4]=xlsread('CFCL.xlsx',4);
[CFCL5]=xlsread('CFCL.xlsx',5);
[CFCL6]=xlsread('CFCL.xlsx',6);
[CFCL7]=xlsread('CFCL.xlsx',7);

[CFCL11]=xlsread('CFCL1.xlsx',1);
[CFCL12]=xlsread('CFCL1.xlsx',2);
[CFCL13]=xlsread('CFCL1.xlsx',3);
[CFCL14]=xlsread('CFCL1.xlsx',4);
[CFCL15]=xlsread('CFCL1.xlsx',5);
[CFCL16]=xlsread('CFCL1.xlsx',6);
[CFCL17]=xlsread('CFCL1.xlsx',7);
% Ave(1,1)=mean(CFCL1(1,:));
% Ave(2,1)=mean(CFCL1(2,:));
% Ave(3,1)=mean(CFCL1(3,:));
% Ave(4,1)=mean(CFCL1(4,:));
% Ra(1,1)=max(sqrt(((CFCL1(1,:)-Ave(1,1))*(CFCL1(1,:)-Ave(1,1))')+(CFCL1(3,:)-Ave(3,1))*(CFCL1(3,:)-Ave(3,1))'));
% Ra(2,1)=max(abs(CFCL1(2,:)-Ave(2,1)));
% Ra(3,1)=max(abs(CFCL1(3,:)-Ave(3,1)));
% Ra(4,1)=max(abs(CFCL1(4,:)-Ave(4,1)));
figure(1)
subplot(2,4,1)
plot(CFCL1(1,:),CFCL1(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL11(1,:),CFCL11(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,4,5)
plot(CFCL1(2,:),CFCL1(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL11(2,:),CFCL11(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;

subplot(2,4,2)
plot(CFCL2(1,:),CFCL2(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL12(1,:),CFCL12(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,4,6)
plot(CFCL2(2,:),CFCL2(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL12(2,:),CFCL12(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;

subplot(2,4,3)
plot(CFCL3(1,:),CFCL3(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL13(1,:),CFCL13(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,4,7)
plot(CFCL3(2,:),CFCL3(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL13(2,:),CFCL13(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;

subplot(2,4,4)
plot(CFCL4(1,:),CFCL4(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL14(1,:),CFCL14(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,4,8)
plot(CFCL4(2,:),CFCL4(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL14(2,:),CFCL14(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;

figure(2)
subplot(2,3,1)
plot(CFCL5(1,:),CFCL5(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL15(1,:),CFCL15(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,3,4)
plot(CFCL5(2,:),CFCL5(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL15(2,:),CFCL15(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;

subplot(2,3,2)
plot(CFCL6(1,:),CFCL6(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL16(1,:),CFCL16(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,3,5)
plot(CFCL6(2,:),CFCL6(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL16(2,:),CFCL16(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;

subplot(2,3,3)
plot(CFCL7(1,:),CFCL7(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
plot(CFCL17(1,:),CFCL17(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,3,6)
plot(CFCL7(2,:),CFCL7(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL17(2,:),CFCL17(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;


figure(3)
subplot(2,3,1)
plot(CFCL1(1,:),CFCL1(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL2(1,:),CFCL2(3,:),'bo','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL3(1,:),CFCL3(3,:),'b^','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL11(1,:),CFCL11(3,:),'r+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL12(1,:),CFCL12(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL13(1,:),CFCL13(3,:),'r^','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,3,4)
plot(CFCL1(2,:),CFCL1(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL2(2,:),CFCL2(4,:),'bo','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL3(2,:),CFCL3(4,:),'b^','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL11(2,:),CFCL11(4,:),'r+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL12(2,:),CFCL12(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL13(2,:),CFCL13(4,:),'r^','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;

subplot(2,3,2)
plot(CFCL4(1,:),CFCL4(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL14(1,:),CFCL14(3,:),'r+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,3,5)
plot(CFCL4(2,:),CFCL4(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL14(2,:),CFCL14(4,:),'r+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;

subplot(2,3,3)
plot(CFCL5(1,:),CFCL5(3,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL6(1,:),CFCL6(3,:),'bo','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL7(1,:),CFCL7(3,:),'b^','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL15(1,:),CFCL15(3,:),'r+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL16(1,:),CFCL16(3,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL17(1,:),CFCL17(3,:),'r^','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
ylabel('Krc(N/mm^2)')
grid on;
subplot(2,3,6)
plot(CFCL5(2,:),CFCL5(4,:),'b+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL6(2,:),CFCL6(4,:),'bo','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL7(2,:),CFCL7(4,:),'b^','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL15(2,:),CFCL15(4,:),'r+','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL16(2,:),CFCL16(4,:),'ro','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
plot(CFCL17(2,:),CFCL17(4,:),'r^','Markersize',7,'Markerface','white','linewidth',1.0);
hold on;
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
ylabel('Kre(N/mm)')
grid on;