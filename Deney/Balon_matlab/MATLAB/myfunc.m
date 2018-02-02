

function [] = myfunc(name,studentid,stepsize)

if strcmp(name,'ceren')==0
    display('name should be my name!!!');
else
    k=num2str(studentid);
    m=str2num(k(7));
    l=str2num(k(6));
    X=1:stepsize:2*pi;
    for n=2:m
        if mode(l,2)==0
            y=sin(n*X);
        else mode(l,2)
            y=cos(n*X);
        end
    end
    figure
    plot(X,y)
    grid on
end
        