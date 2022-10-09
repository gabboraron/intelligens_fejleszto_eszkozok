# function to deriv
f(x) = x^2

#point to calculcate in
x_0 = 20

# step size
h = 10^-4

# deriv replacement
df(x_0) = (f(x_0 +h) - f(x_0))/ h

println(df(x_0))