function tw0facedraw()
global draw_enable;
draw_enable=0;
m1=figure;
a=axes;
m2=figure;
b=axes;
grid(a,'on');
grid(b,'on');
hold(a,'on');
hold(b,'on');
axis([a,b],'equal');
axis([a,b],[-3 3 -2 2 -2 2]);
global linehere;
linehere=1;
global right;
right=0;
global cyc;
cyc=1;

m1.Position=[40 100 700 600];
m2.Position=[760 100 700 600];
m1.Name='m1';
m2.Name='m2';
edit1=uicontrol(m1,'Style', 'edit','String','z^2'); 
bt1=uicontrol(m1,'Style', 'pushbutton','String','确定'); 
bt2=uicontrol(m1,'Style', 'pushbutton','String','还原'); 
bt3=uicontrol(m1,'Style', 'pushbutton','String','直线'); 
bt4=uicontrol(m1,'Style', 'pushbutton','String','圆'); 
newposition(m1);
M=label([a,b]);
a=M(1);
b=M(2);
m1.WindowButtonDownFcn=@mWindowButtonDownFcn;
m1.WindowButtonMotionFcn=@(hObject, eventdata)mWindowButtonMotionFcn(hObject,eventdata,m2,edit1);
m1.WindowButtonUpFcn=@mWindowButtonUpFcn;
m1.WindowScrollWheelFcn=@mWindowScrollWheelFcn;
m2.WindowScrollWheelFcn=@mWindowScrollWheelFcn;
bt2.Callback=@(hObject, eventdata)calback(hObject, eventdata,m1,m2);
bt3.Callback=@(hObject, eventdata)linebtccallback(hObject,eventdata,m1,edit1,m2);
bt4.Callback=@(hObject, eventdata)cyccallback(hObject,eventdata,m1,edit1,m2);
end
function cyccallback(hObject, eventdata,father,ui1,m2)
global cyc;
global linehere;
if cyc||linehere==0
    cyc=0;
    linehere=1;
    father.WindowButtonMotionFcn=@lineButtonMotionFcn;
    father.WindowButtonUpFcn=@(hObject, eventdata)cycWindowButtonUpFcn(hObject, eventdata,m2,ui1);
else
    cyc=1;
    father.WindowButtonMotionFcn=@(hObject, eventdata)mWindowButtonMotionFcn(hObject, eventdata,m2,ui1);
    father.WindowButtonUpFcn=@mWindowButtonUpFcn;
end
end

function cycWindowButtonUpFcn(hObject, eventdata,p,ui1)
global draw_enable;
global right;
global x;
global y;
position=get(gca,'currentpoint');
x(2)=position(1);
y(2)=position(3);
r=sqrt((x(2)-x(1))^2+(y(2)-y(1))^2);
if draw_enable 
        plot(hObject.CurrentAxes,x(2),y(2),'bs')
end
dx=-0.04:0.03:2*pi;
xx=x(1)+r*cos(dx);
yy=y(1)+r*sin(dx);
trans(p,ui1,xx,yy);
line1=line(xx,yy);
line1.LineWidth=1;
line1.Color='blue';
draw_enable=0;
right=0;
x=0;
y=0;
end
function linebtccallback(hObject, eventdata,father,ui1,m2)
global linehere;
global cyc;
if linehere||cyc==0
    linehere=0;
    cyc=1;
    father.WindowButtonMotionFcn=@lineButtonMotionFcn;
    father.WindowButtonUpFcn=@(hObject, eventdata)lineWindowButtonUpFcn(hObject, eventdata,m2,ui1);
else
    linehere=1;
    father.WindowButtonMotionFcn=@(hObject, eventdata)mWindowButtonMotionFcn(hObject, eventdata,m2,ui1);
    father.WindowButtonUpFcn=@mWindowButtonUpFcn;
end
end
function lineWindowButtonUpFcn(hObject, eventdata,p,ui1)
global draw_enable;
global right;
global x;
global y;
position=get(gca,'currentpoint');
x(2)=position(1);
y(2)=position(3);
if 1
    if draw_enable 
        plot(hObject.CurrentAxes,x(2),y(2),'bs');
    end
    xx=x(1):0.02:x(2);
    yy=linspace(y(1),y(2),numel(xx));
    if numel(xx)<=100
        yy=linspace(y(1),y(2),100);
        xx=linspace(x(1),x(2),100);
        
    end
    
    trans(p,ui1,xx,yy);
    line1=line(hObject.CurrentAxes,xx,yy);
    line1.LineWidth=1;
    line1.Color='red';
end
draw_enable=0;
right=0;
x=0;
y=0;
end
function lineButtonMotionFcn(hObject, eventdata)
pause(0.0001);
global x;
global y;
global draw_enable;
global right;
position=get(gca,'currentpoint');
x(2)=position(1);
y(2)=position(3);
if draw_enable
    plot(hObject.CurrentAxes,x(1),y(1),'bs');
