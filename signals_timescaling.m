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
tgreter_s = 1:1:length(x_tgreater);
t_shifting = [tless_s-b,0-b,tgreter_s-b];
x_tshifting = [x_tless,0,x_tgreater];
t= [tless_s,0,tgreter_s];
t_s= t_shifting/a;

k=1;
t_integers = t_s(floor(t_s) == t_s);
for j = t_integers
    index_t_s(k)= find(t_s == j);
    k=k+1;
end
for l =1:length(index_t_s)
    x_sc(l) = x_tshifting(index_t_s(l));
end
figure;
subplot(1, 3, 1);
stem(t,x,'LineWidth',2,'MarkerFaceColor','red','MarkerEdgeColor','green');
xlabel('X[t]');
ylabel('time');
subplot(1, 3, 2);
stem(t_shifting ,x_tshifting,'LineWidth',2,'MarkerFaceColor','red','MarkerEdgeColor','green');
xlabel('X[t+b]');
ylabel('time');
title('shifting');
subplot(1, 3, 3);
stem(t_integers,x_sc,'LineWidth',2,'MarkerFaceColor','red','MarkerEdgeColor','green');
xlabel('X[at+b]');
ylabel('time');
title('final=Scaling +Shifting');
