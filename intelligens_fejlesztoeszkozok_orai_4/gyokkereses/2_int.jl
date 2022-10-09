#function f (x)
#return exp(x)-x^2
#end
f(x)=exp(x)-x^2
a=-1
b=0
ϵ=1e-7 #(10^(-7))
while true
    global a,b
    c=(a+b)/2
    println("x= ",c)
    println("f(x)= ",f(c))
    println()
    if sign(f(c))==sign(f(a))
        a=c
    end
    if sign(f(c))==sign(f(b))
        b=c
    end
    if abs(f(c))<ϵ
        break
    end
end
