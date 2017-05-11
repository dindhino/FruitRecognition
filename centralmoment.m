function hasil = centralmoment(I,xc,yc,p,q)
[m,n]=size(I);
hasil=0;
for i=1:n
    for j=1:m
        hasil=hasil+(i-xc)^p*(j-yc)^q*I(j,i);
    end
end
end

