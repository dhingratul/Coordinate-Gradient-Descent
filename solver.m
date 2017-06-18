%% Co-ordinate Gradient Descent Solver
% Input: X, Y, w, Lambda
% Output: w vector
% Note: Run from main.m
function [w]=solver(X,Y,w,lambda)

for j=1:size(X,1)
    tempX=X(:,j);
    X(:,j)=[];
    tempw=w(:,j);
    tempindx=j;
    w(:,j)=[];
    for i=1:size(X,1)
        r(i,j)=Y(i,1)-sum(w.*X(j,:));
    end
    w(1,j)=1/size(X,1)*sum(tempX.*r(:,j));
    w(1,j) = wthresh(w(1,j),'s',lambda);
    
    if j==1
        w=[tempw w];
        X=[tempX X];
    elseif i==size(X,1)
        w=[w tempw];
        X=[X tempX];
    else
        w=[w(1:tempindx-1) tempval w(tempindx+1:end)];
        X=[X(1:tempindx-1) tempX X(tempindx+1:end)];
    end
    
end


end
% load test_batch;
% sparsevector=im2double(data);
% idx=kmeans(sparsevector,10);
% accuracy(labels,idx);
