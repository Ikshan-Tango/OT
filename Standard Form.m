Standard Form Code.



format short
clc
clear

A = [1 -2 -3; 2 3 -4; 1 1 1];
B = [4;5;2];
C = [1 2 -1];

ineqsign = [0,1,1];
s = eye(size(A,1));

index = find(ineqsign>0);
s(index,:) = -s(index,:);

mat = [A s B];
%Making the simplex table 
cons = array2table(mat);
cons.Properties.VariableNames(1:size(mat,2)) = {'x1','x2','x3','s1','s2','s3','b'};
disp(cons);



mat2 = [C 0 0 0];
cons2 = array2table(mat2);
cons2.Properties.VariableNames(1:size(mat2,2)) = {'x1','x2','x3','s1','s2','s3'};
disp(cons2);