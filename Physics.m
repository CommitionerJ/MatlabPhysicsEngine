function Physics()
    f=@(x)x.^2/5;
    S=Stamina(f,0.95,0);
    A=Particle(1,0,1,6,6,S);
    axis([-5,5,-1,5])
    for i=1:10000
        A=A.Move(0.01);
        A=A.plot();
    end
    clear()
end