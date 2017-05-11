function out = glcm(img)
img=rgb2gray(img);
img=gray2ind(img,4);
[h w]=size(img);
img=img+1;
maks=max(max(img));
maks=maks;
matrik2=zeros(maks,maks);
for i=1:h
    for j=1:w-1
        matrik2(img(i,j),img(i,j+1))=matrik2(img(i,j),img(i,j+1))+1;
    end
end
maxi=max(max(matrik2));
matrik2=(matrik2)/maxi;
asm=sum(sum(matrik2.^2));
energi=asm.^(1/2);
[i,j]=size(matrik2);
contras=0;
entropi=0;
homogen=0;
meani=0;
meanj=0;
for k=1:i
    for l=1:j
        contras=contras+(k-l).^2*matrik2(k,l);
        entropi=-1*entropi+matrik2(i,j)*log(matrik2(k,l));
        homogen=homogen+matrik2(k,l)/(1+(k-l).^2);
        meani=meani+k*matrik2(k,l);
		meanj=meanj+l*matrik2(k,l);
	end
end
vri=0;
vrj=0;
for k=1:i
    for l=1:j
		vri=vri+matrik2(k,l)*(k-meani).^2;
		vrj=vrj+matrik2(k,l)*(k-meanj).^2;
	end
end

korelasi=0;
variansi=0;
for k=1:i
    for l=1:j
	korelasi=korelasi+((k-meani)*(l-meanj))/(vri*vrj).^(1/2);
	variansi=variansi+(k-meani)*(l-meanj)*matrik2(k,l);
	end
end

out=[asm,energi,contras,entropi,homogen,korelasi,variansi];

end