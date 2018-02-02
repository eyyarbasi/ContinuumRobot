load('pvst');
%m=size(p1);
p=zeros(1236,7); 
p_mean=zeros(1236,1);
p_std=zeros(1236,1);

for i=1:1236
     p(i,:)=[p1(i) p2(i) p3(i) p4(i) p5(i) p6(i) p7(i)];
     p_mean(i)=mean(p(i,:));
     p_std(:)=std(p(i,:));
end



%shadedErrorBar(t4,p_mean,p_std)
%figure
%plotyy(t,d1,t1,p1)

%plot(t1,p1)

figure
plot((1:size(p_mean))/30,p_mean)
plot((1:size(p1))/30,p1)