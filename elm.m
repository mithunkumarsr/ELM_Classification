clear
clc
for ea=1:30
    edata=strcat(num2str(ea),'.csv');
    x1=load(edata);
    trset=x1(:,1:20);
    bugs=x1(:,21);
    for i=1:length(bugs)
    if bugs(i)==0
        bugs(i)=0;
    else
        bugs(i)=1;
    end
    end
    type = 'classification';
    L_fold = 10;
    for j=1:11
        if j==1
            X=trset;
            Y=bugs;
            gam = 10;
            sig2 = 0.2;
        elseif j==7
            fsdata=strcat('fs',num2str(j-1),'.mat');
            load(fsdata);
            X=sa{ea};
            Y=bugs;
        else
            fsdata=strcat('fs',num2str(j-1),'.mat');
            load(fsdata);
            sa1=sa(ea,:);
            sa2=sa1(sa1>0);
            X=trset(:,sa2);
            Y=bugs;
        end 
X=normalizedata( X );
indices = crossvalind('Kfold',bugs,5); 
tr1=X;
tr1(:,size(tr1,2)+1)=Y;
act=zeros(1,size(tr1,1),1);
pre=zeros(1,size(tr1,1),1);
for k=1:5
     test1 = (indices == k); 
     train1 = ~test1;
     ntraindata=tr1(train1,:);
     ntestdata=tr1(test1,:);
    [ypre] = model4(ntraindata,ntestdata);
    act(indices==k)=tr1(test1,size(tr1,2));
    pre(indices==k)=ypre;
end
actval{ea,j}=act;
prevalue{ea,j}=pre;
       
end  

end
