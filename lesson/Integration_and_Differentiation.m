%%
%polynomial  多项式
a=[9 -5 3 7];  %多项式系数写成 row vector
x=-2:0.01:5;
f=polyval(a,x);  %polynomial value
plot(x,f,'LineWidth',2);
title('f(x)=9X^3-5x^2+3x+7');
xlabel('x');
ylabel('f(x)');
set(gca,'FontSize',14);

%%
p=[5 0 -2 0 1];
polyder(p)     % derivative导数      ans =  20     0    -4     0
polyval(polyder(p),7)   %运算出f'(7)

%%
f1=[5 -7 5 10];
f2=[4 12 -3];
f=conv(f1,f2);  %convolution 卷积 conv 多项式相乘
hold on
plot(x,polyval(f,x),'--b','LineWidth',2);
plot(x,polyval(polyder(f),x),'-r','LineWidth',2);
xlabel('x');
legend('f(x)','f''(x)');   %按照polt的顺序 建立图例
set(gca,'XTick',-2:0.5:1);
hold off

%%
p=[5 0 -2 0 1];
p1=polyint(p,3);   %integration 求积分 要给一个常数项, 这还是个多项式
polyval(p1,7)

%%
a=[1 7 9 6 5 3 2 1 4];  %9个元素   diff()  差异
diff(a)  % 6     2    -3    -1    -2    -1    -1     3 %8个元素


h = 0.1;
x0 = pi/2;
x = [x0 x0+h];
y = [sin(x0) sin(x0+h)];
m = diff(y)./diff(x);   % m=-0.0500

x=0:0.5:2*pi;
y=sin(x);
m=diff(y)./diff(x);
plot(x(1:end-1),m);

%%
g = colormap(lines);  %颜色映射矩阵，每一行代表一种颜色
hold on;
for i=1:4    %有4根线
x = 0:power(10, -i):pi;  %power()  指数函数
y = sin(x); 
m = diff(y)./diff(x);
plot(x(1:end-1), m, 'Color', g(i,:));   %x这个向量从第一个到倒数第二个  g(i,:)取第i列
end
hold off;
set(gca,'XLim', [0, pi/2]);
set(gca,'YLim', [0, 1.2]);
set(gca,'FontSize', 18); 
set(gca,'XTick', 0:pi/4:pi/2);
set(gca,'XTickLabel', {'0', '\pi/4', '\pi/2'});
h = legend('h=0.1','h=0.01','h=0.001','h=0.0001');
set(h,'FontName', 'Times New Roman');
box on;

%%
 %Given 𝑓(𝑥) = exp(-x)*sin(x^2/2), plot the approximate derivatives f' of h = 0.1, 0.01, and 0.001
 hold on 
 for i = 1:3
    h = power(10, -i);
    x = 0:h:2*pi;
    f = exp(-x).*sin(x.^2/2);
    f_diff = diff(f)./diff(x);
    plot(x(1:end-1), f_diff);      %导函数
 end
 a=0:0.001:2*pi;
 plot(a,f);    %原函数
 hold off
 legend('h=0.1', 'h=0.01', 'h=0.001');
 box on

 %%
 x = -2:0.005:2;
 y = x.^3;
 m = diff(y)./diff(x);
 m2 = diff(m)./diff(x(1:end-1));
 plot(x,y,x(1:end-1),m,x(1:end-2),m2);  %直接画多个图
 xlabel('x','FontSize', 18);
 ylabel('y','FontSize', 18);
 legend('f(x) =x^3','f''(x)','f''''(x)');
 set(gca,'FontSize', 18);

 %%
 %midpoint rule   
 h=0.001;   %数值越小越精准
 x=0:h:2;
 midpiont=(x(1:end-1)+x(2:end))./2;  %注意不要忘了括号
 y=4*midpiont.^3;
 s=sum(h*y)

 %%
 %trapezoid rule 平行四边形
 h=0.05;
 x=0:h:2;
 y=4*x.^3;
 trapeziod=(y(1:end-1)+y(2:end))./2;
 %s=h*trapz(y)   %带入每个y算出(f(0)+f(1))/2;(f(2)+f(1))/2....
 s=sum(h*trapeziod)

 %%
 %  Simpson s Rule   （三次） 次数越高越精准
 h = 0.05; x = 0:h:2; y = 4*x.^3;
 s = h/3*(y(1)+2*sum(y(3:2:end-2))+...
     4*sum(y(2:2:end))+y(end))

 %%
 %Anonymous function  匿名函数 计算一次二次三次积分
 f=@(x) 1./(x.^3-2*x-5);
 a=integral(f,0,2);

 f = @(x,y) y.*sin(x)+x.*cos(y);
 b=integral2(f,pi,2*pi,0,pi);

 f = @(x,y,z) y.*sin(x)+z.*cos(y);
 c=integral3(f,0,pi,0,1,-1,1);  %第一个参数是函数，后面依次是x,y,z上下限

 disp(a);disp(b);disp(c);
