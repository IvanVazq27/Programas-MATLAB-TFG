function Phi = difreciprocas(x_i,f)
%Construiremos a función racional Phi^(n,n) que interpola os nodos (x_i,f_i) 
% a través da fracción continua das diferencias recíprocas (Fracción de Thiele)
% x_i nodos
% f valores

%Primero definimos as difrencias recíprocas

n = length(x_i);
D = zeros(n,n); %matriz de 0s onde almacenaremos as diferencias recíprocas

D(:,1)=f(:); %Primeira columna cos valores f_i
for i=1:n-1
        D(i,2)=(x_i(i)-x_i(i+1))/(D(i,1)-D(i+1,1));
end
for j=3:n
    for i=1:n-j+1
        tol = 1e-14;
        den = D(i,j-1)-D(i+1,j-1);
        if (abs(den) < tol)
            D(i,j) = Inf; %No caso de que algunha das diferencias recíprocas sexa infinita
        elseif isnan(den)
            D(i,j) = Inf;
        else
            D(i,j)=(x_i(i)-x_i(i+j-1))/(D(i,j-1)-D(i+1,j-1))+D(i+1,j-2);
        end
    end
end
fprintf('\nTáboa de diferenzas recíprocas:\n')
disp(D)

%Calculamos agora fracción continua
syms x %Require o Add-On symbolic toolbox

L = 0;
for k=n-1:-1:2 %O primeiro coeficiente non ten un elemento restando ao seu lado
    L = (x-x_i(k)) / (D(1,k+1)-D(1,k-1)+L);
end
L = (x-x_i(1)) / (D(1,2)+L);
Phi = D(1,1)+L;

fprintf('\nFracción continua Thiele:\n')
disp(Phi)

fprintf('\nExpresión simplificada:\n')
disp(simplify(Phi,'Steps',100))
end