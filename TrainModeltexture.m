clc;
clear;

for i=1:6
    nama=strcat('Data_1301144360\Apple\Latih_Apple_1301144360_0',int2str(i),'.bmp');
    a=imread(nama);
	model(1,i,:)=glcm(a);
end
for i=1:6
    nama=strcat('Data_1301144360\Dataset Pear\Data Latih Pear\Latih_Pear_1301144360_0',int2str(i),'.bmp');
    a=imread(nama);
	model(2,i,:)=glcm(a);
end
for i=1:6
    nama=strcat('Data_1301144360\Dataset Strawberry\Data Latih Strawberry\Latih_Strawberry_1301144360_0',int2str(i),'.bmp');
    a=imread(nama);
	model(3,i,:)=glcm(a);
end
for i=1:6
    nama=strcat('Data_1301144360\Pisang\Latih_Banana_1301144360_0',int2str(i),'.bmp');
    a=imread(nama)
	model(4,i,:)=glcm(a);
end
save('modeltexture.mat','model');