x = logspace(-1,1,100);  % logspace():10的-1次到10的一次 等差分100
y = x.^2;
subplot(2,2,1);
plot(x,y);   %正常画图
title('Plot');
subplot(2,2,2);
semilogx(x,y);  %x轴取对数 实际上x轴是-1，1
title('Semilogx');
subplot(2,2,3);
semilogy(x,y); %y轴取对数 实际上y轴是-2，2
title('Semilogy');
subplot(2,2,4);
loglog(x, y); %x,y都取对数
title('Loglog');
set(gca,'XGrid','on');  %以上不同本质上是因为网格线分隔不同

%%
x = 0:0.01:20;
y1 = 200*exp(-0.05*x).*sin(x);
y2 = 0.8*exp(-0.5*x).*sin(10*x);
[AX,H1,H2] = plotyy(x,y1,x,y2);
% AX: 是一个包含两个元素的数组，分别表示左侧Y轴和右侧Y轴的坐标轴句柄。
% H1: 是第一个Y轴上绘制的曲线的句柄。
% H2: 是第二个Y轴上绘制的曲线的句柄
set(get(AX(1),'Ylabel'),'String','Left Y-axis');  %如果不要'string',类 Text 的属性 Left Y-axis 无法识别。
set(get(AX(2),'Ylabel'),'String','Right Y-axis');
title('Labeling plotyy');
set(AX(1), 'YColor', 'r');
set(AX(2), 'YColor', 'b');
set(H1,'LineStyle','--','Color', 'r'); 
set(H2,'LineStyle',':','Color', 'b');

%% plot3()
x=0:0.1:3*pi; 
z1=sin(x); 
z2=sin(2.*x);
z3=sin(3.*x);
y1=zeros(size(x));
y3=ones(size(x));
y2=y3./2;
plot3(x,y1,z1,'r',x,y2,z2,'b',x,y3,z3,'g');
grid on;
xlabel('x-axis');
ylabel('y-axis');
zlabel('z-axis');

%%
t = 0:pi/50:10*pi;
plot3(sin(t),cos(t),t)
grid on;
axis square; %设置坐标轴纵横比为1:1
% 这意味着x轴和y轴的刻度单位在图形中看起来是相等的，使得图形在视觉上更接近正方形。

%%
turns = 40*pi;
t = linspace(0,turns,4000);
x = cos(t).*(turns-t)./turns;
y = sin(t).*(turns-t)./turns;
z = t./turns;
plot3(x,y,z); 
grid on;

%% Surface Plots
x = -2:1:2;
y = -2:1:2;
[X,Y] = meshgrid(x,y)   %生成二维网格,得到二维坐标系中的网格点坐标

%%
x = -3.5:0.2:3.5; y = -3.5:0.2:3.5;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(1,2,1); mesh(X,Y,Z);
%总行列为1row 2column，当前操作1
subplot(1,2,2); surf(X,Y,Z);

%% contour()  绘制等高线图
%•Projection of equal heights of 3D plot onto a 2D plane
x = -3.5:0.2:3.5;
y = -3.5:0.2:3.5;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
subplot(2,1,1);
mesh(X,Y,Z);
axis square;
subplot(2,1,2);
contour(X,Y,Z);
axis square;

%%
x = -3.5:0.2:3.5;
y = -3.5:0.2:3.5;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);

subplot(1,3,1);
contour(Z,-0.45:0.05:0.45);  %绘制等高线的高度范围，控制疏密
axis square;

subplot(1,3,2);
[C,h] = contour(Z);    
% contour 函数返回两个输出参数：等高线矩阵 C 和绘制等高线的图形对象句柄 h
% contour(Z) 绘制了矩阵 Z 的等高线图，并将等高线矩阵存储在变量 C 中。
% 同时，h 是一个包含等高线图形对象句柄的向量。每个元素 h(i) 对应于 C(i) 中的一个等高线。
clabel(C,h);
axis square;

subplot(1,3,3); 
contourf(Z);  %fill 填充颜色
axis square;

%%
x = -2:0.05:2; 
y = -2:0.05:2;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);

[C,h]= contourf(Z,-.45:0.05:.45);
clabel(C,h);
axis square

set(gca,'XTick',1:20:81);
set(gca,'YTick',1:10:81);
set(gca,'XTickLabel',-2:1:2);
set(gca,'YTicklabel',-2:0.5:2);
colormap(jet);
% jet 颜色映射在低值处使用蓝色，中间值使用绿色，高值处使用红色
% 增强可视化效果很有用.
% 特别是在显示数据分布或强调特定区域的时候。如果不设置颜色映射，默认使用的是 MATLAB 的默认颜色映射
axis square;

%%
x = -3.5:0.2:3.5; y = -3.5:0.2:3.5;
[X,Y] = meshgrid(x,y); Z = X.*exp(-X.^2-Y.^2);
subplot(1,2,1); meshc(X,Y,Z);
subplot(1,2,2); surfc(X,Y,Z);

%%
sphere(50);   %创建了一个包含50个点的球体
shading flat; %将球体进行平坦着色,
light('Position',[1 3 2]);   %打光位置 
light('Position',[-3 -1 3]); %可以有多个
%set(L1, 'Color', 'g');  %光的颜色
% material shiny;  %设置球体的材质为"shiny" 有光泽的
axis vis3d;   %将坐标轴可视性设置为3D可视
axis off;   %关闭坐标轴的显示
set(gcf,'Color','w');  % Get Current Figure 
view(-45,20);  %视图角度


%%  no
v = [0 0 0; 1 0 0 ; 1 1 0; 0 1 0; 0.25 0.25 1; ...
0.75 0.25 1; 0.75 0.75 1; 0.25 0.75 1];
f = [1 2 3 4; 5 6 7 8; 1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8];
subplot(1,2,1); patch('Vertices', v, 'Faces', f, ...
'FaceVertexCData', hsv(6), 'FaceColor', 'flat');
view(3); axis square tight; grid on;
subplot(1,2,2); patch('Vertices', v, 'Faces', f, ...
'FaceVertexCData', hsv(8), 'FaceColor','interp');
view(3); axis square tight; grid on;

%%  no
load cape
X=conv2(ones(9,9)/81,cumsum(cumsum(randn(100,100)),2));
surf(X,'EdgeColor','none','EdgeLighting','Phong','FaceColor','interp');
colormap(map); clim([-10,300]);
grid off; axis off;
