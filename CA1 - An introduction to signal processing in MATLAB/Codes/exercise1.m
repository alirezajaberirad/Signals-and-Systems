function [A,D,r] = exercise1(n,m,q)
    matrix=repmat([1:n],m-n+1,1);
    plus=[0:m-n];
    plus=plus';
    plus=repmat(plus,1,n);
    A=matrix+plus
    r=sort( randperm(m,randi(m)) )
    D=ismember(A,r);
    D=D-0.5;
    D=2*D
end