function output = fact(n)
% fact recursively finds n!
if n==1
output = 1;
else
output = n * fact(n-1);   %Factorial Recursive Function
end
end