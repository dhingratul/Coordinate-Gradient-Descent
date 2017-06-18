%% Clustering
% Input: weight vector, output label, counter
% Output: Output label, counter
% Note: Run from main.m
function[outlabel,ctr]=cluster(vector,outlabel,ctr)
A=find(vector~=0)
for i=1:size(A,2)
    outlabel(A(1,i),1)=ctr;
end
ctr=ctr+1;
end