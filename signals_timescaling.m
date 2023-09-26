%taking input of discreate time signal responses
x = input('Enter x[n] in list of number/madgnitude =');
%Taking index of origin from the user
index_origin = input('Enter origin index = ');
%insted of taking at+b tanikh a and b in terms of array
coeff = input("enter 'at+b'(scaling and shifting) as [a,b] = ");
origin = x(index_origin);
a=coeff(1);
b=coeff(2);
%rewriting x where t<0
x_tless = x(1:index_origin-1);
%rewriting x where t>0
x_tgreater = x(index_origin+1:length(x));
for i=1:length(x_tless)
    xtless(i) = x_tless(length(x_tless)-i+1);
end
tless_s= -length(xtless):1:-1;
%time scaling where t==>a*t
tless_scale = tless_s/a;
tgreate_s = 1:length(x_tgreater);
tgreate_scale = tgreate_s/a;
%finalized array of time
t_scale = [tless_scale,0,tgreate_scale];
%just writng responses of signal
x_scaling = [x_tless,origin,x_tgreater];
%shifting the time t==>t+/-b
tsacle_final =[tless_scale-b,0-b,tgreate_scale-b];
t =[tless_s,0,tgreate_s];
%plotting graph
figure;
subplot(1, 3, 1);
stem(t,x,'LineWidth',2,'MarkerFaceColor','red','MarkerEdgeColor','green');
xlabel('X[t]');
ylabel('time');
subplot(1, 3, 2);
stem(t_scale,x_scaling,'LineWidth',2,'MarkerFaceColor','red','MarkerEdgeColor','green');
xlabel('X[at]');
ylabel('time');
title('scaling');
subplot(1, 3, 3);
stem(tsacle_final,x_scaling,'LineWidth',2,'MarkerFaceColor','red','MarkerEdgeColor','green');
xlabel('X[at+b]');
ylabel('time');
title('final=Scaling +Shifting');