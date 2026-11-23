function Phi= difinversas(x_i,f)
%Construiremos a función racional Phi^(n,n) que interpola os nodos (x_i,f_i) 
% a través da fracción continua das diferencias inversas
%
% x_i nodos
% f valores

%Primero definimos as difrencias inversas
n = length(x_i);
D = zeros(n,n); %matriz de 0s onde almacenaremos as diferencias inversas

D(:,1)=f(:); %Primeira columna cos valores f_i

for j=2:n
    for i=1:n-j+1
        tol = 1e-14;
        den = D(1,j-1)-D(i+1,j-1);
        if (abs(den) < tol)
            D(i,j) = Inf; %No caso de que algunha das diferencias inversas sexa infinita
        elseif isnan(den)
            D(i,j) = Inf;
        else
            D(i,j)=(x_i(j-1)-x_i(i+j-1))/(D(1,j-1)-D(i+1,j-1));
        end
    end
end
fprintf('\nTáboa de diferenzas inversas:\n')
disp(D) %D será unha matriz triangular superior.

%Calculamos agora fracción continua
syms x %Require o Add-On symbolic toolbox

L = 0;
for k=n-1:-1:1
    L = (x-x_i(k)) / (D(1,k+1)+L);
end
Phi = D(1,1)+L;

fprintf('\nFracción continua:\n')
disp(Phi)

fprintf('\nExpresión simplificada:\n')
disp(simplify(Phi,'Steps',100))
end

