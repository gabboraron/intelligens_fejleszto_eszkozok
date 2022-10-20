using LinearAlgebra
using PyPlot

meshgrid(xs, ys) = (repeat(xs, outer=length(ys)), repeat(ys, inner=length(xs)))

xs, ys = meshgrid(-10:1:10, -10:1:10)

xX= @. (10^(-3)) * (xs^2 +ys) * (xs-ys)
yY= @. log(Complex(ys-xs))/log(Complex(ℯ))

figure()
quiver(xs, ys, xX, yY)
display(gcf())

x2 = @. ((-y)^2) + 2*x
y2 = @. (x^2) + 3*x
df2(x,y) = [x2,y2]

quiver(xxs, yys, quiver=df, title="3. egyenlet vektortere")
