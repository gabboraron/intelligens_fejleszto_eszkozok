#Euler's Numerical Method for solving DE
#y'=x^2-y^2

#Step sizes
h₁=0.01
h₂=0.001
h₃=0.0001


#computation length in steps
LONG=100000

#Initial x, y arrays for plotting
m = zeros(LONG)
m[1] = 0

x=zeros(LONG)
y=zeros(LONG)
z=zeros(LONG)

#Functions
function f₁(x)
    x^2+1+((x^4+x^2)/2)
end
x[1]=f₁(1)

function f₂(x)
    ℯ^(2*x)+3*x*ℯ^(2*x)+3*x+2
end

f₃x=zeros(LONG)
f₃y=zeros(LONG)
f₃z=zeros(LONG)
f₃x[1]=0.1
f₃y[1]=0.1
f₃z[1]=0.1

function f₃(i)
    i = floor(Int,i)
    #Initial values
    a=10
    b=100
    c=0.3
    
    f₃x[i+1]=a*f₃y[i]
    f₃y[i+1]=-c*f₃x[i]+f₃z[i]*f₃y[i]
    f₃z[i+1]=b-f₃y[i]^2
end

#################
### function plotter
    LONG=Int(1e4) #step number
    l=LONG-1 

    hf1₁  = zeros(LONG)
    hf1₂  = zeros(LONG)
    hf1₃  = zeros(LONG)
    hf2₁ = zeros(LONG)
    hf2₂ = zeros(LONG)
    hf2₃ = zeros(LONG)
    hf3₁ = zeros(LONG)
    hf3₂ = zeros(LONG)
    hf3₃ = zeros(LONG)
    
    m1 = zeros(LONG)
    m2 = zeros(LONG)
    m3 = zeros(LONG)
    
    hf1₁[1] = 1
    hf1₂[1] = 1
    hf1₃[1] = 1
    
    hf2₁[1] = 3
    hf2₂[1] = 3
    hf2₃[1] = 3

    hf3₁[1] = 0.1
    hf3₂[1] = 0.1
    hf3₃[1] = 0.1
    
    m1[1] = 0
    m2[1] = 0
    m3[1] = 0


    for i in 1:l
        hf1₁[i] = f₁(m1[i])
        hf1₂[i] = f₁(m2[i])
        hf1₃[i] = f₁(m3[i])
        
        hf2₁[i] = f₂(m1[i])
        hf2₂[i] = f₂(m2[i])
        hf2₃[i] = f₂(m3[i])

        m1[i+1] = m1[i]+h₁
        m2[i+1] = m2[i]+h₂
        m3[i+1] = m3[i]+h₃
    end

    a = zeros(LONG)
    b = zeros(LONG)
    c = zeros(LONG)
    t = zeros(LONG)

    t[1] = 0
    a[1] = 0.1
    b[1] = 0.1
    c[1] = 0.1

    function Func3x(b)
      return 10 * b
    end
    
    function Func3y(a, b, c)
      return -0.3 * a + c * b
    end
    
    function Func3z(b)
      return 100 - b^2
    end

    h = h₁
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₁[i+1] = a[i+1]
    end

    PyPlot.clf()
    figure()
    grid(true)
    title("3. egyenlet - XYZ; h₃=0.01")
    plot3D(a[1:LONG-1],b[1:LONG-1], c[1:LONG-1])
    display(gcf())

    h = h₂
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₂[i+1] = a[i+1]
    end

    PyPlot.clf()
    figure()
    grid(true)
    title("3. egyenlet - XYZ; h₃=0.001")
    plot3D(a[1:LONG-1],b[1:LONG-1], c[1:LONG-1])
    display(gcf())

    h = h₃
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₃[i+1] = a[i+1]
    end

    using PyPlot
    figure()  
    title("1. egyenlet Euler plot")
    grid(true)  
    plot(m1[1:l],hf1₁[1:l], label="Lh₁=0.01")
    plot(m2[1:l],hf1₂[1:l], label="Lh₂=0.001")
    plot(m3[1:l],hf1₃[1:l], label="Lh₃=0.0001")
    legend(loc="upper left",fancybox="true")
    xlabel("x")
    ylabel("y")
    display(gcf())

    using PyPlot
    figure()  
    title("2. egyenlet Euler plot")
    grid(true)  
    plot(m1[1:l],hf2₁[1:l])
    plot(m2[1:l],hf2₂[1:l])
    plot(m3[1:l],hf2₃[1:l])
    display(gcf())

    #3. - x
    using PyPlot
    figure()  
    title("3. egyenlet-x Euler plot")
    grid(true)  
    plot(m1[1:l],hf3₁[1:l], label="Lh₁=0.01")
    plot(m2[1:l],hf3₂[1:l], label="Lh₂=0.001")
    plot(m3[1:l],hf3₃[1:l], label="Lh₃=0.0001")
    legend(loc="upper left",fancybox="true")
    display(gcf())

    PyPlot.clf()
    figure()
    grid(true)
    title("3. egyenlet - XYZ; h₃=0.0001")
    plot3D(a[1:LONG-1],b[1:LONG-1], c[1:LONG-1])
    display(gcf())

    # 3. -Y
    
    h = h₁
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₁[i+1] = b[i+1]
    end

    h = h₂
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₂[i+1] = b[i+1]
    end

    h = h₃
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₃[i+1] = b[i+1]
    end

    using PyPlot
    figure()  
    title("3. egyenlet-y Euler plot")
    grid(true)  
    plot(m1[1:l],hf3₁[1:l], label="Lh₁=0.01")
    plot(m2[1:l],hf3₂[1:l], label="Lh₂=0.001")
    plot(m3[1:l],hf3₃[1:l], label="Lh₃=0.0001")
    legend(loc="upper left",fancybox="true")
    display(gcf())

    # 3. -z
    
    h = h₁
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₁[i+1] = c[i+1]
    end

    h = h₂
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₂[i+1] = c[i+1]
    end

    h = h₃
    for i = 1:LONG-1
      t[i+1] = t[i] + h
      a[i+1] = a[i] + h * Func3x(b[i])
      b[i+1] = b[i] + h * Func3y(a[i], b[i], c[i])
      c[i+1] = c[i] + h * Func3z(b[i])

      hf3₃[i+1] = c[i+1]
    end

    using PyPlot
    figure()  
    title("3. egyenlet-z Euler plot")
    grid(true)  
    plot(m1[1:l],hf3₁[1:l], label="Lh₁=0.01")
    plot(m2[1:l],hf3₂[1:l], label="Lh₂=0.001")
    plot(m3[1:l],hf3₃[1:l], label="Lh₃=0.0001")
    legend(loc="upper left",fancybox="true")
    display(gcf())

    #3 - egyben


    #########################################################################
