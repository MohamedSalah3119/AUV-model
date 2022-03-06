m=32.5;
rho=1000;
V=0.03255;
g=9.81;
zww=260;
samp_time = 10^-2;
sim_time = 50;
time = linspace(0,sim_time, (sim_time/samp_time)+1);
z = zeros(1,(sim_time/samp_time)+1);
z_dot = zeros(1,(sim_time/samp_time)+1);

%ft = zeros(1,sim_time,(sim_time/samp_time)+1);
ft = 0;

for i=1:sim_time/samp_time
    z_ddot = (m*g - ft - rho*V*g - zww*z_dot(i)*abs(z_dot(i)))/m;
    z_dot(i+1)= z_dot(i) + samp_time*z_ddot;
    z(i+1)= z(i) + samp_time*z_dot(i);
end
plot(time,z);