classdef Stamina%固定支持面类
    properties
        f        %支持面形状函数句柄
        T        %弹性系数
        miu      %动摩擦因数
    end
    methods
        function NEW=Stamina(f,T,miu)
            if nargin==0
                f=@(x)0;
                T=1;
                miu=0;
            elseif nargin==1
                T=1;
                miu=0;
            elseif nargin==2
                miu=0;
            end
            NEW.f=f;
            NEW.T=T;
            NEW.miu=miu;
        end
        function plot(I,X)
            hold on
            x=X(1):0.02:X(2);
            plot(x,I.f(x))
        end
    end
end