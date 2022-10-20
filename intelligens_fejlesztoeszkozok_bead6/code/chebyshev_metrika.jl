using LinearAlgebra
using PyPlot

chebyshev(x,y) = maximum(x .- y )
function chebyshev2(x::Vector,y::Vector)
    n = length(x)
    tmp = zeros(n)
    for i in 1:n
        tmp[i] = x[i] - y[i]
    end

    tmp2 = maximum(tmp)
return tmp2
end

x = [0,0]
y = [1,1]

tmp = chebyshev(x,y)
println(x,y, tmp)


y = [0,0]
x = [1,1]

tmp = chebyshev(x,y)
println(x,y, tmp)


x = [10,10]
y = [1,1]

tmp = chebyshev(x,y)
println(x,y, tmp)

x = [-10,-10]
y = [1,1]

tmp = chebyshev(x,y)
println(x,y, tmp)


x =  rand(20)
y =  rand(20)

tmp = chebyshev(x,y)
println(x,y, tmp)
