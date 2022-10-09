# intervallum felezes [-10,10] tartomanyon a kovetkezo egyenleten:
f(x)=x+3-ℯ^(sin(x+3))
a=-10
b=10
ϵ=1e-7 #(10^(-7))

X = []
fx = []

while true
    global a,b
    c=(a+b)/2
    println("x= ",c)
    println("f(x)= ",f(c))
    println()
    push!(X,c)
    push!(fx,f(c))
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

using PyPlot
figure()  
title("2. feladat intervallum felező módszerrel ϵ=1e-7 ")
grid(true)  
plot(X,fx, label="x+3-ℯ\^(sin(x+3))")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("f(x)")
display(gcf())

