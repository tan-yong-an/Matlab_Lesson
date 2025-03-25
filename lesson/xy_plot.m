function [y] = xy_plot(input,x)
% xy_plot receives the handle of a function and plots that
% function of x
y = input(x); 
plot(x,y,'r--');
xlabel('x'); 
ylabel('function(x)');
end

%在其他Script调用  xy_plot(@sin,0:0.01:2*pi);
% @ 是 Function Handles 在函数中调用其他函数就要用@
%try
%xy_plot(@cot,0:0.01:2*pi);
%xy_plot(@atan,0:0.01:2*pi);