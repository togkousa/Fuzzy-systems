function r = input_three(t)
if t<5
    r = 10*t;
elseif t>=5 && t<10
    r = 50;
else
    r = -5*(t-10)+50;
end

end