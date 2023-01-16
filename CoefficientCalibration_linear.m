% p_4_7_1_1.m
% Copyright
% University of Florida
% T. Schmitz
% June 1, 2008

clear all
close all
clc

% Simulation specifications
b = 0.5;                        % 轴向深度, mm
FT = [0.089 0.133 0.178 0.222 0.267 0.311 0.356 0.400];  % feed per tooth values, mm/tooth每齿进给
phis = 0;                       % cut start angle, deg
phie = 180;                     % cut exit angle, deg
gamma = 30;                     % helix angle, deg
d = 10;                         % cutter diameter, mm
Nt = 1;                         % number of teeth, int
omega = 5000;                   % spindle speed, rpm
steps = 2^9;                    % steps for one cutter revolution, int 一周的离散步数
dt = 60/(steps*omega);          % time step, s 时间步
dphi = 360/steps;               % angular step, deg角度增量
if gamma == 0                   % straight teeth
    db = b;                     % discretized axial depth, mm
else                            % nonzero helix angle
    db = d*(dphi*pi/180)/2/tan(gamma*pi/180);
end
steps_axial = round(b/db);      % number of steps along tool axis
tooth_angles = 0:360/Nt:(360-360/Nt);  % angles of Nt cutter teeth starting from zero, deg 每个刀齿对应的角度

mean_Fx = zeros(1, length(FT)); %x向平均切削力
mean_Fy = zeros(1, length(FT));
mean_Fz = zeros(1, length(FT));

% for loop = 1:length(FT)
%     ft = FT(loop);
% 
%     % Initialize vectors
%     teeth = round(tooth_angles/dphi) + 1;
%     phi = linspace(0, (steps-1)*dphi, steps);
%     Force_x = zeros(1, steps);
%     Force_y = zeros(1, steps);
%     Force_z = zeros(1, steps);
% 
%     for cnt1 = 1:10*steps           % 时间步, s
% %         for cnt2 = 1:Nt
% %             teeth(cnt2) = teeth(cnt2) + 1;      % index teeth one position (rotate cutter by dphi)
% %             if teeth(cnt2) > steps
% %                 teeth(cnt2) = 1;
% %             end
% %         end
%         
%         %Fx,Fy,Fz.某时刻刀具上受到的所有力
%         Force_x(cnt1) = Fx;
%         Force_y(cnt1) = Fy;
%         Force_z(cnt1) = Fz;
%         t(cnt1) = (cnt1-1)*dt;
%         tooth_angle(cnt1) = (cnt1-1)*dphi;
%     end
%     time = tooth_angle/omega*60/360;
% 
% %     Force_x = Force_x + max(Force_x)*0.1*randn(1, length(Force_x));
% %     Force_y = Force_y + max(Force_y)*0.1*randn(1, length(Force_y));
% %     Force_z = Force_z + max(Force_z)*0.1*randn(1, length(Force_z));
% 
% %每种进给下的平均力
%     mean_Fx(loop) = mean(Force_x);
%     mean_Fy(loop) = mean(Force_y);
%     mean_Fz(loop) = mean(Force_z);
% end

Force_x1=load('FX400.txt');
Force_y1=load('FY400.txt');
Force_z1=load('FZ400.txt');
mean_Fx(1) = mean(Force_x1);
mean_Fy(1) = mean(Force_y1);
mean_Fz(1) = mean(Force_z1);

Force_x2=load('FX600.txt');
Force_y2=load('FY600.txt');
Force_z2=load('FZ600.txt');
mean_Fx(2) = mean(Force_x2);
mean_Fy(2) = mean(Force_y2);
mean_Fz(2) = mean(Force_z2);

Force_x3=load('FX800.txt');
Force_y3=load('FY800.txt');
Force_z3=load('FZ800.txt');
mean_Fx(3) = mean(Force_x3);
mean_Fy(3) = mean(Force_y3);
mean_Fz(3) = mean(Force_z3);

