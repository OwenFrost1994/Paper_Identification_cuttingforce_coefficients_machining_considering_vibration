clear;
clc;
close all;
%%分析标准差等数值的变化
[AV]=xlsread('TJSJ1.xlsx',1);
[Av]=xlsread('TJSJ1.xlsx',2);
[SD]=xlsread('TJSJ1.xlsx',3);
[Sd]=xlsread('TJSJ1.xlsx',4);

avp=zeros(4,8);
sdp=zeros(4,8);
av=AV-Av;
sd=SD-Sd;
for i=1:1:4
    for j=1:1:8
        avp(i,j)=100*(AV(i,j)-Av(i,j))/Av(i,j);
        sdp(i,j)=100*(SD(i,j)-Sd(i,j))/Sd(i,j);
    end
end