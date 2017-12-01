%% clear jobs
clc
clear all
close all
disp('*** Do some clear jobs')

%% data fitting demo
disp('*** Data fitting demo')
space = 0.05
data_range = 12
x = 1:space:data_range;
y = power(x,2).*sin(2*x);
plot(x,y,'o'), hold on

%% some settings
x_elements = [power(x,5); power(x,4); power(x,3); power(x,2); power(x,1); power(x,0)]';
x_elements10 = [power(x,10);power(x,9);power(x,8);power(x,7);power(x,6);power(x,5); power(x,4); power(x,3); power(x,2); power(x,1); power(x,0)]';
size(x_elements)
Co = []
Res = [y]';
size(Res)


%% polyfit
disp('polynomial fit in Least-Square sense')

Co = x_elements\Res
size(Co)
y1 = x_elements*Co
size(y1)
plot(x,y1,'*r')

Co10 = x_elements10\Res
y2 = x_elements10*Co10
size(y2)
plot(x,y2,'+black')


Co100 = polyfit(x,y,100)
y100 = polyval(Co100,x);

plot(x,y100,'r-')

title('Data fitting, Overfitting, underfitting VS Data-Range, Data-Density')
xlabel(['x data with space ',num2str(space),', data range ',num2str(data_range)]),
ylabel(['y data, function y is y=power(x,2).*sin(2*x)'])
legend('original data','polynomial deg-5','polynomial deg-10','deg-100 Overfitting VS Data Amount')
disp('*** Game over ***')