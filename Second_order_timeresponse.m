syms s t;
t1 = 0:0.1:10;%for graph
G(s) = input("Enter transfer functionG(s) = ");
R(s) = input("enter input response");
C(s) = R(s)*G(s);
%finding denominator
[n,w(s)] = numden(C(s));
deltas = solve(w(s),s)
%solution delta1 and delta 2
% deltas(1) =0
delta1 = deltas(2);
delta2 = deltas(3);
%finding imaginary and Real parts
delta1_real = real(delta1);
delta1_imag = imag(delta1);
delta2_real = real(delta2);
delta2_imag = imag(delta2);
if delta1_imag ==0
    if delta2_imag ==0
        if delta1_real ==delta2_real
            disp("Criticallly Damped");
        else
            disp("Over Damped");
        end
    end

elseif delta1_imag ~=0
    if delta2_imag ~=0
        if delta1_real ==0
            if delta2_real ==0
                disp("Un damped");
            end
        else
            disp("under damped");
        end
    end
 end   

     

C(t) = ilaplace(C(s));
plot(t1,C(t1));
