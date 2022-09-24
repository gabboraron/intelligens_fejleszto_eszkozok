#4th order Runge-Kutta (RK2) Numerical Method for solving DE
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

x2=zeros(step1)
y2=zeros(step1)

#Initial value
x1[1]=0
y1[1]=1
x[1]=0
y[1]=1
x2[1]=0
y2[1]=1

#RK4
for n=1:step1-4
  x1[n+1]=x1[n]+h
  Aₙ=x1[n]^2-y1[n]^2
  y_temp1=y1[n]+h*(Aₙ)
  Bₙ=x1[n+1]^2-y_temp1^2
  y_temp2=y_temp1+h*(Bₙ)
  Cₙ=(x1[n]+h+h)^2-y_temp2^2
  y_temp3=y_temp2+h*(Cₙ)
  Dₙ=(x1[n]+h+h+h)^2-y_temp3^2
  y1[n+1]=y1[n]+h*((Aₙ+2*Bₙ+2*Cₙ+Dₙ)/6)
end #for
#Euler
n=0
for n=1:step1-1
  x[n+1]=x[n]+h
  y[n+1]=y[n]+h*(x[n]^2-y[n]^2)
end #for
#RK2
n=0
for n=1:step1-1
  x2[n+1]=x2[n]+h
  Aₙ=x2[n]^2-y2[n]^2
  y_temp=y2[n]+h*(Aₙ)
  Bₙ=x2[n+1]^2-y_temp^2
  y2[n+1]=y2[n]+h*((Aₙ+Bₙ)/2)
end #for


#Plotting
using PyPlot

figure(1)
grid(true)
title(L"The solution $\frac{x^2}{2}$ for DE")
plot(x1[1:step1-4],y1[1:step1-4],color="green",label=L"$4^{th}$ order Runge-Kutta")
plot(x[1:step1-4],y[1:step1-4],color="red",label=L"Euler \"$1^{st}$ order Runge-Kutta\"")
plot(x2[1:step1-4],y2[1:step1-4],color="blue",label=L"$2^{nd}$ order Runge-Kutta")
legend(loc="upper left",fancybox="true")
xlabel("x")
ylabel("y")
show()
