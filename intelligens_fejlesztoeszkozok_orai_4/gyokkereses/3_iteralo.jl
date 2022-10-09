#x=g(x)
#x=cos(x)
#f(x)=cos(x)-x
#g(x)=f(x)+x
g(x)=cos(x)
x=1
ϵ=1e-7
while true
    global x
    x=g(x)
    println("x= ",x)
    println("g(x)= ",g(x))
    println("f(x)= ",g(x)-x)
    if abs(x-g(x))<ϵ
        break
    end
end
