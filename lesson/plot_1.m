%%
hold on
plot(cos(0:pi/20:2*pi),'og--');
plot(sin(0:pi/20:2*pi),'xy:');
hold off
%%
x=0:0.5:4*pi;
y=sin(x); h=cos(x); w=1./(1+exp(-x));
g=(1/(2*pi*2)^0.5).*exp((-1.*(x-2*pi).^2)./(2*2^2));
plot(x,y,'bd-',x,h,'gp:',x,w,'ro-',x,g,'c^-');
legend('sin(x)','cos(x)','Sigmoid','Gauss function');  %图例

%%
x = 0:0.1:2*pi; y1 = sin(x); y2 = exp(-x);
plot(x, y1, '--*', x, y2, ':o');
xlabel('t = 0 to 2\pi');    %\pi 就是显示出pi
ylabel('values of sin(t) and e^{-x}') 
title('Function Plots of sin(t) and e^{-x}');
legend('sin(t)','e^{-x}');

%%
x = linspace(0,3);
y = x.^2.*sin(x);
plot(x,y);
line([2,2],[0,2^2*sin(2)]);
str = '$$ \int_{0}^{2} x^2\sin(x) dx $$';  %integration积分 —_{}下限 ^{}上限 
text(0.25,2.5,str,'Interpreter','latex');  %后面两个是固定格式
annotation('arrow','X',[0.32,0.5],'Y',[0.6,0.4]); %注释 箭头

%%
x = linspace(0, 2*pi, 1000);
y = sin(x); 
h = plot(x,y);
% get(h);
% get(gca);    % Get Current Axes
set(gca,'XLim', [0, 2*pi]);    %显示
set(gca,'YLim', [-1.2, 1.2]);
set(gca,'FontSize', 25);       %字体大小
set(gca,'XTick', 0:pi/2:2*pi);  %x轴分隔
% set(gca,'XTickLabel', 0:90:360);
% set(gca,'FontName', 'symbol');
set(gca,'XTickLabel', {'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
set(h, 'LineStyle','-.','LineWidth', 7.0, 'Color', 'g');  %直接改h线的特征 
%delete(h);   %线消失了，坐标轴还在

%%
x=rand(20,1); set(gca,'FontSize', 18);
plot(x,'-md','LineWidth', 2, 'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'g','MarkerSize', 10);
xlim([1, 20]);

%%
x = -10:0.1:10;
y1 = x.^2 - 8;
y2 = exp(x);
figure, plot(x,y1);
figure, plot(x,y2);   %可以画多个图形

%%
t = 0:0.1:2*pi; x = 3*cos(t); y = sin(t);
subplot(2, 2, 1); plot(x, y); axis normal  %标准
subplot(2, 2, 2); plot(x, y); axis square  % 正方形图幅
subplot(2, 2, 3); plot(x, y); axis equal   % x y分隔相同
subplot(2, 2, 4); plot(x, y); axis equal tight   % 与图相切
grid on;   %网格线
box off;   
axis off;
 
%%
% 创建一个 x 的范围，例如从 -10 到 10
x = linspace(-10, 10, 1000);  %-10~10等间距1000取点
% 计算对应的 y 值
y = (x.^3 + x.^2) ./ (x.^2 + 1);
% 绘制图形
plot(x, y);
% 添加标题和标签
title('Graph of y = (x^3 + x^2) / (x^2 + 1)');
xlabel('x');
ylabel('y');

%%
x = linspace(-10,10,1000);
y = x.^3./cos(x).*sin(x);
plot(x,y);





