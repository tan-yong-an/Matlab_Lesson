%% Gaussian Elimination 
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
R = rref([A b])  %"Reduced Row Echelon Form"（简化行阶梯形式）

%% LU Factorization – lu()  不会
A = [1 2 1;2 6 1;1 1 4];
[L, U, P] = lu(A);
b = [2; 7; 3];

%% Matrix Left Division: \
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
x=A\b

%% Cramer’s (Inverse) Method
A = [1 2 1;2 6 1;1 1 4];
b = [2; 7; 3];
x = inv(A)*b

% Singular:The inverse matrix does not exist
A = [ 1 2 3 4; 2 4 6 8; ...
9 8 7 6; 1 3 2 8];
inv(A)
det(A)

%%
syms R1 R2 R3 R4 R5;
syms V1 V2;
A = [R1 0 0 R1 0;...
    0 R2 0 -R4 R5;...
    0 0 -R3 0 R5;...
    1 -1 0 -1 0;...
    0 1 -1 0 -1];
b = [V1 ; 0 ; V2 ; 0 ; 0];
I = inv(A)*b;
for i = 1:length(I)
    fprintf('i%d = %s\n', i, char(I(i)));
end

%%
syms x y z

x1 = -y - z;
x2 = y - z;
x3 = -3 * z;

fsurf(x1, [0, 40, 0, 40]);  % 指定 x 和 y 的范围,z matlab自己算
hold on
fsurf(x2, [0, 40, 0, 40]);
fsurf(x3, [-20, 20, 0, 40]);  % 指定 x 和 y 的范围
hold off

xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Plot');

%% Eigenvalues and Eigenvectors   
[v,d]=eig([2 -12;1 -5]) % v是特征向量，d是特征值

%% Matrix Exponential
A = [0 -6 -1; 6 2 -16; -5 20 -10];
x0 = [1 1 1]';
X = [];
for t = 0:.01:1
X = [X expm(t*A)*x0];
end
plot3(X(1,:),X(2,:),X(3,:),'-o');
xlabel('x_1'); ylabel('x_2');
zlabel('x_3'); grid on;
axis tight square;

