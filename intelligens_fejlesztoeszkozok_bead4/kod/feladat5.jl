#fixpont iteráció
#f(x)=sin(x-5)
#x = 5 + (x-5)^3/ 3! - (x-5)^5/ 5! + (x-5)^7/ 7!
#x=g(x)


g(x)=5+((x-5)^3)/factorial(3) - ((x-5)^5)/factorial(5) + ((x-5)^7)/factorial(7)
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
#plot(X,gx, label="g(x) = 5 + (x-5)³/ 3! - (x-5)⁵/ 5! + (x-5)⁷/ 7!")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("f(x) | g(x)")
display(gcf())
