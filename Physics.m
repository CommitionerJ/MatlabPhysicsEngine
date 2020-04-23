function Physics()
    %f=@(x)x.^2/5;
    f=@(x)(abs(x)-1).^2/4;
    S=Stamina(f,0.5,0.1);
    A=Particle(1,0,1/4,8,4,S);
    axis([-5,5,-1,5])
    for i=1:10000
        A=A.Move(0.01);
        A=A.plot();
    end
    clear()
end