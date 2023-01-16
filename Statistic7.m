%%时间序列分析之相关性分析
clear
clc
close all
%%读取数据
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

%%自相关性及互相关性判断
%%自相关与互相关计算10mm
[T1a,T1b]=xcorr(CFCL1(1:4,:)','unbiased');
[T2a,T2b]=xcorr(CFCL2(1:4,:)','unbiased');
[T3a,T3b]=xcorr(CFCL3(1:4,:)','unbiased');
[T4a,T4b]=xcorr(CFCL4(1:4,:)','unbiased');
[T5a,T5b]=xcorr(CFCL5(1:4,:)','unbiased');
[T6a,T6b]=xcorr(CFCL6(1:4,:)','unbiased');
[T7a,T7b]=xcorr(CFCL7(1:4,:)','unbiased');
% figure(1)
% subplot(4,1,1)
% plot(T1b,T1a(:,1))
% hold on;
% xlabel('Ktc-Ktc')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(4,1,2)
% plot(T1b,T1a(:,6))
% hold on;
% xlabel('Kte-Kte')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(4,1,3)
% plot(T1b,T1a(:,11))
% hold on;
% xlabel('Krc-Krc')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(4,1,4)
% plot(T1b,T1a(:,16))
% hold on;
% xlabel('Kre-Kre')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% 
% figure(2)
% subplot(3,4,1)
% plot(T1b,T1a(:,2))
% hold on;
% xlabel('Ktc-Kte')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(3,4,5)
% plot(T1b,T1a(:,3))
% hold on;
% xlabel('Ktc-Krc')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(3,4,9)
% plot(T1b,T1a(:,4))
% xlabel('Ktc-Kre')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% 
% subplot(3,4,2)
% plot(T1b,T1a(:,5))
% hold on;
% xlabel('Kte-Ktc')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(3,4,6)
% plot(T1b,T1a(:,7))
% hold on;
% xlabel('Kte-Krc')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(3,4,10)
% plot(T1b,T1a(:,8))
% xlabel('Kte-Kre')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% 
% subplot(3,4,3)
% plot(T1b,T1a(:,9))
% hold on;
% xlabel('Krc-Ktc')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(3,4,7)
% plot(T1b,T1a(:,10))
% hold on;
% xlabel('Krc-Kte')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(3,4,11)
% plot(T1b,T1a(:,12))
% xlabel('Krc-Kre')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% 
% subplot(3,4,4)
% plot(T1b,T1a(:,13))
% hold on;
% xlabel('Kre-Ktc')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(3,4,8)
% plot(T1b,T1a(:,14))
% hold on;
% xlabel('Kre-Kte')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);
% subplot(3,4,12)
% plot(T1b,T1a(:,15))
% xlabel('Kre-Krc')
% set(gca,'Fontname', 'Times New Roman','FontSize',20);

figure(3)
% subplot(4,4,1)
% plot(T1b,T1a(:,1),'-',T2b,T2a(:,1),':',T3b,T3a(:,1),'-.',T4b,T4a(:,1),'--',T5b,T5a(:,1),'o-',T6b,T6a(:,1),'x-',T7b,T7a(:,1),'d-')
subplot(4,4,1)
xlabel('Ktc-Ktc')
subplot(4,4,5)
xlabel('Ktc-Kte')
subplot(4,4,9)
xlabel('Ktc-Krc')
subplot(4,4,13)
xlabel('Ktc-Kre')

subplot(4,4,2)
xlabel('Kte-Ktc')
subplot(4,4,6)
xlabel('Kte-Kte')
subplot(4,4,10)
xlabel('Kte-Krc')
subplot(4,4,14)
xlabel('Kte-Kre')

subplot(4,4,3)
xlabel('Krc-Ktc')
subplot(4,4,7)
xlabel('Krc-Kte')
subplot(4,4,11)
xlabel('Krc-Krc')
subplot(4,4,15)
xlabel('Krc-Kre')

subplot(4,4,4)
xlabel('Kre-Ktc')
subplot(4,4,8)
xlabel('Kre-Kte')
subplot(4,4,12)
xlabel('Kre-Krc')
subplot(4,4,16)
xlabel('Kre-Kre')

for i=1:1:4
    j=4*(i-1)+1;
    subplot(4,4,i)
    plot(T1b,T1a(:,j),'-',T2b,T2a(:,j),':',T3b,T3a(:,j),'-.',T4b,T4a(:,j),'--',T5b,T5a(:,j),'-',T6b,T6a(:,j),':',T7b,T7a(:,j),'-.')
    hold on;
    grid on;
    set(gca,'Fontname', 'Times New Roman','FontSize',20);
    subplot(4,4,i+4)
    plot(T1b,T1a(:,j+1),'-',T2b,T2a(:,j+1),':',T3b,T3a(:,j+1),'-.',T4b,T4a(:,j+1),'--',T5b,T5a(:,j+1),'-',T6b,T6a(:,j+1),':',T7b,T7a(:,j+1),'-.')
    hold on;
    grid on;
    set(gca,'Fontname', 'Times New Roman','FontSize',20);
    subplot(4,4,i+8)
    plot(T1b,T1a(:,j+2),'-',T2b,T2a(:,j+2),':',T3b,T3a(:,j+2),'-.',T4b,T4a(:,j+2),'--',T5b,T5a(:,j+2),'-',T6b,T6a(:,j+2),':',T7b,T7a(:,j+2),'-.')
    hold on;
    grid on;
    set(gca,'Fontname', 'Times New Roman','FontSize',20);
    subplot(4,4,i+12)
    plot(T1b,T1a(:,j+3),'-',T2b,T2a(:,j+3),':',T3b,T3a(:,j+3),'-.',T4b,T4a(:,j+3),'--',T5b,T5a(:,j+3),'-',T6b,T6a(:,j+3),':',T7b,T7a(:,j+3),'-.')
    hold on;
    grid on;
    set(gca,'Fontname', 'Times New Roman','FontSize',20);
end
subplot(4,4,4)
legend('No.1','No.2','No.3','No.4','No.5','No.6','No.7')

%%自相关与互相关计算8mm
[t1a,t1b]=xcorr(CFCS1(1:4,:)','unbiased');
[t2a,t2b]=xcorr(CFCS2(1:4,:)','unbiased');
[t3a,t3b]=xcorr(CFCS3(1:4,:)','unbiased');
[t4a,t4b]=xcorr(CFCS4(1:4,:)','unbiased');
[t5a,t5b]=xcorr(CFCS5(1:4,:)','unbiased');
[t6a,t6b]=xcorr(CFCS6(1:4,:)','unbiased');
[t7a,t7b]=xcorr(CFCS7(1:4,:)','unbiased');
[t8a,t8b]=xcorr(CFCS8(1:4,:)','unbiased');

figure(4)
subplot(4,4,1)
xlabel('Ktc-Ktc')
subplot(4,4,5)
xlabel('Ktc-Kte')
subplot(4,4,9)
xlabel('Ktc-Krc')
subplot(4,4,13)
xlabel('Ktc-Kre')

subplot(4,4,2)
xlabel('Kte-Ktc')
subplot(4,4,6)
xlabel('Kte-Kte')
subplot(4,4,10)
xlabel('Kte-Krc')
subplot(4,4,14)
xlabel('Kte-Kre')

subplot(4,4,3)
xlabel('Krc-Ktc')
subplot(4,4,7)
xlabel('Krc-Kte')
subplot(4,4,11)
xlabel('Krc-Krc')
subplot(4,4,15)
xlabel('Krc-Kre')

subplot(4,4,4)
xlabel('Kre-Ktc')
subplot(4,4,8)
xlabel('Kre-Kte')
subplot(4,4,12)
xlabel('Kre-Krc')
subplot(4,4,16)
xlabel('Kre-Kre')

for i=1:1:4
    j=4*(i-1)+1;
    subplot(4,4,i)
    plot(t1b,t1a(:,j),'-',t2b,t2a(:,j),':',t3b,t3a(:,j),'-.',t4b,t4a(:,j),'--',t5b,t5a(:,j),'-',t6b,t6a(:,j),':',t7b,t7a(:,j),'-.',t8b,t8a(:,j),'--')
    hold on;
    grid on;
    set(gca,'Fontname', 'Times New Roman','FontSize',20);
    subplot(4,4,i+4)
    plot(t1b,t1a(:,j+1),'-',t2b,t2a(:,j+1),':',t3b,t3a(:,j+1),'-.',t4b,t4a(:,j+1),'--',t5b,t5a(:,j+1),'-',t6b,t6a(:,j+1),':',t7b,t7a(:,j+1),'-.',t8b,t8a(:,j+1),'--')
    hold on;
    grid on;
    set(gca,'Fontname', 'Times New Roman','FontSize',20);
    subplot(4,4,i+8)
    plot(t1b,t1a(:,j+2),'-',t2b,t2a(:,j+2),':',t3b,t3a(:,j+2),'-.',t4b,t4a(:,j+2),'--',t5b,t5a(:,j+2),'-',t6b,t6a(:,j+2),':',t7b,t7a(:,j+2),'-.',t8b,t8a(:,j+2),'--')
    hold on;
    grid on;
    set(gca,'Fontname', 'Times New Roman','FontSize',20);
    subplot(4,4,i+12)
    plot(t1b,t1a(:,j+3),'-',t2b,t2a(:,j+3),':',t3b,t3a(:,j+3),'-.',t4b,t4a(:,j+3),'--',t5b,t5a(:,j+3),'-',t6b,t6a(:,j+3),':',t7b,t7a(:,j+3),'-.',t8b,t8a(:,j+3),'--')
    hold on;
    grid on;
    set(gca,'Fontname', 'Times New Roman','FontSize',20);
end
subplot(4,4,4)
legend('No.1','No.2','No.3','No.4','No.5','No.6','No.7','No.8')