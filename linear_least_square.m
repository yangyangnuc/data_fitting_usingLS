%% some clean jobs
clc
clear all
close all
disp('*** clean jobs')
disp('over')

%% 1st example
disp('*** init process ')
x = 1:4;
y = [6 5 7 10];
plot(x,y,'*r'),hold on
disp('over') 
disp('*** using line fitting --> overdetermined linear-equations')
disp('*** Vandermonde matrix*Coeff=Res, using line to fitting')
vandermonde = [power(x,1);power(x,0)]';
size(vandermonde)
vandermonde
Res = [y]'
Coeff = vandermonde\Res
y1 = vandermonde*Coeff
plot(x,y1,'g-')
% [v i] = min(y)
% text(x(i),min(y),'original data');

disp('*** using quadric polynomial to fit')
vandermonde2 = [power(x,2);power(x,1);power(x,0)]';
Coeff2 = vandermonde2\Res
y2 = vandermonde2*Coeff2
plot(x,y2,'b-')


legend('original data','fitted line','fitted quadric curve')


disp('*** Totally Game over! ***')