Force_x4=load('FX1000.txt');
Force_y4=load('FY1000.txt');
Force_z4=load('FZ1000.txt');
mean_Fx(4) = mean(Force_x4);
mean_Fy(4) = mean(Force_y4);
mean_Fz(4) = mean(Force_z4);

Force_x5=load('FX1200.txt');
Force_y5=load('FY1200.txt');
Force_z5=load('FZ1200.txt');
mean_Fx(5) = mean(Force_x5);
mean_Fy(5) = mean(Force_y5);
mean_Fz(5) = mean(Force_z5);

Force_x6=load('FX1400.txt');
Force_y6=load('FY1400.txt');
Force_z6=load('FZ1400.txt');
mean_Fx(6) = mean(Force_x6);
mean_Fy(6) = mean(Force_y6);
mean_Fz(6) = mean(Force_z6);

Force_x7=load('FX1600.txt');
Force_y7=load('FY1600.txt');
Force_z7=load('FZ1600.txt');
mean_Fx(7) = mean(Force_x7);
mean_Fy(7) = mean(Force_y7);
mean_Fz(7) = mean(Force_z7);

Force_x8=load('FX1800.txt');
Force_y8=load('FY1800.txt');
Force_z8=load('FZ1800.txt');
mean_Fx(8) = mean(Force_x8);
mean_Fy(8) = mean(Force_y8);
mean_Fz(8) = mean(Force_z8);

% figure(1)
% plot(tooth_angle, Force_x, 'r:', tooth_angle, Force_y, 'b--', tooth_angle, Force_z, 'k')
% axis([0 360 -600 1200])
% set(gca,'FontSize', 14)
% xlabel('\phi (deg)')
% ylabel('Force (N)')
% legend('F_x', 'F_y', 'F_z')

%==========================================================================
%===============================线性回归===================================
%==========================================================================
n = length(FT);
a1x = (n*sum(FT.*mean_Fx) - sum(FT)*sum(mean_Fx))/(n*sum(FT.^2) - (sum(FT))^2);
a0x = mean(mean_Fx) - a1x*mean(FT);
kn_fit = 4*a1x/(Nt*b)
kne_fit = pi*a0x/(Nt*b)

a1y = (n*sum(FT.*mean_Fy) - sum(FT)*sum(mean_Fy))/(n*sum(FT.^2) - (sum(FT))^2);
a0y = mean(mean_Fy) - a1y*mean(FT);
kt_fit = 4*a1y/(Nt*b)
kte_fit = pi*a0y/(Nt*b)

a1z = (n*sum(FT.*mean_Fz) - sum(FT)*sum(mean_Fz))/(n*sum(FT.^2) - (sum(FT))^2);
a0z = mean(mean_Fz) - a1z*mean(FT);
ka_fit = -pi*a1z/(Nt*b)
kae_fit = -2*a0z/(Nt*b)

figure(3)
plot(FT, -mean_Fx, 'ro', FT, mean_Fy, 'bs', FT, mean_Fz, 'k^')       %原始数据中x,y已互换

hold on
axis([0.05 0.45 -40 80])
set(gca,'FontSize', 14)
xlabel('f_t (mm/tooth)')
ylabel('Mean Force (N)')
legend('x', 'y', 'z')
% best fit lines
plot(FT, -(a0x+a1x*FT), 'r:', FT, a0y+a1y*FT, 'b--', FT, a0z+a1z*FT, 'k')

% coefficients of determination
rx2 = (sum((mean_Fx - mean(mean_Fx)).^2) - sum((mean_Fx - a0x - a1x*FT).^2))/(sum((mean_Fx - mean(mean_Fx)).^2))
ry2 = (sum((mean_Fy - mean(mean_Fy)).^2) - sum((mean_Fy - a0y - a1y*FT).^2))/(sum((mean_Fy - mean(mean_Fy)).^2))
rz2 = (sum((mean_Fz - mean(mean_Fz)).^2) - sum((mean_Fz - a0z - a1z*FT).^2))/(sum((mean_Fz - mean(mean_Fz)).^2))
