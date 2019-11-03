function r = input_two_classic(time)
r = zeros(length(time),1);

for  i = 1:length(time)
    t = time(i);
    if t<5
        r(i) = 50;
    elseif t>=5 && t<10
        r(i) = 20;
    else
        r(i) = 40;
    end
end

end