#fixpont iteráció
#f(x)=sin(x-5)
#x=g(x)


g(x)=sin(x-5)+x
x=5.5
ϵ=1e-7

X = []
fx = []
gx = []

while true
    global x
    x=g(x)
    println("x= ",x)
    println("g(x)= ",g(x))
    println("f(x)= ",sin(x-5))
    push!(X,x)
    push!(fx,sin(x-5))
    push!(gx,g(x))
    if abs(x-g(x))<ϵ
        break
    end
end

using PyPlot
figure()  
title("5. feladat fixpont iteráció módszerrel ϵ=1e-7 ")
grid(true)  
plot(X,fx, label="f(x) = sin(x-5)")
#plot(X,gx, label="g(x)")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("f(x) | g(x)")
display(gcf())
