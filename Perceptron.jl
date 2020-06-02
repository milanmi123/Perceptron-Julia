module Perceptron
export fit
using Random
function fit(x,y,rate)
    a,b=size(x)
    arrOne=Array{Float64,2}(undef,a,1)
    fill!(arrOne,1)
    NewarrX=hcat(x,arrOne)
    w=Array{Float64,2}(undef,1,b+1)
    while true
        i=rand(1:a)
        if y[i]*(w*NewarrX[i,:])<=[0]
            w=w+(rate.*y[i].*NewarrX[i,:])'
            continue
        end
        pre=sgn(NewarrX,w)
        # println(w)
        # println(isequal(pre,y))
        if isequalm(pre,y)
            break
        end

    end
    return w
end
function isequalm(x,y)
    for i =1:length(x)
        if x[i]!=y[i]
            return false

        end
    end
    return true
end
function sgn(x,w)
    a,b=size(x)
    p=Array{Float64,2}(undef,a,1)
    for i =1:a
        c=w*x[i,:]
        # print(c)
        if c[1]>0
            c[1]=1
        else c[1]<0
            c[1]=-1
        end
        p[i]=c[1]
    end
    # print(typeof(p))
    return p
end

# k=[3 3;4 3;1 1]
# kkk=[1.0;1.0;-1.0]
# r=1
# fit(k,kkk,r)
end  # module Perceptron
