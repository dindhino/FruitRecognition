function jumlah  = segmemtasi(input)
directions=[0,1
            -1,1
            -1,0
            -1,-1
            0,-1
            1,-1
            1,0
            1,1];
         
map(1,:)=[4,3,2,1,8,7,6,5];
map(2,:)=[5,4,3,2,1,8,7,6];
map(3,:)=[6,5,4,3,2,1,8,7];
map(4,:)=[7,6,5,4,3,2,1,8];
map(5,:)=[8,7,6,5,4,3,2,1];
map(6,:)=[1,8,7,6,5,4,3,2];
map(7,:)=[2,1,8,7,6,5,4,3];
map(8,:)=[3,2,1,8,7,6,5,4];
input=im2bw(input);
input=(~input);
jumlah=0;
[m,n]=size(input);
for i=1:m
    for j=1:n
        visi(i,j)=0;
    end
end
for i=1:m
    for j=1:n
        if (input(i,j) > 0) && visi(i,j)~=2
            start=i;
            start(2)=j;
            panjang=0;
            lebar=0;
            hp=1;
            hl=1;
            coord=start;
            dir=1;
            idx=1;
            visi(i,j)=2;
            hp=1;
            hl=1;
            status=1;
            while (status==1)
                index=map(dir,idx);
                newdir=directions(index,:);
                newcoord=coord+newdir;
                if all(newcoord>0) && (input(newcoord(1),newcoord(2))==1)  && input(newcoord(1),newcoord(2))
                    visi(newcoord(1),newcoord(2))=2;
                    panjang(hp)=newcoord(1);
                    lebar(hl)=newcoord(2);
                    hp=hp+1;
                    hl=hl+1;
                    coord=newcoord;
                    dir=index;
                    idx=1;
                else
                    idx=idx+1;
                end
                if all(newcoord==start) 
                    status=0;
                end
            end
                minp=min(panjang());
                maxp=max(panjang());
                minl=min(lebar());
                maxl=max(lebar());
                visi(minp:maxp,minl:maxl)=2;
                jumlah=jumlah+1;
                imwrite(input(minp:maxp,minl:maxl),strcat(num2str(jumlah),'.jpg'));
        end
    end
end
end