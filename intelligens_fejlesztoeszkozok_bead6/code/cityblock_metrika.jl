using LinearAlgebra
using PyPlot

function cityblock(x::Vector,y::Vector)
    n = length(x)
    tmp = zeros(n)
    for i in 1:n
        tmp[i] = abs(x[i] - y[i])
    end

    tmp2 = sum(tmp)
return tmp2
end

x = [0,0]
y = [1,1]

tmp = cityblock(x,y)
println(x,y, tmp)


y = [0,0]
x = [1,1]

tmp = cityblock(x,y)
println(x,y, tmp)


x = [10,10]
y = [1,1]

tmp = cityblock(x,y)
println(x,y, tmp)

x = [-10,-10]
y = [1,1]

tmp = cityblock(x,y)
println(x,y, tmp)


x =  rand(20)
y =  rand(20)

tmp = cityblock(x,y)
println(x,y, tmp)
