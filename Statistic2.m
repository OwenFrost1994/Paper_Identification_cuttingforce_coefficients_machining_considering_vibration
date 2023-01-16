%%统计图表绘制，对比辨识前后的正态分布拟合情况
% [CFCL1]=xlsread('CFCL1.xlsx',1);
% figure(1)
% subplot(1,4,1)
% x=sort(CFCL1(1,:));
% normplot(x);
% xlabel('Ktc(N/mm^2)')
% ylabel('概率')
% set(gca, 'FontName','Times New Roman','FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% grid on;
% 
% subplot(1,4,2)
% x=sort(CFCL1(2,:));
% normplot(x);
% xlabel('Kte(N/mm)')
% ylabel('概率')
% set(gca, 'FontName','Times New Roman','FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% grid on;
% 
% subplot(1,4,3)
% x=sort(CFCL1(3,:));
% normplot(x);
% xlabel('Krc(N/mm^2)')
% ylabel('概率')
% set(gca, 'FontName','Times New Roman','FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% grid on;
% 
% subplot(1,4,4)
% x=sort(CFCL1(4,:));
% normplot(x);
% xlabel('Kre(N/mm)')
% ylabel('概率')
% set(gca, 'FontName','Times New Roman','FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% grid on;

[CFCL]=xlsread('CFCS.xlsx',2);
[CFCL1]=xlsread('CFCS1.xlsx',2);
figure(1)
x=sort(CFCL(1,:));
x1=sort(CFCL1(1,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,1)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
grid on;
hold on;
legend('有异构因素','无异构因素')


x=sort(CFCL(2,:));
x1=sort(CFCL1(2,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,2)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
grid on;
hold on;
legend('有异构因素','无异构因素')

x=sort(CFCL(3,:));
x1=sort(CFCL1(3,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,3)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Krc(N/mm^2)')
grid on;
hold on;
legend('有异构因素','无异构因素')

x=sort(CFCL(4,:));
x1=sort(CFCL1(4,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,4)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kre(N/mm)')
grid on;
hold on;
legend('有异构因素','无异构因素')

[CFCL]=xlsread('CFCS.xlsx',5);
[CFCL1]=xlsread('CFCS1.xlsx',5);
figure(2)
x=sort(CFCL(1,:));
x1=sort(CFCL1(1,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,1)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
grid on;
hold on;
legend('有异构因素','无异构因素')


x=sort(CFCL(2,:));
x1=sort(CFCL1(2,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,2)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
grid on;
hold on;
legend('有异构因素','无异构因素')

x=sort(CFCL(3,:));
x1=sort(CFCL1(3,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,3)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Krc(N/mm^2)')
grid on;
hold on;
legend('有异构因素','无异构因素')

x=sort(CFCL(4,:));
x1=sort(CFCL1(4,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,4)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kre(N/mm)')
grid on;
hold on;
legend('有异构因素','无异构因素')

[CFCL]=xlsread('CFCS.xlsx',8);
[CFCL1]=xlsread('CFCS1.xlsx',8);
figure(3)
x=sort(CFCL(1,:));
x1=sort(CFCL1(1,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,1)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Ktc(N/mm^2)')
grid on;
hold on;
legend('有异构因素','无异构因素')


x=sort(CFCL(2,:));
x1=sort(CFCL1(2,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,2)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kte(N/mm)')
grid on;
hold on;
legend('有异构因素','无异构因素')

x=sort(CFCL(3,:));
x1=sort(CFCL1(3,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,3)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Krc(N/mm^2)')
grid on;
hold on;
legend('有异构因素','无异构因素')

x=sort(CFCL(4,:));
x1=sort(CFCL1(4,:));
[muhat,sigmahat,muci,sigmaci]=normfit(x,0.05);
y=pdf('norm',x,muhat,sigmahat);
[muhat1,sigmahat1,muci1,sigmaci1]=normfit(x1,0.05);
y1=pdf('norm',x1,muhat1,sigmahat1);
subplot(1,4,4)
plot(x,y,'b-','Markersize',7,'Markerface','white','linewidth',3.0);
hold on;
plot(x1,y1,'r-','Markersize',7,'Markerface','white','linewidth',3.0);
set(gca, 'FontName','Times New Roman','FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
xlabel('Kre(N/mm)')
grid on;
hold on;
legend('有异构因素','无异构因素')
% [CFC1]=xlsread('CFCL.xlsx',1);
% [CFC2]=xlsread('CFCL.xlsx',2);
% [CFC3]=xlsread('CFCL.xlsx',3);
% [CFC4]=xlsread('CFCL.xlsx',4);
% [CFC5]=xlsread('CFCL.xlsx',5);
% [CFC6]=xlsread('CFCL.xlsx',6);
% [CFC7]=xlsread('CFCL.xlsx',7);
% 
% x=sort(CFC1(1,:));
% [muhat(1,1),sigmahat(1,1),muci11,sigmaci]=normfit(x,0.05);
% x=sort(CFC1(2,:));
% [muhat(2,1),sigmahat(2,1),muci21,sigmaci]=normfit(x,0.05);
% x=sort(CFC1(3,:));
% [muhat(3,1),sigmahat(3,1),muci31,sigmaci]=normfit(x,0.05);
% x=sort(CFC1(4,:));
% [muhat(4,1),sigmahat(4,1),muci41,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC2(1,:));
% [muhat(1,2),sigmahat(1,2),muci12,sigmaci]=normfit(x,0.05);
% x=sort(CFC2(2,:));
% [muhat(2,2),sigmahat(2,2),muci22,sigmaci]=normfit(x,0.05);
% x=sort(CFC2(3,:));
% [muhat(3,2),sigmahat(3,2),muci32,sigmaci]=normfit(x,0.05);
% x=sort(CFC2(4,:));
% [muhat(4,2),sigmahat(4,2),muci42,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC3(1,:));
% [muhat(1,3),sigmahat(1,3),muci13,sigmaci]=normfit(x,0.05);
% x=sort(CFC3(2,:));
% [muhat(2,3),sigmahat(2,3),muci23,sigmaci]=normfit(x,0.05);
% x=sort(CFC3(3,:));
% [muhat(3,3),sigmahat(3,3),muci33,sigmaci]=normfit(x,0.05);
% x=sort(CFC3(4,:));
% [muhat(4,3),sigmahat(4,3),muci43,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC4(1,:));
% [muhat(1,4),sigmahat(1,4),muci14,sigmaci]=normfit(x,0.05);
% x=sort(CFC4(2,:));
% [muhat(2,4),sigmahat(2,4),muci24,sigmaci]=normfit(x,0.05);
% x=sort(CFC4(3,:));
% [muhat(3,4),sigmahat(3,4),muci34,sigmaci]=normfit(x,0.05);
% x=sort(CFC4(4,:));
% [muhat(4,4),sigmahat(4,4),muci44,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC5(1,:));
% [muhat(1,5),sigmahat(1,5),muci15,sigmaci]=normfit(x,0.05);
% x=sort(CFC5(2,:));
% [muhat(2,5),sigmahat(2,5),muci25,sigmaci]=normfit(x,0.05);
% x=sort(CFC5(3,:));
% [muhat(3,5),sigmahat(3,5),muci35,sigmaci]=normfit(x,0.05);
% x=sort(CFC5(4,:));
% [muhat(4,5),sigmahat(4,5),muci45,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC6(1,:));
% [muhat(1,6),sigmahat(1,6),muci16,sigmaci]=normfit(x,0.05);
% x=sort(CFC6(2,:));
% [muhat(2,6),sigmahat(2,6),muci26,sigmaci]=normfit(x,0.05);
% x=sort(CFC6(3,:));
% [muhat(3,6),sigmahat(3,6),muci36,sigmaci]=normfit(x,0.05);
% x=sort(CFC6(4,:));
% [muhat(4,6),sigmahat(4,6),muci46,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC7(1,:));
% [muhat(1,7),sigmahat(1,7),muci17,sigmaci]=normfit(x,0.05);
% x=sort(CFC7(2,:));
% [muhat(2,7),sigmahat(2,7),muci27,sigmaci]=normfit(x,0.05);
% x=sort(CFC7(3,:));
% [muhat(3,7),sigmahat(3,7),muci37,sigmaci]=normfit(x,0.05);
% x=sort(CFC7(4,:));
% [muhat(4,7),sigmahat(4,7),muci47,sigmaci]=normfit(x,0.05);

% [CFC1]=xlsread('CFCS.xlsx',1);
% [CFC2]=xlsread('CFCS.xlsx',2);
% [CFC3]=xlsread('CFCS.xlsx',3);
% [CFC4]=xlsread('CFCS.xlsx',4);
% [CFC5]=xlsread('CFCS.xlsx',5);
% [CFC6]=xlsread('CFCS.xlsx',6);
% [CFC7]=xlsread('CFCS.xlsx',7);
% [CFC8]=xlsread('CFCS.xlsx',8);
% 
% x=sort(CFC1(1,:));
% [muhat(1,1),sigmahat(1,1),muci11,sigmaci]=normfit(x,0.05);
% x=sort(CFC1(2,:));
% [muhat(2,1),sigmahat(2,1),muci21,sigmaci]=normfit(x,0.05);
% x=sort(CFC1(3,:));
% [muhat(3,1),sigmahat(3,1),muci31,sigmaci]=normfit(x,0.05);
% x=sort(CFC1(4,:));
% [muhat(4,1),sigmahat(4,1),muci41,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC2(1,:));
% [muhat(1,2),sigmahat(1,2),muci12,sigmaci]=normfit(x,0.05);
% x=sort(CFC2(2,:));
% [muhat(2,2),sigmahat(2,2),muci22,sigmaci]=normfit(x,0.05);
% x=sort(CFC2(3,:));
% [muhat(3,2),sigmahat(3,2),muci32,sigmaci]=normfit(x,0.05);
% x=sort(CFC2(4,:));
% [muhat(4,2),sigmahat(4,2),muci42,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC3(1,:));
% [muhat(1,3),sigmahat(1,3),muci13,sigmaci]=normfit(x,0.05);
% x=sort(CFC3(2,:));
% [muhat(2,3),sigmahat(2,3),muci23,sigmaci]=normfit(x,0.05);
% x=sort(CFC3(3,:));
% [muhat(3,3),sigmahat(3,3),muci33,sigmaci]=normfit(x,0.05);
% x=sort(CFC3(4,:));
% [muhat(4,3),sigmahat(4,3),muci43,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC4(1,:));
% [muhat(1,4),sigmahat(1,4),muci14,sigmaci]=normfit(x,0.05);
% x=sort(CFC4(2,:));
% [muhat(2,4),sigmahat(2,4),muci24,sigmaci]=normfit(x,0.05);
% x=sort(CFC4(3,:));
% [muhat(3,4),sigmahat(3,4),muci34,sigmaci]=normfit(x,0.05);
% x=sort(CFC4(4,:));
% [muhat(4,4),sigmahat(4,4),muci44,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC5(1,:));
% [muhat(1,5),sigmahat(1,5),muci15,sigmaci]=normfit(x,0.05);
% x=sort(CFC5(2,:));
% [muhat(2,5),sigmahat(2,5),muci25,sigmaci]=normfit(x,0.05);
% x=sort(CFC5(3,:));
% [muhat(3,5),sigmahat(3,5),muci35,sigmaci]=normfit(x,0.05);
% x=sort(CFC5(4,:));
% [muhat(4,5),sigmahat(4,5),muci45,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC6(1,:));
% [muhat(1,6),sigmahat(1,6),muci16,sigmaci]=normfit(x,0.05);
% x=sort(CFC6(2,:));
% [muhat(2,6),sigmahat(2,6),muci26,sigmaci]=normfit(x,0.05);
% x=sort(CFC6(3,:));
% [muhat(3,6),sigmahat(3,6),muci36,sigmaci]=normfit(x,0.05);
% x=sort(CFC6(4,:));
% [muhat(4,6),sigmahat(4,6),muci46,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC7(1,:));
% [muhat(1,7),sigmahat(1,7),muci17,sigmaci]=normfit(x,0.05);
% x=sort(CFC7(2,:));
% [muhat(2,7),sigmahat(2,7),muci27,sigmaci]=normfit(x,0.05);
% x=sort(CFC7(3,:));
% [muhat(3,7),sigmahat(3,7),muci37,sigmaci]=normfit(x,0.05);
% x=sort(CFC7(4,:));
% [muhat(4,7),sigmahat(4,7),muci47,sigmaci]=normfit(x,0.05);
% 
% x=sort(CFC8(1,:));
% [muhat(1,8),sigmahat(1,8),muci18,sigmaci]=normfit(x,0.05);
% x=sort(CFC8(2,:));
% [muhat(2,8),sigmahat(2,8),muci28,sigmaci]=normfit(x,0.05);
% x=sort(CFC8(3,:));
% [muhat(3,8),sigmahat(3,8),muci38,sigmaci]=normfit(x,0.05);
% x=sort(CFC8(4,:));
% [muhat(4,8),sigmahat(4,8),muci48,sigmaci]=normfit(x,0.05);