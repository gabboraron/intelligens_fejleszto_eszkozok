xs = -10:1:10
ys = -10:1:10

using LinearAlgebra

x= @. (10^(-3)) * (x^2 +y) * (x-y)
#y= @. log(complex(y-x))/log(complex(ℯ))
y= @. log(y-x)

df(x,y) = [x,y]

xxs = [x for x in xs for y in ys]
yys = [y for x in xs for y in ys]

quiver(xxs, yys, quiver=df, title="2. egyenlet vektortere")