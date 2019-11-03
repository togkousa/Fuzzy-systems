function y = numerical_solution(time,initial_vector,A,B,C,controller,ke,kd,k1,input)
%% Numerical solution

% Initialize - first step
u_prev = 0;
y_prev = 0;
e_prev = 1;
T = 0.01;

x = initial_vector;
y = zeros(length(time),1);
r = input(time(1));

e = (r - y_prev)/50;
de = (e - e_prev);

e_prev = e;

in1 = ke * e;
if in1 > 1
    in1 = 1;
elseif in1 < -1
    in1 = -1;
end

in2 = kd*de / T;

if in2 > 1
    in2 = 1;
elseif in2 < -1
    in2 = -1;
end

out = k1* T * evalfis([in1 in2],controller)*50;
u_prev = u_prev + out;

x = x + T*(A*x + B*u_prev);
y(1) = C*x;

%% All other steps

for i = 2:length(time)
    
    t = time(i);
    r = input(t);
    y_prev = y(i-1);
    
    e = (r - y_prev)/50;
    de = (e - e_prev);
    e_prev = e;

    in1 = ke*e;
    if in1 > 1
        in1 = 1;
    elseif in1 < -1
        in1 = -1;
    end

    in2 = kd * de / T;
    if in2 > 1
        in2 = 1;
    elseif in2 < -1
        in2 = -1;
    end
    
    
    out = k1* T * evalfis([in1 in2],controller)*50;
    u_prev = u_prev + out;
    x = x + T*(A*x + B*u_prev);
    y(i) = C*x;

end



end