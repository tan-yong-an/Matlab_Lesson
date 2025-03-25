function x=freebody(x0,v0,t)
%输入
x=x0+v0.*t+1/2*9.8.*t.*t;   %.*可以算出多组数据相乘
