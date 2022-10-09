#original function
f(x) = x^2-x-1

#updating function
C(a,b) = b - f(b) * (b-a)/(f(b)-f(a))

#precision
ϵ = 10e-7

# intrevall
a = 0
b = 2


while (true)
    global a 
    global b
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