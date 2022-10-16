# function to deriv
f(x) = (3*x^2+2*ℯ^(3*x+2))/(x+1)

#point to calculcate in
x₀ = -0.5
x₁ = 0.5

# step size
h = 10^-3
LONG=Int(1e3) #step number
l=LONG-1
m = zeros(LONG)
data = zeros(LONG)

m[1] = x₀
data[1] = f(-0.5)

for i in 1:l
    # deriv replacement
    df = (f(m[i] +h) - f(m[i]))/ h
    data[i] = df
    m[i+1] = m[i]+h
    #println(df(x₀))
end

using PyPlot
figure()    
plot(m[1:l],data[1:l])
display(gcf())
