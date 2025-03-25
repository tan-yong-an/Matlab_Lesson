a=6;
if rem(a,2)==0     %remainder
    disp('is a even');   %偶数
else 
    disp('is a odd');    %奇数
end

b=-1;
switch b
    case -1
        disp('negative 1');
    case 0
        disp('zero');
    case 1
        disp('positive 1');
    otherwise
        disp('other number');
end

n=40;
while prod([1:n])<1e100   %product 乘积  科学计数法   n!  <  1*10^100
    n=n+1;
end
disp(n);

% for n=1:10
%     a(n)=2^n;
% end
% disp(a);

for n=1:2:10   %如果不clear a  那么a还是原来那个
    a((n+1)/2)=2^n;
end
disp(a);

i=1;
for n=1:2:10
    b(i)=2^(n);
    i=i+1;
end
disp(b);

%%
A = [0 -1 4; 9 -14 25; -34 49 64];
B = zeros(3, 3);
for n = 1:9
    B(n) = A(n);
end
disp(B)

%%
for n = 1:9
    if B(n) < 0
        B(n) = 0;
    end
end
disp(B)
%%
freebody(0,0,10);
disp(freebody(0,0,10));
disp(freebody([0 1],[0 1],[10 20]));

%%
%function handles
f=@(x) exp(-2*x);  
x=[0:0.1:2];    %0,0.1,0.2.....2
plot(x,f(x));

%%
f=@(x) (x*x*x+x*x)./(x*x+1);
x=[-10:0.1:10];
plot(x,f(x));