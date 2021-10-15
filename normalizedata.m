function [ ndata ] = normalizedata( data )

for i=1:size(data,2)
       ndata(:,i)=(data(:,i)-min(data(:,i)))/(max(data(:,i))-min(data(:,i)));
end


end

