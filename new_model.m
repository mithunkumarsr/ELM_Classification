for i=7:12
fname=strcat('train',num2str(i),'.csv');
trdata=csvread(fname);
 nums = randi([1 size(trdata,1)],1,20000);
% trdata=trdata(nums,:);
fname=strcat('test',num2str(i),'.csv');
tsdata=csvread(fname);
% datan=[trdata;tsdata];
% datan(:,1:end-1)=normalizedata(datan(:,1:end-1));
% trdata=datan(1:size(trdata,1),:);
% tsdata=datan(size(trdata,1)+1:end,:); 



[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,ty1] = elm_kernel(trdata,tsdata, 1,0.1, 'sig_kernel',2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,ty2] = elm_kernel(trdata,tsdata, 1,0.1, 'RBF_kernel',2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,ty3] = elm_kernel(trdata,tsdata, 1,0.1, 'lin_kernel',2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,ty4] = elm_kernel(trdata,tsdata, 1,0.1, 'poly_kernel',2);
 
ty=[ty1',ty2',ty3',ty4',tsdata(:,end)];
fname=strcat(num2str(i),'onep.csv');
csvwrite(fname,ty);

end
