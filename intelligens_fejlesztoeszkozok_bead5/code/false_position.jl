#original function
f(x) = 5*x-4-sin(tanh(-3*x+2))

#updating function
C(a,b) = b - f(b) * (b-a)/(f(b)-f(a))

#precision
ϵ = 10e-7

# intrevall
a = -10
b = 10
c = 0

while (true)
    global a 
    global b
    global c
    c  =  C(a,b)

    println("c = ",c)
    println("f(c) = ",f(c))
    println()
    
    if sign(f(c)) == sign(f(a))
        a = c
    end
    if sign(f(c)) == sign(f(b))
        b = c
    end
    if abs(f(c)) < ϵ
        break
    end
end


h = ϵ
LONG=Int(2e4) #step number
l=LONG-1
m = zeros(LONG)
data = zeros(LONG)

m[1] = a
data[1] = f(a)


for i in 1:l
    # deriv replacement
    data[i] = f(m[i])
    m[i+1] = m[i]+h
    #println(dg(x₀))
end

#i = 1
#while i < b
#    # deriv replacement
#    data[i] = -f(m[i])
#    m[i+1] = m[i]+h
#    i = i + h
#end

using PyPlot
figure()
plot(m[1:l],data[1:l])
vlines(c, -0.19, 0, linestyles ="dotted", colors ="k")
display(gcf())