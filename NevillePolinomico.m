function Qik = NevillePolinomico(x_i,f,x)

% xi : nodos
% f  : valores de f nos nodos
% x  : punto onde queremos evaluar a función interpolante
%
% O programa devolverá Q_{n,n}(x)

n = length(x_i);

Q = zeros(n,n); %Matriz de 0s onde almacenaremos os Q_ik

  
Q(:,1) = f(:); %Segunda columna cos valores f_i

% for i = 2:n %Alamcenamos os Qik nunha matriz triangular inferior
%     for k = 1:i-1
% 
%         Qik1  = Q(i,k);      % Q_{i,k-1}
%         Qim11 = Q(i-1,k);    % Q_{i-1,k-1}
%         num = Qik1 - Qim11;
% 
%         den = ((x - x_i(i-k))/(x - x_i(i))) - 1;
% 
%         Q(i,k+1) = Qik1 + num/den;
%     end
% end

for i = 2:n
    for k = 1:i-1

        Q(i,k+1) = ((x - x_i(i-k))*Q(i,k) - ...
            (x - x_i(i))*Q(i-1,k))/(x_i(i) - x_i(i-k));

    end
end
Qik = Q(n,n); %O valor buscado e o Q_{n,n}

end