# RK2 - feladat1

#Initial x, y arrays for ploting
x1=zeros(LONG)
y1=zeros(LONG)
x2=zeros(LONG)
y2=zeros(LONG)
x3=zeros(LONG)
y3=zeros(LONG)

#Initial value
x1[1]=0
y1[1]=1
x2[1]=0
y2[1]=1
x3[1]=0
y3[1]=1

h = h₁
for n=1:l
  x1[n+1]=x1[n]+h
  Aₙ=f₁(x1[n])
  y_temp=y1[n]+h*(Aₙ)
  Bₙ=f₁(x1[n+1])
  y1[n+1]=y1[n]+h*((Aₙ+Bₙ)/2)
end #for

h = h₂
for n=1:l
  x2[n+1]=x2[n]+h
  Aₙ=f₁(x2[n])
  y_temp=y2[n]+h*(Aₙ)
  Bₙ=f₁(x2[n+1])
  y2[n+1]=y2[n]+h*((Aₙ+Bₙ)/2)
end #for

h = h₃
for n=1:l
  x3[n+1]=x3[n]+h
  Aₙ=f₁(x3[n])
  y_temp=y3[n]+h*(Aₙ)
  Bₙ=f₁(x3[n+1])
  y3[n+1]=y3[n]+h*((Aₙ+Bₙ)/2)
end #for

#Plotting
using PyPlot

figure(1)
grid(true)
title("1. feladat - RK2")
plot(x1[1:l],y1[1:l],color="green")
plot(x2[1:l],y2[1:l],color="red")
plot(x3[1:l],y3[1:l],color="orange")
display(gcf())

hf1rk2h1 = y1[1:l]
hf1rk2h2 = y2[1:l]
hf1rk2h3 = y3[1:l]

##################
# RK2 - feladat2

x1=zeros(LONG)
y1=zeros(LONG)
x2=zeros(LONG)
y2=zeros(LONG)
x3=zeros(LONG)
y3=zeros(LONG)

#Initial value
x1[1]=0
y1[1]=1
x2[1]=0
y2[1]=1
x3[1]=0
y3[1]=1

