function exercise3( )
t=-2:0.1:2;
subplot(2,1,1);plot(t,sin(2*pi*t));
subplot(2,1,2);stem(t,sin(2*pi*t));
figure;
subplot(2,1,1);plot(t,heaviside(t)-heaviside(t-1));
subplot(2,1,2);stem(t,heaviside(t)-heaviside(t-1));
figure;
subplot(2,1,1);plot(t,2*t.*heaviside(t)-(t-1).*heaviside(t-1)+heaviside(t+1));
subplot(2,1,2);stem(t,2*t.*heaviside(t)-(t-1).*heaviside(t-1)+heaviside(t+1));
syms x t k T K X;
fun1=@(x)(sin(2*pi*x))^2;
energy=limit(int(fun1,x,-X,X),X,inf);
power=limit((int(fun1,x,-X/2,X/2))/X,X,inf);
disp("a.energy:");
disp(energy);
disp(" power:");
disp(power);
fun2=@(t)(heaviside(t)-heaviside(t-1))^2;
energy=limit(int(fun2,t,-T,T),T,inf);
power=limit((int(fun2,t,-T/2,T/2))/T,T,inf);
disp("b.energy:");
disp(energy);
disp(" power:");
disp(power);
fun3=@(k)(2*k.*heaviside(k)-(k-1).*heaviside(k-1)+heaviside(k+1))^2;
energy=limit(int(fun3,k,-K,K),K,inf);
power=limit((int(fun3,k,-K/2,K/2))/K,K,inf);
disp("c.energy:");
disp(energy);
disp(" power:");
disp(power);

end

