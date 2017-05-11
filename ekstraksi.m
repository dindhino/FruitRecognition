function hasil = ekstraksi(I)
I=(I);
m00=moments(I,0,0);
m10=moments(I,1,0);
m01=moments(I,0,1);

xc=round(m10/m00);
yc=round(m01/m00);

u00=centralmoment(I,xc,yc,0,0);
u20=centralmoment(I,xc,yc,2,0);
u02=centralmoment(I,xc,yc,0,2);
u11=centralmoment(I,xc,yc,1,1);
u30=centralmoment(I,xc,yc,3,0);
u03=centralmoment(I,xc,yc,0,3);
u12=centralmoment(I,xc,yc,1,2);
u21=centralmoment(I,xc,yc,2,1);

n20=u20/u00^2; 
n02=u02/u00^2; 
n11=u11/u00^2; 
n30=u30/u00^3; 
n03=u03/u00^3; 
n12=u12/u00^3; 
n21=u21/u00^3;

M1=n20+n02; 
M2=(n20-n02)^2+4*n11; 
M3=(n30-3*n12)^2+(3*n21-n03)^2; 
M4=(n30+n12)^2+(n21+n03)^2;
M5=(n30-3*n12)*(n30+n12)+(n30+n12)^2-(3*((n21-n03)^2))+(3*n21-n03)*(n21+n03)*(3*((n30+n12)^2))-((n21+n03)^2);
M6=(n20-n02)*((n30+n12)^2)-((n21+n03)^2)+4*n11*(n30+n12)*(n21+n03);
M7=(3*n21-n03)*(n30+n12)*((n30+n12)^2)-(3*((n21+n03)^2))+(3*n12-n30)*(n21+n03)*(3*((n12+n30)^2))-((n21+n03)^2);
hasil=[M1,M2,M3,M4,M5,M6,M7];
end

