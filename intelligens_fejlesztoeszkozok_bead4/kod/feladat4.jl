#Newton-Raphson
f(x)=x+2-x^3
df(x)=1-3*x^2

x=-10
ϵ=1e-7

X = []
fx = []


while true
    global x
    x=x-f(x)/df(x)
    println("x= ",x)
    println("f(x)= ",f(x))
    println()
    push!(X,x)
    push!(fx,f(x))
    if abs(f(x))<ϵ
        break
    end
end



using PyPlot
figure()  
title("4. feladat Newton-Raphson módszerrel ϵ=1e-7 ")
grid(true)  
plot(X,fx, label="f(x) = x+2-x³ ")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("f(x)")
display(gcf())
