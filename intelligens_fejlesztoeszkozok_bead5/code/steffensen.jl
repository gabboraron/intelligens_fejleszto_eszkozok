g(x)=sin(x-5) + x
a=5.5
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