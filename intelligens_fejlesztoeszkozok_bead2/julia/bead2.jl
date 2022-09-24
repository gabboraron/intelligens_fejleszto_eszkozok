# 1 feladat
function f11(x)
    x^6/6+x^4/2+x^3/3+x^2/2+1
end

# 2 feladat
function f2(x)
    3+3x+2+2*ℯ^(2*x)+3*x*ℯ^(2*x)
end

### function plotter
    LONG=Int(1e4) #step number
    δ=0.001
    l=LONG-1 

    hf1 = zeros(LONG)
    hf2 = zeros(LONG)
    m = zeros(LONG)
    
    hf1[1] = f11(-5)
    hf2[1] = f2(-5)
    m[1] = -5


    for i in 1:l
        hf1[i] = f11(m[i])
        hf2[i] = f2(m[i])
        m[i+1] = m[i]+δ
    end

    using PyPlot
    figure()
    plot(m[1:l],hf1[1:l])
    display(gcf())

    using PyPlot
    figure()
    plot(m[1:l],hf2[1:l])
    display(gcf())
