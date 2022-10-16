g(x)=cos(x-6) + x

a=2
ϵ=10e-7
while true
    global a
    b=g(a)
    c = g(b)
    p = a - ((b-a)^2)/(a-2b+c)
    a = p

    println("a= ",a)
    println("b= ",b)
    println("c= ",c)
    println("p= ",p)
    println("g(a)= ",g(a))
    println("f(a)= ",g(a)-a)
    if abs(a-g(a))<ϵ
        break
    end
end


#### abrazolas
h = ϵ
LONG=Int(3e7) #step number
l=LONG-1
m = zeros(LONG)
data = zeros(LONG)

m[1] = 2
data[1] = g(2)

for i in 1:l
    # deriv replacement
    data[i] = g(m[i])
    m[i+1] = m[i]+h
    #println(dg(x₀))
end

using PyPlot
figure()
plot(m[1:l],data[1:l])
vlines(a, -0.2, 0.2, linestyles ="dotted", colors ="k")
display(gcf())