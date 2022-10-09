f(x)=6*x+3-tanh(tan(cos(-4*x^2-3)))
a=-10
x=10
ϵ=1e-7

X = []
fx = []


while true
    global x
    x=a-f(a)*(x-a)/(f(x)-f(a))
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
title("3. feladat intervallum húr módszerrel ϵ=1e-7 ")
grid(true)  
plot(X,fx, label="f(x)=6x+3-tanh(tan(cos(-4x²-3)))")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("f(x)")
display(gcf())
