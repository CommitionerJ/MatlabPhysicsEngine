classdef Orbit %轨道类
    properties
        N      %画线长度
        h      %对象数组
        RGB    %color
    end
    methods
        function I=Orbit(N,RGB)
            if nargin>0
                if nargin>1
                    I.RGB=RGB;
                else
                    I.RGB=[0,0.8,0];
                end
                    I.N=N;
            else
                I.N=10;
            end
        end
        function I=In(I,x,y)
            hold on
            l=length(I.h);
            if l<I.N
                H=plot(x,y,'.','color',I.RGB);
                I.h(l+1)=H;
            else
                delete(I.h(1))
                I.h(1:I.N-1)=I.h(2:I.N);
                I.h(I.N)=plot(x,y,'.','color',I.RGB);
            end
        end
    end
end
