clear
clc
%%看均值和方差的变化
[CFCL1]=xlsread('CFCL.xlsx',1);
[CFCL2]=xlsread('CFCL.xlsx',2);
[CFCL3]=xlsread('CFCL.xlsx',3);
[CFCL4]=xlsread('CFCL.xlsx',4);
[CFCL5]=xlsread('CFCL.xlsx',5);
[CFCL6]=xlsread('CFCL.xlsx',6);
[CFCL7]=xlsread('CFCL.xlsx',7);
[M,N1]=size(CFCL1);
zeros(1,N1);
Av1=zeros(M,N1);
SD1=zeros(M,N1);
for n=1:1:N1
    Av1(:,n)=mean(CFCL1(:,1:n),2);
    SD1(1,n)=std(CFCL1(1,1:n));
    SD1(2,n)=std(CFCL1(2,1:n));
    SD1(3,n)=std(CFCL1(3,1:n));
    SD1(4,n)=std(CFCL1(4,1:n));
    SD1(5,n)=std(CFCL1(5,1:n));
    SD1(6,n)=std(CFCL1(6,1:n));
end

[M,N2]=size(CFCL2);
zeros(1,N2);
Av2=zeros(M,N2);
SD2=zeros(M,N2);
for n=1:1:N2
    Av2(:,n)=mean(CFCL2(:,1:n),2);
    SD2(1,n)=std(CFCL2(1,1:n));
    SD2(2,n)=std(CFCL2(2,1:n));
    SD2(3,n)=std(CFCL2(3,1:n));
    SD2(4,n)=std(CFCL2(4,1:n));
    SD2(5,n)=std(CFCL2(5,1:n));
    SD2(6,n)=std(CFCL2(6,1:n));
end

[M,N3]=size(CFCL3);
zeros(1,N3);
Av3=zeros(M,N3);
SD3=zeros(M,N3);
for n=1:1:N3
    Av3(:,n)=mean(CFCL3(:,1:n),2);
    SD3(1,n)=std(CFCL3(1,1:n));
    SD3(2,n)=std(CFCL3(2,1:n));
    SD3(3,n)=std(CFCL3(3,1:n));
    SD3(4,n)=std(CFCL3(4,1:n));
    SD3(5,n)=std(CFCL3(5,1:n));
    SD3(6,n)=std(CFCL3(6,1:n));
end

[M,N4]=size(CFCL4);
zeros(1,N4);
Av4=zeros(M,N4);
SD4=zeros(M,N4);
for n=1:1:N4
    Av4(:,n)=mean(CFCL4(:,1:n),2);
    SD4(1,n)=std(CFCL4(1,1:n));
    SD4(2,n)=std(CFCL4(2,1:n));
    SD4(3,n)=std(CFCL4(3,1:n));
    SD4(4,n)=std(CFCL4(4,1:n));
    SD4(5,n)=std(CFCL4(5,1:n));
    SD4(6,n)=std(CFCL4(6,1:n));
end

[M,N5]=size(CFCL5);
zeros(1,N5);
Av5=zeros(M,N5);
SD5=zeros(M,N5);
for n=1:1:N5
    Av5(:,n)=mean(CFCL5(:,1:n),2);
    SD5(1,n)=std(CFCL5(1,1:n));
    SD5(2,n)=std(CFCL5(2,1:n));
    SD5(3,n)=std(CFCL5(3,1:n));
    SD5(4,n)=std(CFCL5(4,1:n));
    SD5(5,n)=std(CFCL5(5,1:n));
    SD5(6,n)=std(CFCL5(6,1:n));
end

[M,N6]=size(CFCL6);
zeros(1,N6);
Av6=zeros(M,N6);
SD6=zeros(M,N6);
for n=1:1:N6
    Av6(:,n)=mean(CFCL6(:,1:n),2);
    SD6(1,n)=std(CFCL6(1,1:n));
    SD6(2,n)=std(CFCL6(2,1:n));
    SD6(3,n)=std(CFCL6(3,1:n));
    SD6(4,n)=std(CFCL6(4,1:n));
    SD6(5,n)=std(CFCL6(5,1:n));
    SD6(6,n)=std(CFCL6(6,1:n));
end

[M,N7]=size(CFCL7);
zeros(1,N7);
Av7=zeros(M,N7);
SD7=zeros(M,N7);
for n=1:1:N7
    Av7(:,n)=mean(CFCL7(:,1:n),2);
    SD7(1,n)=std(CFCL7(1,1:n));
    SD7(2,n)=std(CFCL7(2,1:n));
    SD7(3,n)=std(CFCL7(3,1:n));
    SD7(4,n)=std(CFCL7(4,1:n));
    SD7(5,n)=std(CFCL7(5,1:n));
    SD7(6,n)=std(CFCL7(6,1:n));
