# felhasznalva: https://github.com/JuliaPlots/ExamplePlots.jl/blob/master/notebooks/quiver.ipynb
# 2022 10 16


using Plots
pyplot(leg=false, size=(500,300))

n = 10
y = rand(n)
vx, vy = randn(n), randn(n)

quiver(y, quiver=(vx,vy))

##########################

e(x,y) = exp(-x^2-y^2)
f(x,y) = x * e(x,y)
x = -2:0.2:2
contour(x,x,f, xlim=(-2,2), ylim=(-2,2), fill=true)