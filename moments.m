function hasil = moments(I,p,q)
 [m,n]=size(I);
 hasil=0;
for i=1:n
    for j=1:m
        hasil=hasil+i^p*j^q*I(j,i);
    end
end
end

