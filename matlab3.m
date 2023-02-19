clc
clear

A=[2 3 -1 4;-1 -2 -6 7];
b=[8;3];
c=[2 3 4 7];

n=size(A,2);
m=size(A,1);

if (n>m)
    nCm=nchoosek(n,m);
    p=nchoosek(1:n,m);
    sol=[];
    for i=1:nCm
        y=zeros(n,1);
        A1=A(:,p(i,:));
        X=inv(A1)*b;
        if all(X>=0 & X~=inf & X~=-inf)
            y(p(i,:))=X;
            sol=[sol y]
        end
    end
end

value=(sol')*c';
[obj index]=max(value);
x1=sol(1,index);
x2=sol(2,index);
x3=sol(3,index);
x4=sol(4,index);
fprintf('objective value is %f at(%f,%f,%f,%f)',obj,x1,x2,x3,x4);

Add array2table function also!