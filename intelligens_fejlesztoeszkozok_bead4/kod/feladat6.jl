#fixpont iteráció
#f(x)=cos(x-5)
#x = 1 - (x-6)2/ 2! + (x-6)4/ 4! - (x-6)6/ 6! + (x-6)8/ 8!
#x=g(x)


g(x)= 1- ((x-6)^2)/ factorial(2) + ((x-6)^4)/ factorial(4) - ((x-6)^6)/ factorial(6) + ((x-6)^8)/ factorial(8)
x=2
ϵ=1e-7

X = []
fx = []
gx = []

while true
    global x
    x=g(x)
    println("x= ",x)
    println("g(x)= ",g(x))
    println("f(x)= ",cos(x-5))
    push!(X,x)
    push!(fx,cos(x-5))
    push!(gx,g(x))
    if abs(x-g(x))<ϵ
        break
    end
end

using PyPlot
figure()  
title("6. feladat fixpont iteráció módszerrel ϵ=1e-7 ")
grid(true)  
plot(X,fx, label="f(x) = cos(x-5)")
#plot(X,gx, label="g(x) = 1- (x-6)²/2! + (x-6)⁴/4! - (x-6)⁶/6! + (x-6)⁸/8!")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("f(x) | g(x)")
display(gcf())
