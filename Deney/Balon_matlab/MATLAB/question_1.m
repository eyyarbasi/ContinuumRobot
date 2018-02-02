function [g]=question_1(Q_ini1,Q_via1,Q_goal1,Q_ini2,Q_via2,Q_goal2,xini,yini,xvia)
%question_1(73,37.6326,36.8699,90,132,16,-10,55,15,35,55,50,4)
%the test inputs /
t=tf/2; %it is assumed that from the start and to the via point
%it takes two seconds and after via to the goal point it takes 2 seconds
%the cont acceleration case is taken from the book ch7 that was given
%as reference
%two cubic polynomials to have continuous velocity and acceleration for
%joint space
%the 1st Joint
a10_1=Q_ini1;
a11_1=0;
a12_1=(12*Q_via1-3*Q_goal1-9*Q_ini1)/(4*t^2);
a13_1=(-8*Q_via1+3*Q_goal1+5*Q_ini1)/(4*t^3);
a20_1=Q_via1;
a21_1=(3*Q_goal1-3*Q_ini1)/(4*t);
a22_1=(-12*Q_via1+6*Q_goal1+6*Q_ini1)/(4*t^2);
a23_1=(8*Q_via1-5*Q_goal1-3*Q_ini1)/(4*t^3);
%joint2
a10_2=Q_ini2;
a11_2=0;
a12_2=(12*Q_via2-3*Q_goal2-9*Q_ini2)/(4*t^2);
a13_2=(-8*Q_via2+3*Q_goal2+5*Q_ini2)/(4*t^3);
a20_2=Q_via2;
a21_2=(3*Q_goal2-3*Q_ini2)/(4*t);
a22_2=(-12*Q_via2+6*Q_goal2+6*Q_ini2)/(4*t^2);
a23_2=(8*Q_via2-5*Q_goal2-3*Q_ini2)/(4*t^3);
figure(1)
for time=0:0.1:tf/2 %segment is 0.1 % 0.1 increment
% for the 1st joint
Q1_1_p=a10_1+a11_1*time+a12_1*time^2+a13_1*time^3; %cubic eqn
%1st cubic poly
Q2_1_p=a20_1+a21_1*time+a22_1*time^2+a23_1*time^3; %cubic eqn
%2nd cubic poly
subplot(2,3,1)
plot(time,Q1_1_p,'c*',2+time,Q2_1_p,'k*')
xlabel('sec') %seconds
ylabel('deg') %degrees
title('1st joints position')
hold on
%for the 2nd joint
Q1_2_p=a10_2+a11_2*time+a12_2*time^2+a13_2*time^3; %first cubic
Q2_2_p=a20_2+a21_2*time+a22_2*time^2+a23_2*time^3; %second cubic
subplot(2,3,2)
plot(time,Q1_2_p,'c*',2+time,Q2_2_p,'k*')
xlabel('sec')
ylabel('deg')
title('2nd joints position')
hold on
% V-t graph
%the first joint
Q1_1_v=a11_1+2*a12_1*time+3*a13_1*time^2; %first cubic
Q2_1_v=a21_1+2*a22_1*time+3*a23_1*time^2; %second cubic
1
subplot(2,3,3)
plot(time,Q1_1_v,'c*',2+time,Q2_1_v,'k*') %plotting the graph in color cyan %and as black for the last half
xlabel('sec')
ylabel('deg/sec') %since the velocity is the derivative of the pos.
title('1st joints velocity')
hold on
%the second joint
Q1_2_v=a11_2+2*a12_2*time+3*a13_2*time^2; %first cubic
Q2_2_v=a21_2+2*a22_2*time+3*a23_2*time^2; %second cubic
subplot(2,3,4)
plot(time,Q1_2_v,'c*',2+time,Q2_2_v,'k*')
xlabel('sec')
ylabel('deg/sec')
title('2nd joints velocity')
hold on
% a-t graph
%1st joint
Q1_1_a=2*a12_1+3*2*a13_1*time; %first cubic
Q2_1_a=2*a22_1+3*2*a23_1*time; %second cubic
subplot(2,3,5)
plot(time,Q1_1_a,'c*',2+time,Q2_1_a,'k*')
xlabel('sec')
ylabel('deg/sec^2')
title('1st joints acceleration')
hold on
%2nd joint
Q1_2_a=2*a12_2+3*2*a13_2*time; %first cubic
Q2_2_a=2*a22_2+3*2*a23_2*time; %second cubic
subplot(2,3,6)
plot(time,Q1_2_a,'c*',2+time,Q2_2_a,'k*')
xlabel('sec')
ylabel('deg/sec*sec')
title('2nd joints acceleration')
hold on
end
hold off
t=tf/2;
%two cubic polynomials to have continuous velocity and acceleration in
%cartesion space for the end effector
%x-component cubic polynomial constants
%initial-via
a10_x=xini;
a11_x=0;
a12_x=(12*xvia-3*xfinal-9*xini)/(4*t^2);
a13_x=(-8*xvia+3*xfinal+5*xini)/(4*t^3);
%via-final
a20_x=xvia;
a21_x=(3*xfinal-3*xini)/(4*t);
a22_x=(-12*xvia+6*xfinal+6*xini)/(4*t^2);
a23_x=(8*xvia-5*xfinal-3*xini)/(4*t^3);
%y-component cubic polynomial constants
%initial-via
a10_y=yini;
a11_y=0;
a12_y=(12*yvia-3*yfin-9*yini)/(4*t^2);
a13_y=(-8*yvia+3*yfin+5*yini)/(4*t^3);
%via-final
a20_y=yvia;
a21_y=(3*yfin-3*yini)/(4*t);
a22_y=(-12*yvia+6*yfin+6*yini)/(4*t^2);
2
a23_y=(8*yvia-5*yfin-3*yini)/(4*t^3);
figure(2) %end effector move plot
for time=0:0.1:tf/2
%x_component & y_component position till via point
xi_v_p=a10_x+a11_x*time+a12_x*time^2+a13_x*time^3;
yi_v_p=a10_y+a11_y*time+a12_y*time^2+a13_y*time^3;
%x_component & y_component position from via point till the target
xv_f_p=a20_x+a21_x*time+a22_x*time^2+a23_x*time^3;
yv_f_p=a20_y+a21_y*time+a22_y*time^2+a23_y*time^3;
subplot(1,3,1)
plot(xi_v_p,yi_v_p,'c*',xv_f_p,yv_f_p,'k*')
xlabel('x-dir')
ylabel('y-dir')
title('CartesianSpace Position End_Eff')
hold on
%x_component & y_component velocity till via point
xi_v_v=a11_x+2*a12_x*time+3*a13_x*time^2;
yi_v_v=a11_y+2*a12_y*time+3*a13_y*time^2;
%x_component & y_component velocity from via point till the target
xv_f_v=a21_x+2*a22_x*time+3*a23_x*time^2;
yv_f_v=a21_y+2*a22_y*time+3*a23_y*time^2;
subplot(1,3,2)
plot(xi_v_v,yi_v_v,'c*',xv_f_v,yv_f_v,'k*')
xlabel('xvelo')
ylabel('yvelo')
title('CartesianSpace Velocity End_Eff')
hold on
%x_component & y_component acceleration till via point
xi_v_a=2*a12_x+3*2*a13_x*time;
yi_v_a=2*a12_y+3*2*a13_y*time;
%x_component & y_component acceleration from via point till the target
xv_f_a=2*a22_x+3*2*a23_x*time;
yv_f_a=2*a22_y+3*2*a23_y*time;
subplot(1,3,3)
plot(xi_v_a,yi_v_a,'c*',xv_f_a,yv_f_a,'k*')
xlabel('x_accelera')
ylabel('y_accelera')
title('CartesianSpace Acceleration End_Eff')
hold on
end
hold off
%the robotic toolbox part
%assign the link parameters into L(1) and L(2)
a1 = sym('a1'); l1 = sym('l1'); %symbolical
a2 = sym('a2'); l2 = sym('l2');
L(1) = Link([0 0 50 0]); %the length of the 1st link is 50 mm
L(2) = Link([0 0 25 0]); %the length of the 2nd link is 25 mm
TwoLink = SerialLink(L); %we have two links
TwoLink.name = '2Rplanar'; %assignment of the name of the robot
%check the end effector cartesian positions
TwoLink.fkine([73*pi/180 90*pi/180])
TwoLink.fkine([37.63*pi/180 132.1*pi/180])
TwoLink.fkine([36.9*pi/180 16.2*pi/180])
3
Q0 = [73*pi/180 pi/2];
Qvia=[37.63*pi/180 132.1*pi/180];
Qfinal=[36.9*pi/180 16.2*pi/180];
figure(3)
x=30; y=60; r=10;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit, yunit);
hold on
axis([-60 60 0 100 0 5])
TRAJ = jtraj(Q0, Qvia, (0:.2:2)); %increment is 0.2
TwoLink.plot(TRAJ); %trajectory generation
hold on
TRAJ1 = jtraj(Qvia, Qfinal, (0:.2:2));
TwoLink.plot(TRAJ1);
hold off
Input argument "tf" is undefined.
Error in ==> question_1 at 7
t=tf/2; %it is assumed that from the start and to the via point
Published with MATLAB® 7.11
4