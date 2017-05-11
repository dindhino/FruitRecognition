clc;
clear;

for i=1:6
    nama=strcat('Data_1301144360\Apple\Latih_Apple_1301144360_0',int2str(i),'.bmp');
    a=im2bw(imread(nama));
    a=(~a);
    model(1,i,:)=ekstraksi(a);
end
for i=1:6
    nama=strcat('Data_1301144360\Dataset Pear\Data Latih Pear\Latih_Pear_1301144360_0',int2str(i),'.bmp');
    a=im2bw(imread(nama));
    a=(~a);
    model(2,i,:)=ekstraksi(a);
end
for i=1:6
    nama=strcat('Data_1301144360\Dataset Strawberry\Data Latih Strawberry\Latih_Strawberry_1301144360_0',int2str(i),'.bmp');
    a=im2bw(imread(nama));
    a=(~a);
    model(3,i,:)=ekstraksi(a);
end
for i=1:6
    nama=strcat('Data_1301144360\Pisang\Latih_Banana_1301144360_0',int2str(i),'.bmp');
    a=im2bw(imread(nama));
    a=(~a);
    model(4,i,:)=ekstraksi(a);
end
save('modelmoment.mat','model');