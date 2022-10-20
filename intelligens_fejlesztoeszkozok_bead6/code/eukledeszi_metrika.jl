using LinearAlgebra
using PyPlot

eclidean(x,y) = @. sqrt(sum((x - y))^2)

x = [0,0]
y = [1,1]

tmp = eclidean(x,y)
println(x,y, tmp)


y = [0,0]
x = [1,1]

tmp = eclidean(x,y)
println(x,y, tmp)


x = [10,10]
y = [1,1]

tmp = eclidean(x,y)
println(x,y, tmp)

x = [-10,-10]
y = [1,1]

tmp = eclidean(x,y)
println(x,y, tmp)


x =  rand(20)
y =  rand(20)

tmp = eclidean(x,y)
println(x,y, tmp)
