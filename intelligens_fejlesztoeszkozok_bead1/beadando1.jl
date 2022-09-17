function f(x,y)
    for i in x:y
        print(i)
    end
end


f(1,100)


LONG=Int(1e4) #step number
δ=0.001
l=LONG-1 

n = zeros(LONG)
m = zeros(LONG)
 
n[1] = sin(-5)
m[1] = -5


for i in 1:l
    n[i] = sin(m[i])
    m[i+1] = m[i]+δ
end

using PyPlot
figure()
plot(m[1:l],n[1:l])
display(gcf())