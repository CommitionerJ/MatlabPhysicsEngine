classdef Rope %无质量绳
    properties
        X       %始末x位置
        Y       %始末y位置
        l       %绳长
        T       %反弹系数
        LINE    %绳线绘图
        PAR     %1,2对象
        M       %1,2对象质量
        Lc      %质心距1的长度
        Vc      %质心速度
    end
    methods
        function NEW=Rope(X,Y,l,T,M)
            NEW.X=X;
            NEW.Y=Y;
            NEW.M=M;
            NEW.Lc=M(2)/(M(2)+M(1));
            NEW.Vc=zeros(2,1);
            if (X(1)-X(2))^2+(Y(1)-Y(2))^2>l^2
                error('Not Long Enough!Can''t Band Two Object!')
            else
                NEW.l=l;
                NEW.T=T;
            end
        end
        function I=band(I,PAR1)
            I.PAR(PAR1.ropenum)=PAR1;
        end
        function I=plot(I)
            delete(I.LINE)
            if (I.X(1)-I.X(2))^2+(I.Y(1)-I.Y(2))^2-I.l^2>0
                I.LINE=plot([I.X(1),I.X(2)],[I.Y(1),I.Y(2)],'color',[1,0,0]);
            else
                I.LINE=plot([I.X(1),I.X(2)],[I.Y(1),I.Y(2)],...
                    'linestyle','-.','color',[0,0,1]);
            end
        end
    end
end