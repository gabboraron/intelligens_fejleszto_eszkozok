#2nd order Runge-Kutta (RK2) Numerical Method for solving DE
#y'=x^2-y^2

#Step size
h=0.1

#stop at x=stop
stop=2
step1=Int(stop/h)+1
#Initial x, y arrays for ploting
x1=zeros(step1)
y1=zeros(step1)

x=zeros(step1)
y=zeros(step1)


#Initial value
x1[1]=0
y1[1]=1
x[1]=0
y[1]=1

#RK2 
for n=1:step1-1
  x1[n+1]=x1[n]+h
  Aₙ=x1[n]^2-y1[n]^2
  y_temp=y1[n]+h*(Aₙ)
  Bₙ=x1[n+1]^2-y_temp^2
  y1[n+1]=y1[n]+h*((Aₙ+Bₙ)/2)
end #for
#Euler
n=0
for n=1:step1-1
  x[n+1]=x[n]+h
  y[n+1]=y[n]+h*(x[n]^2-y[n]^2)
end #for

#Plotting
using PyPlot

figure(1)
grid(true)
title("The solution for DE")
plot(x1[1:step1-1],y1[1:step1-1],color="green")
plot(x[1:step1-1],y[1:step1-1],color="red")
show()
