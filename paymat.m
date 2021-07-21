clc
clear 
close all
% p=optimizer.math.sharif.edu_DataLoader2021_Data2021.asdf.pdf
% c=pathsep
% isequal(class(p),class(c))
filename = 'book2.xlsx';
sheet = 1;
xlRange = 'A4:C363';
St = xlsread(filename,sheet,xlRange);
[n,m]=size(St);
s=[];
for i=1:n
    s(St(i,1),St(i,2))=St(i,3);
end
[m_S,n_S]=size(s);
Lt=xlsread(filename,'A410:B450');
[nl,ml]=size(Lt);
l1=zeros(n_S);
for i=1:nl
    l1(Lt(i,1))=Lt(i,2);
end
Ut=xlsread(filename,'A367:B406');
[nu,mu]=size(Ut);
u1=zeros(n_S);
for i=1:nu
    u1(Ut(i,1))=Ut(i,2);
end
Aeq=[];
beq=[];
b=zeros(m_S,1);
f=ones(n_S,1);
v=linprog(f,s,b,Aeq,beq,l1,u1);
filename = 'testdata.xlsx';
A = [v];
xlswrite(filename,A)
