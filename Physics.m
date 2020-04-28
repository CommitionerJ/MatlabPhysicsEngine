function Physics()
    %f=@(x)x.^2/5;
    %f=@(x)(abs(x)-1).^2/4;
    f=@(x)0;
    S=Stamina(f,1,0);
    R=Rope([0,-1],[1/4,1/4],2,1,[2,1]);
    A=Particle(1,0,1/4,6,3,[0.8,0,0],S,R,2);
    B=Particle(2,-1,1/4,-3,-1.5,[0,0.3,0.8],S,R,1);
    axis([-5,5,-1,5])
    for i=1:10000
        A.ROP=B.ROP;
        A=A.Move(0.01);
        B.ROP=A.ROP;
        B=B.Move(0.01);
        A=A.plot();
        B=B.plot();
        E=A.y*A.m*10+0.5*A.m*(A.vx^2+A.vy^2)+B.y*10*B.m+0.5*B.m*(B.vx^2+B.vy^2)
        drawnow
    end
    clear()
end