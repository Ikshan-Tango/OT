clc
clear

A=[-1 3;1 1;1 -1];
b=[10;6;2];
c=[2;3];

y1=0:1:max(b);

x12=(b(1)-A(1,1)*y1)/A(1,2);
x12=max(0,x12);
x22=(b(2)-A(2,1)*y1)/A(2,2);
x22=max(0,x22);
x32=(b(3)-A(3,1)*y1)/A(3,2);
x32=max(0,x32);

plot(y1,x12,'r',y1,x22,'k',y1,x32,'m');

cx1=find(y1==0);
c1=find(x12==0);

line1=[y1([c1,cx1]);x12([c1,cx1])]'

c2=find(x22==0);

line2=[y1([c2,cx1]);x22([c2,cx1])]'

c3=find(x32==0);
line3=[y1([c3,cx1]);x32([c3,cx1])]'
corpt=unique([line1;line2;line3],'rows') 
pt=[0;0];
for i=1:size(A,1)
    A1=A(i,:);
    B1=b(i,:);
    for j=i+1:size(A,1)
        A2=A(j,:);
        B2=b(j,:);
        A4=[A1;A2];
        B4=[B1;B2];
        X=inv(A4)*B4;
        pt=[pt X];
    end
end
ptt=pt'

allpt=[ptt;corpt];
points=unique(allpt,'rows');

for i=1:size(points,1)
    const1(i)=A(1,1)*points(i,1)+A(1,2)*points(i,2)-b(1);
    const2(i)=A(2,1)*points(i,1)+A(2,2)*points(i,2)-b(2);
    const3(i)=A(3,1)*points(i,1)+A(3,2)*points(i,2)-b(3);
    
    s1=find(const1>0);
    s2=find(const2>0);
    s3=find(const3>0);
end
s=unique([s1 s2 s3])
points(s,:)=[];

value=points*c;
table=[points value]';
[obj,index]=max(value);
x1=points(index,1);
x2=points(index,2);

fprintf('objective value is %f at(%f,%f)',obj,x1,x2);