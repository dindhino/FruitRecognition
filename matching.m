function hasil = matching(input)
load modelmoment.mat
% model1 = model(1,:)';
%     model2 = model(2,:)';
%     model3 = model(3,:)';
%     model4 = model(4,:)';
%     model5 = model(5,:)';
%     d1 = norm(ciribentuk-model1);
%     d2 = norm(ciribentuk-model2);
%     d3 = norm(ciribentuk-model3);
%     d4 = norm(ciribentuk-model4);
%     d5 = norm(ciribentuk-model5);
%     d = [d1;d2;d3;d4;d5];
%     [id,d] = sort(d);
%     hasil = d(1);
ind=0;
for i=1:4
	for j=1:6
		ind=ind+1;
		d(ind,:)=model(i,j,:);
	end
end

for i=1:24
	ha(i)=norm(d(ind)-input);
end
[id,da]=sort(ha);

hasil=da(1);
id(1);
end

