function Physics()
    %f=@(x)x.^2/5;
    f=@(x)(abs(x)-1).^2/4;
    S=Stamina(f,1,0);
    R=Rope([0,-1],[1/4,1/4],2,0.9,[2,1]);
    A=Particle(1,0,1/4,8,4,[0.8,0,0],S,R,2);
    B=Particle(2,-1,1/4,8,4,[0,0.3,0.8],S,R,1);
    axis([-5,5,-1,5])
    for i=1:10000
        A.ROP=B.ROP;
        A=A.Move(0.01);
        B.ROP=A.ROP;
        B=B.Move(0.01);
        A=A.plot();
        B=B.plot();
        drawnow
    end
    clear()
end