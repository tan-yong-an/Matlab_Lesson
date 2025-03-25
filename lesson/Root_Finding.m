%%  GPT:

% 解析解：
% 解析解是通过代数和符号运算来得到的解。这种解法通常涉及到代数方程、微积分和其他数学工具。
% 解析解是一个精确的表达式，可以用来表示问题的确切解。它通常包含变量和常数，并且在特定条件下始终成立。
% 例如，对于二次方程ax^2 + bx + c = 0，解析解可以通过应用求根公式得到。


% 数值解：
% 数值解是通过数值计算和近似方法得到的解。这涉及到使用数值技术（如迭代、数值积分等）来逼近问题的解。
% 数值解通常是近似值，而不是确切的代数表达式。其精度取决于计算的方法和所用的计算资源。
% 数值解在面对复杂或无法用代数方法解决的问题时特别有用。
%%  Symbolic approach
syms x;  % or x=sym('x');   smybolic variables  符号变量
(x+x+x)/4;
y=x*sin(x)+x;   % y也是symbolic variable
solve(y,x)      %(equation,symbol)+

z=(cos(x))^2-(sin(x))^2;
solve(z,x)

m=(cos(x))^2+(sin(x))^2;
solve(m,x)
%% 
%Solve Multiple Equation
syms x y
eq1=x-2*y-5;
eq2=x+y-6;
A=solve(eq1,eq2,x,y);
A.x
A.y   %访问x,y
%Solving Equations Expressed in Symbols
syms x a b
y=a*x^2-b;
solve(y)
solve(y,b)  %unkown

syms x y a b r
solve((x-a)^2+(y-b)^2==r^2,x)  %直接写 == 也能解

%%
syms a b c  
A=[a b;c 2];  % 含符号的也可以直接求逆
inv(A)

%% 
% Symbolic Differentiation
syms x
y=4*x^5;
diff(y)  %  20*x^4  可以利用symbolic variable直接求导

clc;clear;
syms x y
f(x)=(exp(x^2))/(x^3-x+3);
diff(f(x))

g(x)=(x^2+x*y-1)/(y^3+x+3);
diff(g(x),x) 

%% 
% Symbolic Integration
syms x; 
y = x^2*exp(x);
z = int(y)   %默认C=0,如果有条件：z(0)=0，解就不对
z = z-subs(z, x, 0)  %substitution 把x=0带入z得结果

syms x
y = (x^2 -x +1)/(x + 3);
integral_y = subs(int(y), x, 10) - subs(int(y), x, 0)  %求解定积分，积分上下限为 0,10

%% Numeric root solvers
f2 = @(x) (1.2*x+0.3+x*sin(x));  %非线性
fsolve(f2,0)  % (A function handle,initial guess)

f=@(x) [2.*x(1)-x(2)-exp(-x(1));-x(1)+2.*x(2)-exp(-x(2))];
%x=x(1) y=x(2) 
fsolve(f,[-5,-5])

% f=@(x y)  [2.*x-y-exp(x);-x+2.*y-exp(-y)];  这样写会报错
% fsolve(f,[-5,-5])

f=@(x)x.^2;
options=optimset('MaxIter',1e3,'TolFun',1e-10);  
%1e3:Number of iterations(迭代次数)
% 1e-10:Tolerance(允许误差)
fsolve(f,0.1,options)  % 1.9532e-04
fzero(f,0.1,options)  % NaN

%% Finding Roots of Polynomials
%roots only works for polynomials
%𝑓(𝑥) = 𝑥5 − 3.5𝑥4 + 2.75𝑥3 + 2.125𝑥2 − 3.875𝑥 + 1.25
roots([1 -3.5 2.75 2.125 -3.875 1.25])
%f(x)= 𝑥3 − 6𝑥2 − 12𝑥 + 81
roots([1 -6 -12 81])
