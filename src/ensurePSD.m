% Ensures the covariance matrix is positive semi-definite
% Ensures that all the eigenvalues are at least a little greater than zero
function [C] = ensurePSD(C)

    thrsh = 0.001; % Choose a small number for the threshold

    [U,L] = eig(C);
    L = diag(L);
    L = max(L,thrsh);
    L = diag(L);
    C = U*L*U';
    
end