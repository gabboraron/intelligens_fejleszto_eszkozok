#Euler's Numerical Method for solving DE
#y'=x^2-y^2

#Step size
h=0.1

#computation length in steps
#
LONG=20

#Initial x, y arrays for plotting
x=zeros(LONG)
y=zeros(LONG)

#Functions
#Aₙ, which is f(x,y) by definition
f(a,b)=a^2-b^2
#x[n+1]
xn1(n)=x[n]+h
#y[n+1]
yn1(n,c,d)=y[n]+h*f(c,d)

#Initial value
x[1]=0
y[1]=1

#Compute the DE
for i=1:LONG-1
  x[i+1]=xn1(i)
  y[i+1]=yn1(i,x[i],y[i])
end #for

#Plotting
using PyPlot

figure(1)
grid(true)
title("The solution for DE")
plot(x[1:LONG-1],y[1:LONG-1])
show()
