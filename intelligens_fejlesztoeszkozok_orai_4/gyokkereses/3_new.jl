using SymPy
@vars x # a szimbolikus valtozo: x
f(x)=x-cos(x)
df=diff(f(x),x,1) #elso derivalt
ddf=diff(f(x),x,2) #masodik derivalt
println("f(0)= ",f(0))
println("f(1)= ",f(1))
println("ddf(0)= ",N(ddf(0)))
println("ddf(1)= ",N(ddf(1)))
a=1
ϵ=1e-7
while true
    global a
    a=a-f(a)/N(df(a))
    println("x= ",a)
    println("f(x)= ",f(a))
    println()
    if abs(f(a))<ϵ
        break
    end
end
