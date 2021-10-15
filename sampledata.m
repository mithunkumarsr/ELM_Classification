for i=1:12
    fname=strcat('train',num2str(i),'.csv');
    trdata=csvread(fname);
    nums = randi([1 size(trdata,1)],1,10000);
    trdata=trdata(nums,:);
    fname=strcat('./sample_data/train',num2str(i),'.csv');
    csvwrite(fname,trdata);
end