h = h₁
for n=1:l
  x1[n+1]=x1[n]+h
  Aₙ=f₂(x1[n])
  y_temp=y1[n]+h*(Aₙ)
  Bₙ=f₂(x1[n+1])
  y1[n+1]=y1[n]+h*((Aₙ+Bₙ)/2)
end #for

h = h₂
for n=1:l
  x2[n+1]=x2[n]+h
  Aₙ=f₂(x2[n])
  y_temp=y2[n]+h*(Aₙ)
  Bₙ=f₂(x2[n+1])
  y2[n+1]=y2[n]+h*((Aₙ+Bₙ)/2)
end #for

h = h₃
for n=1:l
  x3[n+1]=x3[n]+h
  Aₙ=f₂(x3[n])
  y_temp=y3[n]+h*(Aₙ)
  Bₙ=f₂(x3[n+1])
  y3[n+1]=y3[n]+h*((Aₙ+Bₙ)/2)
end #for

#Plotting
using PyPlot

figure(1)
grid(true)
title("2. feladat - RK2")
plot(x1[1:l],y1[1:l],color="green")
plot(x2[1:l],y2[1:l],color="red")
plot(x3[1:l],y3[1:l],color="orange")
display(gcf())

hf2rk2h1 = y1[1:l]
hf2rk2h2 = y2[1:l]
hf2rk2h3 = y3[1:l]


###################################################
x1=zeros(LONG)
y1=zeros(LONG)
x2=zeros(LONG)
y2=zeros(LONG)
x3=zeros(LONG)
y3=zeros(LONG)

#Initial value
x1[1]=0
y1[1]=1
x2[1]=0
y2[1]=1
x3[1]=0
y3[1]=1

h = h₁
#RK4
for n=1:l
    x1[n+1]=x1[n]+h
    Aₙ=f₁(x1[n])
    y_temp1=y1[n]+h*(Aₙ)
    Bₙ=f₁(x1[n+1])
    y_temp2=y_temp1+h*(Bₙ)
    Cₙ=f₁(x1[n]+h+h)
    y_temp3=y_temp2+h*(Cₙ)
    Dₙ=f₁(x1[n]+h+h+h)
    y1[n+1]=y1[n]+h*((Aₙ+2*Bₙ+2*Cₙ+Dₙ)/6)
  end #for
  
h = h₂
#RK4
for n=1:l
    x2[n+1]=x2[n]+h
    Aₙ=f₁(x2[n])
    y_temp1=y1[n]+h*(Aₙ)
    Bₙ=f₁(x2[n+1])
    y_temp2=y_temp1+h*(Bₙ)
    Cₙ=f₁(x2[n]+h+h)
    y_temp3=y_temp2+h*(Cₙ)
    Dₙ=f₁(x2[n]+h+h+h)
    y1[n+1]=y1[n]+h*((Aₙ+2*Bₙ+2*Cₙ+Dₙ)/6)
  end #for
  
h = h₃
#RK4
for n=1:l
    x3[n+1]=x3[n]+h
    Aₙ=f₁(x3[n])
    y_temp1=y1[n]+h*(Aₙ)
    Bₙ=f₁(x3[n+1])
    y_temp2=y_temp1+h*(Bₙ)
    Cₙ=f₁(x3[n]+h+h)
    y_temp3=y_temp2+h*(Cₙ)
    Dₙ=f₁(x3[n]+h+h+h)
    y1[n+1]=y1[n]+h*((Aₙ+2*Bₙ+2*Cₙ+Dₙ)/6)
  end #for

figure(1)
grid(true)
title("1. feladat - RK4")
plot(x1[1:l],y1[1:l],color="green")
plot(x2[1:l],y2[1:l],color="red")
plot(x3[1:l],y3[1:l],color="orange")
display(gcf())

hf1rk4h1 = y1[1:l]
hf1rk4h2 = y2[1:l]
hf1rk4h3 = y3[1:l]

###################
x1=zeros(LONG)
y1=zeros(LONG)
x2=zeros(LONG)
y2=zeros(LONG)
x3=zeros(LONG)
y3=zeros(LONG)

#Initial value
x1[1]=0
y1[1]=1
x2[1]=0
y2[1]=1
x3[1]=0
y3[1]=1

