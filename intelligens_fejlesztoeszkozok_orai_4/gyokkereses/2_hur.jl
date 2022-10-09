f(x)=6*x+3-tanh(tan(cos(-4*x²-3)))
a=-1
x=0
ϵ=1e-7
while true
    global x
    x=a-f(a)*(x-a)/(f(x)-f(a))
    println("x= ",x)
    println("f(x)= ",f(x))
    println()
    if abs(f(x))<ϵ
        break
    end
end
