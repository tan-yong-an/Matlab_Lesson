function Celsius = F2C()
% Write a function that asks for a temperature in degrees Fahrenheit
% Compute the equivalent temperature in degrees Celsius
% Show the converted temperature in degrees Celsius
% The script should keep running until no number is provided to convert
% You may want to use these functions: input, isempty, break, disp, num2str
while true
F = input('Temperature in F ? ');
if isempty(F)
    break
end
C = 5/9.*(F - 32);
disp(['Temperture in C = ', num2str(C)]);
end

% function F2C
% while 1
%     F = input('請輸入您目前的華氏溫度: ');
%     if  isempty(F)
%         break
%     else
%         C = (F-32).*(5/9);
% 
%         disp(['目前的攝氏溫度為: ',num2str(C)]);
%     end
% end