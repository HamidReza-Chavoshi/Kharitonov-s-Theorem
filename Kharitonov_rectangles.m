%-----------------------------------------------------------------%
%                 Plotting Kharitonov rectangles                  %
%                   Author: Hamidreza Chavoshi                    %
%               Email: hr.chavoshi@email.kntu.ac.ir               %
%                Professor: Dr. Hamid Khaloozadeh                 %
%-----------------------------------------------------------------%
%%
clc
clear
close all
warning off;
%% Kharitonov rectangles
hold on
kp=6.5;
ki=0.3;
for w=0:0.05:2.05
    q4_min=(-0.01777*kp) + 1;q4_max=(-0.01311*kp)+1;
    q3_min=(-0.3199*kp -0.01777*ki +14.04);q3_max=(-0.236*kp -0.01311*ki +29.92);
    q2_min=(-1.066*kp -0.3199*ki +24.64);q2_max=(-0.7868*kp -0.236*ki +53.96);
    q1_min=(2.623*kp -1.066*ki -3.774);q1_max=(3.555*kp -0.7868*ki +1.105);
    q0_min=(2.623*ki);q0_max=(3.555*ki);
    K_1=q0_min+q1_min*(j*w)+q2_max*(j*w)^2+q3_max*(j*w)^3+q4_min*(j*w)^4;
    k_2=q0_max+q1_max*(j*w)+q2_min*(j*w)^2+q3_min*(j*w)^3+q4_max*(j*w)^4;
    k_3=q0_max+q1_min*(j*w)+q2_min*(j*w)^2+q3_max*(j*w)^3+q4_max*(j*w)^4;
    k_4=q0_min+q1_max*(j*w)+q2_max*(j*w)^2+q3_min*(j*w)^3+q4_min*(j*w)^4;
    x=real([K_1,k_3,k_2,k_4,K_1]);
    y=imag([K_1,k_3,k_2,k_4,K_1]);
    plot(x,y,'b','linewidth', 0.75)
end
%% Plotting
axis([-200 200 -230 20])
ax=gca;
line(ax.XLim,[0 0],'color', [0 0 0],'linewidth', 0.7)
line([0 0],ax.YLim,'color', [0 0 0],'linewidth', 0.7)
grid on
box on
plot(0,0,'r*','linewidth', 1)
title('\fontname{Times New Roman}\it\fontsize{12}Kharitonov rectangles')
ylabel('\fontname{Times New Roman}\it\fontsize{12}Imaginary Axis')
xlabel('\fontname{Times New Roman}\it\fontsize{12}Real Axis')
% zp = BaseZoom();
% zp.plot;
