%% Co-ordinate Gradient Descent
% Main file
clear all; close all;
load test_batch;
outlabel=zeros(size(data,2),1);
clusterNum=max(labels)+1;
r=[]; w=[];
ctr=1;
N=size(data,2);
w=zeros(size(data,1),1);
data=im2double(data);
labels=double(labels);
lambda=0.1;
for i=1:1%size(data,1)
    Y=data(i,:);
    data(i,:)=[];
    tempval=w(i,1);
    tempindx=i;
    w(i,:)=[];
    w_out=solver(data',Y',w',lambda);
    if i==1
        w=[tempval w_out];
    elseif i==size(data,1)
        w=[w_out tempval];
    else
        w=[w_out(1:tempindx-1) tempval w_out(tempindx+1:end)];
    end
    [outlabel,ctr]=cluster(w,outlabel,ctr);
    accuracy(labels,outlabel);
end