end

% figure(1)
% subplot(2,2,1)
% plot(1:1:N1,Av1(1,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N2,Av2(1,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N3,Av3(1,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N4,Av4(1,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N5,Av5(1,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N6,Av6(1,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N7,Av7(1,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% xlabel('Circle')
% ylabel('Ktc(N/mm^2)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')
% subplot(2,2,2)
% plot(1:1:N1,Av1(3,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N2,Av2(3,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N3,Av3(3,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N4,Av4(3,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N5,Av5(3,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N6,Av6(3,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N7,Av7(3,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% xlabel('Circle')
% ylabel('Krc(N/mm^2)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')
% subplot(2,2,3)
% plot(1:1:N1,Av1(2,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N2,Av2(2,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N3,Av3(2,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N4,Av4(2,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N5,Av5(2,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N6,Av6(2,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N7,Av7(2,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% xlabel('Circle')
% ylabel('Kte(N/mm)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')
% subplot(2,2,4)
% plot(1:1:N1,Av1(4,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N2,Av2(4,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N3,Av3(4,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N4,Av4(4,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N5,Av5(4,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N6,Av6(4,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N7,Av7(4,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% xlabel('Circle')
% ylabel('Kre(N/mm)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')
% 
% figure(2)
% subplot(2,2,1)
% plot(1:1:N1,SD1(1,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N2,SD2(1,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N3,SD3(1,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N4,SD4(1,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N5,SD5(1,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N6,SD6(1,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N7,SD7(1,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% xlabel('Circle')
% ylabel('Ktc(N/mm^2)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')
% subplot(2,2,2)
% plot(1:1:N1,SD1(3,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N2,SD2(3,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N3,SD3(3,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N4,SD4(3,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N5,SD5(3,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N6,SD6(3,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N7,SD7(3,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% xlabel('Circle')
% ylabel('Krc(N/mm^2)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')
% subplot(2,2,3)
% plot(1:1:N1,SD1(2,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N2,SD2(2,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N3,SD3(2,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N4,SD4(2,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N5,SD5(2,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N6,SD6(2,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N7,SD7(2,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% xlabel('Circle')
% ylabel('Kte(N/mm)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')
% subplot(2,2,4)
% plot(1:1:N1,SD1(4,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N2,SD2(4,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N3,SD3(4,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N4,SD4(4,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N5,SD5(4,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N6,SD6(4,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% plot(1:1:N7,SD7(4,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
% hold on;
% xlabel('Circle')
% ylabel('Kre(N/mm)')
% set(gca, 'FontSize', 20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(get(gca,'YLabel'),'Fontsize',20)
% legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')
for n=1:1:N1-1
    normD1(n)=abs(norm(Av1(:,n+1),2)-norm(Av1(:,n),2));
end
for n=1:1:N2-1
    normD2(n)=abs(norm(Av2(:,n+1),2)-norm(Av2(:,n),2));
end
for n=1:1:N3-1
    normD3(n)=abs(norm(Av3(:,n+1),2)-norm(Av3(:,n),2));
end
for n=1:1:N4-1
    normD4(n)=abs(norm(Av4(:,n+1),2)-norm(Av4(:,n),2));
end
for n=1:1:N5-1
    normD5(n)=abs(norm(Av5(:,n+1),2)-norm(Av5(:,n),2));
end
for n=1:1:N6-1
    normD6(n)=abs(norm(Av6(:,n+1),2)-norm(Av6(:,n),2));
end
for n=1:1:N7-1
    normD7(n)=abs(norm(Av7(:,n+1),2)-norm(Av7(:,n),2));
end

figure(3)
plot(1:1:N1-1,normD1(1,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2-1,normD2(1,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3-1,normD3(1,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4-1,normD4(1,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5-1,normD5(1,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6-1,normD6(1,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7-1,normD7(1,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('n')
ylabel('|||Av_k_+_1||-||Av_k|||')
set(gca, 'FontSize',20,'FontName','Times New Roman')
set(get(gca,'XLabel'),'Fontsize',20,'FontName','Times New Roman')
set(get(gca,'YLabel'),'Fontsize',20,'FontName','Times New Roman')
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7')

[CFCS1]=xlsread('CFCS.xlsx',1);
[CFCS2]=xlsread('CFCS.xlsx',2);
[CFCS3]=xlsread('CFCS.xlsx',3);
[CFCS4]=xlsread('CFCS.xlsx',4);
[CFCS5]=xlsread('CFCS.xlsx',5);
[CFCS6]=xlsread('CFCS.xlsx',6);
[CFCS7]=xlsread('CFCS.xlsx',7);
[CFCS8]=xlsread('CFCS.xlsx',8);

[M,N1]=size(CFCS1);
zeros(1,N1);
Av1=zeros(M,N1);
SD1=zeros(M,N1);
for n=1:1:N1
    Av1(:,n)=mean(CFCS1(:,1:n),2);
    SD1(1,n)=std(CFCS1(1,1:n));
    SD1(2,n)=std(CFCS1(2,1:n));
    SD1(3,n)=std(CFCS1(3,1:n));
    SD1(4,n)=std(CFCS1(4,1:n));
    SD1(5,n)=std(CFCS1(5,1:n));
    SD1(6,n)=std(CFCS1(6,1:n));
end

[M,N2]=size(CFCS2);
zeros(1,N2);
Av2=zeros(M,N2);
SD2=zeros(M,N2);
for n=1:1:N2
    Av2(:,n)=mean(CFCS2(:,1:n),2);
    SD2(1,n)=std(CFCS2(1,1:n));
    SD2(2,n)=std(CFCS2(2,1:n));
    SD2(3,n)=std(CFCS2(3,1:n));
    SD2(4,n)=std(CFCS2(4,1:n));
    SD2(5,n)=std(CFCS2(5,1:n));
    SD2(6,n)=std(CFCS2(6,1:n));
end

[M,N3]=size(CFCS3);
zeros(1,N3);
Av3=zeros(M,N3);
SD3=zeros(M,N3);
for n=1:1:N3
    Av3(:,n)=mean(CFCS3(:,1:n),2);
    SD3(1,n)=std(CFCS3(1,1:n));
    SD3(2,n)=std(CFCS3(2,1:n));
    SD3(3,n)=std(CFCS3(3,1:n));
    SD3(4,n)=std(CFCS3(4,1:n));
    SD3(5,n)=std(CFCS3(5,1:n));
    SD3(6,n)=std(CFCS3(6,1:n));
end

[M,N4]=size(CFCS4);
zeros(1,N4);
Av4=zeros(M,N4);
SD4=zeros(M,N4);
for n=1:1:N4
    Av4(:,n)=mean(CFCS4(:,1:n),2);
    SD4(1,n)=std(CFCS4(1,1:n));
    SD4(2,n)=std(CFCS4(2,1:n));
    SD4(3,n)=std(CFCS4(3,1:n));
    SD4(4,n)=std(CFCS4(4,1:n));
    SD4(5,n)=std(CFCS4(5,1:n));
    SD4(6,n)=std(CFCS4(6,1:n));
end

[M,N5]=size(CFCS5);
zeros(1,N5);
Av5=zeros(M,N5);
SD5=zeros(M,N5);
for n=1:1:N5
    Av5(:,n)=mean(CFCS5(:,1:n),2);
    SD5(1,n)=std(CFCS5(1,1:n));
    SD5(2,n)=std(CFCS5(2,1:n));
    SD5(3,n)=std(CFCS5(3,1:n));
    SD5(4,n)=std(CFCS5(4,1:n));
    SD5(5,n)=std(CFCS5(5,1:n));
    SD5(6,n)=std(CFCS5(6,1:n));
end

[M,N6]=size(CFCS6);
zeros(1,N6);
Av6=zeros(M,N6);
SD6=zeros(M,N6);
for n=1:1:N6
    Av6(:,n)=mean(CFCS6(:,1:n),2);
    SD6(1,n)=std(CFCS6(1,1:n));
    SD6(2,n)=std(CFCS6(2,1:n));
    SD6(3,n)=std(CFCS6(3,1:n));
    SD6(4,n)=std(CFCS6(4,1:n));
    SD6(5,n)=std(CFCS6(5,1:n));
    SD6(6,n)=std(CFCS6(6,1:n));
end

[M,N7]=size(CFCS7);
zeros(1,N7);
Av7=zeros(M,N7);
SD7=zeros(M,N7);
for n=1:1:N7
    Av7(:,n)=mean(CFCS7(:,1:n),2);
    SD7(1,n)=std(CFCS7(1,1:n));
    SD7(2,n)=std(CFCS7(2,1:n));
    SD7(3,n)=std(CFCS7(3,1:n));
    SD7(4,n)=std(CFCS7(4,1:n));
    SD7(5,n)=std(CFCS7(5,1:n));
    SD7(6,n)=std(CFCS7(6,1:n));
end

[M,N8]=size(CFCS8);
zeros(1,N8);
Av8=zeros(M,N8);
SD8=zeros(M,N8);
for n=1:1:N8
    Av8(:,n)=mean(CFCS8(:,1:n),2);
    SD8(1,n)=std(CFCS8(1,1:n));
    SD8(2,n)=std(CFCS8(2,1:n));
    SD8(3,n)=std(CFCS8(3,1:n));
    SD8(4,n)=std(CFCS8(4,1:n));
    SD8(5,n)=std(CFCS8(5,1:n));
    SD8(6,n)=std(CFCS8(6,1:n));
end

figure(5)
subplot(2,2,1)
plot(1:1:N1,Av1(1,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2,Av2(1,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3,Av3(1,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4,Av4(1,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5,Av5(1,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6,Av6(1,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7,Av7(1,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8,Av8(1,:),'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('Circle')
ylabel('Ktc(N/mm^2)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')
subplot(2,2,2)
plot(1:1:N1,Av1(3,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2,Av2(3,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3,Av3(3,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4,Av4(3,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5,Av5(3,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6,Av6(3,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7,Av7(3,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8,Av8(3,:),'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('Circle')
ylabel('Krc(N/mm^2)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')
subplot(2,2,3)
plot(1:1:N1,Av1(2,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2,Av2(2,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3,Av3(2,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4,Av4(2,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5,Av5(2,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6,Av6(2,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7,Av7(2,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8,Av8(2,:),'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('Circle')
ylabel('Kte(N/mm)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')
subplot(2,2,4)
plot(1:1:N1,Av1(4,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2,Av2(4,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3,Av3(4,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4,Av4(4,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5,Av5(4,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6,Av6(4,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7,Av7(4,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8,Av8(4,:),'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('Circle')
ylabel('Kre(N/mm)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')

figure(6)
subplot(2,2,1)
plot(1:1:N1,SD1(1,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2,SD2(1,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3,SD3(1,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4,SD4(1,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5,SD5(1,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6,SD6(1,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7,SD7(1,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8,SD8(1,:),'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('Circle')
ylabel('Ktc(N/mm^2)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')
subplot(2,2,2)
plot(1:1:N1,SD1(3,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2,SD2(3,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3,SD3(3,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4,SD4(3,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5,SD5(3,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6,SD6(3,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7,SD7(3,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8,SD8(3,:),'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('Circle')
ylabel('Krc(N/mm^2)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')
subplot(2,2,3)
plot(1:1:N1,SD1(2,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2,SD2(2,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3,SD3(2,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4,SD4(2,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5,SD5(2,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6,SD6(2,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7,SD7(2,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8,SD8(2,:),'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('Circle')
ylabel('Kte(N/mm)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')
subplot(2,2,4)
plot(1:1:N1,SD1(4,:),'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2,SD2(4,:),'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3,SD3(4,:),'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4,SD4(4,:),'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5,SD5(4,:),'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6,SD6(4,:),'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7,SD7(4,:),'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8,SD8(4,:),'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('Circle')
ylabel('Kre(N/mm)')
set(gca, 'FontSize', 20)
set(get(gca,'XLabel'),'Fontsize',20)
set(get(gca,'YLabel'),'Fontsize',20)
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')

for n=1:1:N1-1
    normd1(n)=abs(norm(Av1(:,n+1),2)-norm(Av1(:,n),2));
end
for n=1:1:N2-1
    normd2(n)=abs(norm(Av2(:,n+1),2)-norm(Av2(:,n),2));
end
for n=1:1:N3-1
    normd3(n)=abs(norm(Av3(:,n+1),2)-norm(Av3(:,n),2));
end
for n=1:1:N4-1
    normd4(n)=abs(norm(Av4(:,n+1),2)-norm(Av4(:,n),2));
end
for n=1:1:N5-1
    normd5(n)=abs(norm(Av5(:,n+1),2)-norm(Av5(:,n),2));
end
for n=1:1:N6-1
    normd6(n)=abs(norm(Av6(:,n+1),2)-norm(Av6(:,n),2));
end
for n=1:1:N7-1
    normd7(n)=abs(norm(Av7(:,n+1),2)-norm(Av7(:,n),2));
end
for n=1:1:N8-1
    normd8(n)=abs(norm(Av8(:,n+1),2)-norm(Av8(:,n),2));
end

figure(7)
plot(1:1:N1-1,normd1,'ro-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N2-1,normd2,'r+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N3-1,normd3,'r^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N4-1,normd4,'r*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N5-1,normd5,'bo-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N6-1,normd6,'b+-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N7-1,normd7,'b^-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
plot(1:1:N8-1,normd8,'b*-','Markersize',7,'Markerface','white','linewidth',2.0)
hold on;
xlabel('n')
ylabel('|||Av_k_+_1||-||Av_k|||')
set(gca, 'FontSize',20,'FontName','Times New Roman')
set(get(gca,'XLabel'),'Fontsize',20,'FontName','Times New Roman')
set(get(gca,'YLabel'),'Fontsize',20,'FontName','Times New Roman')
legend('Test No.1','Test No.2','Test No.3','Test No.4','Test No.5','Test No.6','Test No.7','Test No.8')