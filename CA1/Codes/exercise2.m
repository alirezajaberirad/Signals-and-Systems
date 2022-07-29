function exercise2()
    x=[zeros(1,8) (1/2).^(0:2) zeros(1,6)];
    n=-24:24;
    h1=zeros(1,17); 
    h1(7)=1;
    h1(8:9)=-1;
    h1(10)=1;
    a=zeros(1,8);
    b=ones(1,2);
    c=2*ones(1,7);
    h2=[a b c].*[a 1*(1/3).^(0:8)];
    h=conv(h1,h2);
    firstOutput=conv(conv(x,h1),h2);
    secondOutput=conv(conv(x,h2),h1);
    thirdOutput=conv(x,h);
    subplot(3,1,1);stem(n,firstOutput);
    subplot(3,1,2);stem(n,secondOutput);
    subplot(3,1,3);stem(n,thirdOutput);
end