for i=1:2000
    for j=1:5
        if pwm100(i,j)==0
            pwm100(i,j)=NaN;
        end
    end
end