function r = input_three_classic(time)
r = zeros(length(time),1);

for  i = 1:length(time)
    t = time(i);
    if t<5
        r(i) = 10*t;
    elseif t>=5 && t<10
        r(i) = 50;
    else
        r(i) = -5*(t-10)+50;
    end
end

end