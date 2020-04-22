classdef Particle
    properties
        m
        x
        y
        vx
        vy
        O            %轨道
        STA          %支持面对象
        flag         %正常为零，在面内则为1
    end
    
    methods
        function NEW=Particle(m,x,y,vx,vy,STA)      %构造函数
            if nargin<4
                vx=0;
                vy=0;
                STA=Stamina;
            elseif nargin<6
                STA=Stamina;
            end
            NEW.vx=vx;
            NEW.vy=vy;
            NEW.m=m;
            NEW.x=x;
            NEW.y=y;
            NEW.O=Orbit(15,[0.8,0,0]);
            NEW.STA=STA;
            NEW.flag=0;
            plot(-5:0.1:5,STA.f(-5:0.1:5));
        end
        
        function I=Move(I,dt)                %运动函数（I为质点变量dt为时间步长）N为运动次数
            Y=[I.x,I.y,I.vx,I.vy];
            
            if I.STA.f(Y(1))>Y(2)&&I.flag==0               %反弹条件
                fx=(I.STA.f(Y(1)+0.0001)-I.STA.f(Y(1)-0.0001))/0.0002;
                fn=sqrt(1+fx^2);
                n=[-fx/fn,1/fn];
                X=I.vx-(I.STA.T+1)*n(1)*(n(1)*I.vx+n(2)*I.vy);
                I.vy=I.vy-(I.STA.T+1)*n(2)*(n(1)*I.vx+n(2)*I.vy);
                I.vx=X;
                I.flag=I.STA.f(Y(1))>Y(2);
                return
            end
            I.flag=I.STA.f(Y(1))>Y(2);
            
            Y=rkn4(@CreatA,dt,Y);
            I.x=Y(1);I.y=Y(2);I.vx=Y(3);I.vy=Y(4);
            
            
            function dy=CreatA(Y)               %构造加速度
                
                if 1%abs(I.STA.f(Y(1))-Y(2))<0.00001
                    %fx=(I.STA.f(Y(1)+0.0001)-I.STA.f(Y(1+0.0001)))/0.0002;
                    %fn=sqrt(1+fx^2);
                    %n=[-fx/fn,1/fn];
                    %miu=I.STA.miu;
                    %SIN=
                    dy=[Y(3),Y(4),0,-10];
                else
                    dy=[Y(3),Y(4),0,-10];
                end
            end
            function y=rkn4(f,dx,y)         %四阶龙格库塔算法
                y0=y;
                dy1=f(y);y=y0+dx*dy1/2;
                dy2=f(y);y=y0+dx*dy2/2;
                dy3=f(y);y=y0+dx*dy3;
                dy4=f(y);y=y0+dx*(dy1+2*(dy2+dy3)+dy4)/6;
            end
            
        end
        
        function I=plot(I)                %轨迹绘制函数
            I.O=I.O.In(I.x,I.y);
            
            drawnow
        end
    end
end