classdef Stamina%�̶�֧������
    properties
        f        %֧������״�������
        T        %����ϵ��
        miu      %��Ħ������
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