function Physics()
    %f=@(x)x.^2/5;
    f=@(x)(abs(x)-1).^2/2;
    S=Stamina(f,1,0);
    A=Particle(1,0,10/4,8,4,S);
    %B=Particle(1,0,1/4,7.99,4,S);
    axis([-5,5,-1,5])
    for i=1:10000
        A=A.Move(0.01);
        %B=B.Move(0.01);
        A=A.plot();
        %B=B.plot();
        E=A.y*10+0.5*A.m*(A.vx^2+A.vy^2)
    end
    clear()
end