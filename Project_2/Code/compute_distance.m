function [dh, dv] = compute_distance(position)
x = position(1);
y = position(2);

if y<1
    dh = 5-x;
    dv = y;
elseif y>=1 && y<2
    dh = 6-x;
    dv = y-1;
elseif y>=2 && y<3
    dh = 7-x;
    dv = y-2;
else
    dh = 1;
    dv = y-3;
end


end