elseif right
    mmove(hObject,x,y)
    
end
end
function calback(hObject, eventdata,m1,m2)
cla(m1.CurrentAxes);
cla(m2.CurrentAxes);
view(m2.CurrentAxes,[0,90]);
view(m1.CurrentAxes,[0,90]);
axis([m1.CurrentAxes,m2.CurrentAxes],[-3 3 -2 2 -2 2]);
end
function mWindowScrollWheelFcn(hObject, eventdata)
val = eventdata.VerticalScrollCount;
position=get(gca,'currentpoint');
a=position(1);
b=position(3);
c=position(5);
tea=axis;
if numel(tea)>4
    axis((tea-[a a b b c c])*exp(val/20)+[a a b b c c]);
else 
    axis((tea-[a a b b])*exp(val/20)+[a a b b]);
end
end
function mWindowButtonDownFcn(hObject, eventdata)
newposition(hObject);
global draw_enable;
global x;
global y;
global right;
right=0;
draw_enable=0;
position=get(gca,'currentpoint');
x(1)=position(1);
y(1)=position(3);
if strcmp(hObject.SelectionType,'normal')
    draw_enable=1;
else
       
    right=1;
end
end
function mWindowButtonMotionFcn(hObject, eventdata,b,ui1)
pause(0.0001);
global draw_enable;
global x;
global y;
global right;
position=get(gca,'currentpoint');
x(2)=position(1);
y(2)=position(3);

if draw_enable
   
    line1=line(hObject.CurrentAxes,x,y);
    trans(b,ui1,x,y);
    x(1)=x(2);
    y(1)=y(2);
    line1.LineWidth=1;
    line1.Color='red';
elseif right
    mmove(hObject,x,y)
end
end
function mWindowButtonUpFcn(hObject, eventdata)
global draw_enable;
draw_enable=0;
global right;
right=0;
global x;
x=0;
global y;
y=0;
end
function trans(p,ui1,x,y)
colormap(p,jet(256));
f=@(z)eval(ui1.String);
z=x+1i*y;
w=0*z;
for ii=1:numel(z)
    w(ii)=f(z(ii));
end
M=[1 1];
d=[1 -1];
mm=M-d*0.01;
xx=real(w);
yy=imag(w);
% for ii=1:numel(xx)-1
% L=line(p.CurrentAxes,xx(ii:ii+1),yy(ii:ii+1),x(ii:ii+1));
% L.Color=colorbuild((y(ii)+y(ii+1))/2);
% L.LineWidth=4;
% end
if numel(xx)>2
    if numel(xx)<200
    for ii=1:numel(xx)-1
    L=line(p.CurrentAxes,xx(ii:ii+1),yy(ii:ii+1),x(ii:ii+1));
    L.Color=colorbuild(y(ii)+y(ii+1));
    L.LineWidth=2.5;
    end
    else
     m=2;
     MM=m-1;
     tt=numel(xx)-1;
     dd=mod(tt,m);
     t=(tt-dd)/m;
     for ii=1:t
        tempxx=[xx(MM*ii-MM+1),xx(MM*ii+1)];
        tempyy=[yy(MM*ii-MM+1),yy(MM*ii+1)];
        tempx=[x(MM*ii-MM+1),x(MM*ii+1)];
        tempy=(y(MM*ii-MM+1)+y(MM*ii+1));
        L=line(p.CurrentAxes,tempxx,tempyy,tempx);
        L.Color=colorbuild(tempy);
        L.LineWidth=2.5;
     end
     L=line(p.CurrentAxes,xx(MM*t:end),yy(MM*t:end),x(MM*t:end));
     L.Color=colorbuild(y(MM*t)+y(end));
     L.LineWidth=2.5;
        
        
    end
    
else
    L=line(p.CurrentAxes,xx,yy,x);    
    L.LineWidth=2.5;
    L.Color=colorbuild((y(1)+y(2)));
  
end


   


end

function Color=colorbuild(n)
M=1024;
e=1/(exp(-n)+1);
Color=jet(M);
Color=Color(floor(e*M)+1,1:end);
end
function M=label(M)
for ii=1:numel(M)
    xlabel(M(ii),'X轴or自变量实部');
    ylabel(M(ii),'Y轴or自变量虚部');

end
end
function mmove(hObject,x,y)
    hObject.Children(end).XLim=hObject.Children(end).XLim-x(2)+x(1);
    hObject.Children(end).YLim=hObject.Children(end).YLim-y(2)+y(1);
end

function newposition(father)
M=father.Children;
p=father.Position;
x=p(1);
y=p(2);
w=p(3);
d=p(4);
k=0;
for ii=M(1:end-1)'
    if strcmp(ii.Style,'edit')
        
        ii.Position=[w/2-20,d-50,90,30];
    else
        ii.Position=[p(3)-180-k,p(4)-100,50,20];
        k=k+80;
    end
end
end