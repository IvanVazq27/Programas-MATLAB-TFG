function Tik = NevilleRacional(x_i,f,x)

% xi : nodos
% f  : valores de f nos nodos
% x  : punto onde queremos evaluar a función interpolante
%
% O programa devolverá T_{n,n}(x)

n = length(x_i);

T = zeros(n,n); %Matriz de 0s onde almacenaremos os T_ik

  
T(:,1) = f(:); %Primeira columna cos valores f_i

for i = 2:n %Alamcenamos os Tik nunha matriz triangular inferior
    for k = 1:i-1

        Tik1  = T(i,k);      % T_{i,k-1}
        Tim11 = T(i-1,k);    % T_{i-1,k-1}

        if k == 1
            Tim12 = 0;       % T_{i-1,-1} valores auxiliares para o calculo dos primeiros T_ik
        else
            Tim12 = T(i-1,k-1); % T_{i-1,k-2}
        end

        num = Tik1 - Tim11;
        tol = 1e-14;
        den = ((x - x_i(i-k))/(x - x_i(i)))*(1 - num/(Tik1 - Tim12)) - 1;
        if (abs(den)<tol)
            warning('Singularidade atopada na posición i=%d, k=%d. O denominador é case cero.', i, k);
        else
            T(i,k+1) = Tik1 + num/den;
        end
    end
end
disp(T)
Tik = T(n,n); %O valor buscado é o T_{n,n}

end