%% Accuracy computation
% Input: Label vector, Sparse Vector
% Output: Accuracy
% Note: Run from main.m
function[acc]=accuracy(labels,sparsevector)
%% Accuracy calculation
labels=labels+1;
numClasses=max(labels);
N=length(labels);
count=0;
for k=1:numClasses
    temp=find(sparsevector==k);
    combos = nchoosek(temp,2);
    for i=1:size(combos,1)
        if(labels(combos(i,1))~=labels(combos(i,2)))
            count=count+1;
        end
    end
end
err=count/nchoosek(N,2);
err=20*err;
acc=(1-err)*100
% end
