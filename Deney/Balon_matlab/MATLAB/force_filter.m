clear c;

for i=1:7
    n=1;
    for j=1:size(force1,1)
        if force1(j,i)>0.1
            c(n,i)=force1(j,i);
            n=n+1;
        end
    end
end

t=1:size(c,1);

figure
plot(t,c(:,1),t,c(:,2),t,c(:,3),t,c(:,4),t,c(:,5),t,c(:,6),t,c(:,7))
grid on
xlabel('Time [ms]')
ylabel('Axial Force [N]')
