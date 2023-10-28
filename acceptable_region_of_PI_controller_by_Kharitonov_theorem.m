%-----------------------------------------------------------------%
%   acceptable region of PI controller by Kharitonov's theorem    %
%                   Author: Hamidreza Chavoshi                    %
%               Email: hr.chavoshi@email.kntu.ac.ir               %
%                Professor: Dr. Hamid Khaloozadeh                 %
%-----------------------------------------------------------------%
%%
clc
clear
close all
warning off;
%% calculate acceptable region of kp and ki of the PI controller by Kharitonov's theorem
count=0;
x=[];
y=[];
for kp=0:0.05:20
    for ki=0:0.01:5
        q4_min=(-0.01777*kp) + 1;q4_max=(-0.01311*kp)+1;
        q3_min=(-0.3199*kp -0.01777*ki +14.04);q3_max=(-0.236*kp -0.01311*ki +29.92);
        q2_min=(-1.066*kp -0.3199*ki +24.64);q2_max=(-0.7868*kp -0.236*ki +53.96);
        q1_min=(2.623*kp -1.066*ki -3.774);q1_max=(3.555*kp -0.7868*ki +1.105);
        q0_min=(2.623*ki);q0_max=(3.555*ki);
        k1=[q4_min q3_max q2_max q1_min q0_min];
        k2=[q4_max q3_min q2_min q1_max q0_max];
        k3=[q4_max q3_max q2_min q1_min q0_max];
        k4=[q4_min q3_min q2_max q1_max q0_min];
        if (all((real(roots(k1))<0)) && all(real(roots(k2))<0)...
                && all(real(roots(k3))<0) && all(real(roots(k4))<0))
            count=count+1;
            x=[x,kp];
            y=[y,ki];
        end
    end
end
%% Plotting
% gg=[0.4940 0.1840 0.5560]
figure
plot(x,y,'b','linewidth', 3)
k = boundary(x',y');
hold on;
plot(x(k),y(k),'b','linewidth', 3);
box on
grid on
xlabel('\fontname{Times New Roman}\it\fontsize{12}k_p')
ylabel('\fontname{Times New Roman}\it\fontsize{12}k_i')
title('\fontname{Times New Roman}\it\fontsize{12}Acceptable PI coefficients by Kharitonov’s theorem')
set(gcf, 'Position',  [100, 100, 450, 350])