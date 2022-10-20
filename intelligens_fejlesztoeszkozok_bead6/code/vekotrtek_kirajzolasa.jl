# felhasznalva: https://github.com/JuliaPlots/ExamplePlots.jl/blob/master/notebooks/quiver.ipynb
# 2022 10 16

# feladat: (10^(-3) )* (x^2 +y)(x-y)
#          ln(y-x)

x = [10]
for i in range(1,10)
    x[i] = 
end

using Plots
pyplot(leg=false, size=(500,300))

n = 10
y = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
vx, vy = randn(n), randn(n)

quiver(y, quiver=(vx,vy))

##########################

f(x,y) = (10^(-3)) * (x^2 +y) * (x-y)
g(x,y) = log(y-x)
x = -10:1:10
y = -10:1:10
contour(x, y, (g), xlim=(-10,10), ylim=(-10,10), fill=true)
quiver(x, y, f(x,y), g(x,y))