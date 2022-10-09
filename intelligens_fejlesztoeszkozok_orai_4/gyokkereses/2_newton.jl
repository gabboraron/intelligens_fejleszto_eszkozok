f(x)=exp(x)-x^2
df(x)=exp(x)-2x
x=-1
ϵ=1e-7
while true
    global x
    x=x-f(x)/df(x)
    println("x= ",x)
    println("f(x)= ",f(x))
    println()
    if abs(f(x))<ϵ
        break
    end
end