h = h₁
#RK4
for n=1:l
    x1[n+1]=x1[n]+h
    Aₙ=f₂(x1[n])
    y_temp1=y1[n]+h*(Aₙ)
    Bₙ=f₂(x1[n+1])
    y_temp2=y_temp1+h*(Bₙ)
    Cₙ=f₂(x1[n]+h+h)
    y_temp3=y_temp2+h*(Cₙ)
    Dₙ=f₂(x1[n]+h+h+h)
    y1[n+1]=y1[n]+h*((Aₙ+2*Bₙ+2*Cₙ+Dₙ)/6)
  end #for
  
h = h₂
#RK4
for n=1:l
    x2[n+1]=x2[n]+h
    Aₙ=f₂(x2[n])
    y_temp1=y1[n]+h*(Aₙ)
    Bₙ=f₂(x2[n+1])
    y_temp2=y_temp1+h*(Bₙ)
    Cₙ=f₂(x2[n]+h+h)
    y_temp3=y_temp2+h*(Cₙ)
    Dₙ=f₂(x2[n]+h+h+h)
    y1[n+1]=y1[n]+h*((Aₙ+2*Bₙ+2*Cₙ+Dₙ)/6)
  end #for
  
h = h₃
#RK4
for n=1:l
    x3[n+1]=x3[n]+h
    Aₙ=f₂(x3[n])
    y_temp1=y1[n]+h*(Aₙ)
    Bₙ=f₂(x3[n+1])
    y_temp2=y_temp1+h*(Bₙ)
    Cₙ=f₂(x3[n]+h+h)
    y_temp3=y_temp2+h*(Cₙ)
    Dₙ=f₂(x3[n]+h+h+h)
    y1[n+1]=y1[n]+h*((Aₙ+2*Bₙ+2*Cₙ+Dₙ)/6)
  end #for

figure(8)
grid(true)
title("2. feladat - RK4")
plot(x1[1:l],y1[1:l],color="green",label=L"$h₁$-re")
plot(x2[1:l],y2[1:l],color="red",label=L"$h₂$-re")
plot(x3[1:l],y3[1:l],color="orange",label=L"$h₃$ -ra")
legend(loc="upper left",fancybox="true")
display(gcf())

hf2rk4h1 = y1[1:l]
hf2rk4h2 = y2[1:l]
hf2rk4h3 = y3[1:l]

###################
# hibak
using PyPlot
figure()  
title("Hibák h₁=0.01 -re - 1. egyenlet esetén")
grid(true)  
plot(m1[1:l],hf1₁[1:l], label="Euler")
plot(m2[1:l],hf1rk2h1[1:l], label="RK2")
plot(m2[1:l],hf1rk4h1[1:l], label="RK4")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("y")
display(gcf())
#
using PyPlot
figure()  
title("Hibák h₂=0.001 -re - 1. egyenlet esetén")
grid(true)  
plot(m1[1:l],hf1₂[1:l], label="Euler")
plot(m2[1:l],hf1rk2h2[1:l], label="RK2")
plot(m2[1:l],hf1rk4h2[1:l], label="RK4")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("y")
display(gcf())
#
using PyPlot
figure()  
title("Hibák h₃=0.0001 -re - 1. egyenlet esetén")
grid(true)  
plot(m1[1:l],hf1₃[1:l], label="Euler")
plot(m2[1:l],hf1rk2h3[1:l], label="RK2")
plot(m2[1:l],hf1rk4h3[1:l], label="RK4")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("y")
display(gcf())
#
using PyPlot
figure()  
title("Hibák h₃=0.01 -re - 2. egyenlet esetén")
grid(true)  
plot(m1[1:l],hf2₁[1:l], label="Euler")
plot(m2[1:l],hf1rk2h1[1:l], label="RK2")
plot(m2[1:l],hf1rk4h1[1:l], label="RK4")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("y")
display(gcf())
#
using PyPlot
figure()  
title("Hibák h₃=0.001 -re - 2. egyenlet esetén")
grid(true)  
plot(m1[1:l],hf2₂[1:l], label="Euler")
plot(m2[1:l],hf1rk2h2[1:l], label="RK2")
plot(m2[1:l],hf1rk4h2[1:l], label="RK4")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("y")
display(gcf())
#
using PyPlot
figure()  
title("Hibák h₃=0.0001 -re - 2. egyenlet esetén")
grid(true)  
plot(m1[1:l],hf2₃[1:l], label="Euler")
plot(m2[1:l],hf1rk2h3[1:l], label="RK2")
plot(m2[1:l],hf1rk4h3[1:l], label="RK4")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("y")
display(gcf())
#
