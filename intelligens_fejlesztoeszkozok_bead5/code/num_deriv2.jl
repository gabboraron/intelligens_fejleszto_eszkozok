# function to deriv
g(x) = (x^2-5x)/(1+cos(2x))

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
    dg = (g(m[i] +h) - g(m[i]))/ h
    data[i] = dg
    m[i+1] = m[i]+h
    #println(dg(x₀))
end

using PyPlot
figure()    
plot(m[1:l],data[1:l])
display(gcf())
