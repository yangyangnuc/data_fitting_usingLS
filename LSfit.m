%% linear Least Square
% by solving p = v/p, Vandermonde matrix
% 
clear all
clc
close all

x = 1:10;
y = x.*x;


Co = polyfit(x,y,3)
disp('beginning calculating new y')
y1 = Co(1)*power(x,3)+Co(2)*power(x,2)+Co(2)*power(x,1)+Co(4)*power(x,0)

disp('beginning plot original y')
figure, plot(x,y,'or'),
title('Linear and Non-liner LS Fitting'),xlabel('x data'),ylabel('y data')
hold on
disp('over')

disp('beginning plot new linear-fitted y')
plot(x,y1,'*g')
disp('over')
% hold on
%% using non-linear method to fit real data
% 
disp('modeling new non-linear func')
func = @(x_Co,x)x_Co(1)*exp( x_Co(2)*x );
disp('over')
x0 = [10,-1];
x_Co = lsqcurvefit(func,x0,x,y)

times = linspace(x(1),x(end));
plot(times, func(x_Co,times), 'b-'),
legend('real data','Linear fitted data','Non-Linear')






disp('**********  Game over! ***********')