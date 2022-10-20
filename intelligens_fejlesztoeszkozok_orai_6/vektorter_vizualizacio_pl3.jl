# felhasznalva: https://discourse.julialang.org/t/anyone-have-a-plots-quiver-example/1369
# 2022 10 16


using GR
x = linspace(-2, 2, 21)
y = x
X, Y = meshgrid(x,y)
z = X.*exp(-X.^2 - Y.^2)
contour(x, y, z)
u, v = GR.gradient(x, y, z)
quiver(x, y, u, v)