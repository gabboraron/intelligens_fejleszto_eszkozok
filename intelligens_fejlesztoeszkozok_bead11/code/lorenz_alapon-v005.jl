#Lorenz #Clean
#Load Packages
using LinearAlgebra
using PyPlot

#Switches
Adaptive=1

# Control Parameters For RFPT

K=1e5
B=-1
A=1e-5
Λ=4

# Nominal Trajectory Parameters

A₁=5
ω₁=1
A₂=3
ω₂=0.7
A₃=1
ω₃=1

# Simulation Parameters

δt=1e-3
LONG=Int(2e4)
l=LONG-1

#Exact paraméterek
βₑ=0.01
σₑ=0.2
ρₑ=5.7

#Közelítő paraméterek
βₐ=0.1
σₐ=0.3
ρₐ=5.5

# The Original Deformation function for MIMO case
function G_MIMO(past_input,past_response,desired, error_limit,Kc,Bc,Ac) # Inputs and Outputs are vectors
#  need control parameters  K B A
	error_norm=norm(past_response - desired,2)
	# If the norm of the error is greater then the limnit compute the deformation
	# (it is not near the Fixed Point)
  if error_norm>error_limit
    e_direction=(past_response-desired)/error_norm
    B_factor= Bc* tanh(Ac *error_norm)
    out=(1+B_factor)*past_input +B_factor*Kc*e_direction
  else
    out=past_input # Almost in the Fixed Point
  end
  return out
end

# Time
t=zeros(LONG)

# Nominal Trajectory
xN=zeros(LONG)
xN_p=zeros(LONG)

yN=zeros(LONG)
yN_p=zeros(LONG)

zN=zeros(LONG)
zN_p=zeros(LONG)

# Desired
xDes_p=zeros(LONG)
yDes_p=zeros(LONG)
zDes_p=zeros(LONG)

# Deformed
xDef_p=zeros(LONG)
yDef_p=zeros(LONG)
zDef_p=zeros(LONG)

# Control Signal
u_x=zeros(LONG)
u_y=zeros(LONG)
u_z=zeros(LONG)

x_p=zeros(LONG)
y_p=zeros(LONG)
z_p=zeros(LONG)

h_x=zeros(LONG)
h_y=zeros(LONG)
h_z=zeros(LONG)

x=zeros(LONG)
y=zeros(LONG)
z=zeros(LONG)

#initial conditions
hint_x=0
hint_y=0
hint_z=0

x[1] = 0 #A₁ * sin(ω₁ * δt)
y[1] = 0 #A₂ * sin(ω₂ * δt)
z[1] = 0 #A₃ * sin(ω₃ * δt)

past_input=[0,0,0]
past_response=[0,0,0]
error_limit=1e-3
#Simulation

for i=1:l
	global hint_x
	global hint_y
	global hint_z
	global past_input
	global past_response
	global error_limit
	#time
	t[i]=i*δt
	#Nominal Trajectory
    xN[i]=A₁*sin(ω₁*t[i])
    xN_p[i]=A₁*ω₁*cos(ω₁*t[i])

    yN[i]=A₂*sin(ω₂*t[i])
    yN_p[i]=A₂*ω₂*cos(ω₂*t[i])

    zN[i]=A₃*sin(ω₃*t[i])
    zN_p[i]=A₃*ω₃*cos(ω₃*t[i])

    #Errors
    h_x[i]=xN[i]-x[i]
    h_y[i]=yN[i]-y[i]
    h_z[i]=zN[i]-z[i]

	# Kinematic Block
	xDes_p[i]=Λ^2*hint_x+2*Λ*h_x[i]+xN_p[i]
	yDes_p[i]=Λ^2*hint_y+2*Λ*h_y[i]+yN_p[i]
	zDes_p[i]=Λ^2*hint_z+2*Λ*h_z[i]+zN_p[i]

	desired=[xDes_p[i],yDes_p[i],zDes_p[i]]
	# Deformation Block

	if Adaptive==1 && i>3
		past_input=G_MIMO(past_input,past_response,desired,error_limit,K,B,A)
    else
		past_input=desired
   	end #if
	xDef_p[i]=past_input[1]
	yDef_p[i]=past_input[2]
	zDef_p[i]=past_input[3]

	#Control Signal
	u_x[i]=xDef_p[i] + y[i] + z[i]
	u_y[i]=yDef_p[i] - x[i] - βₐ * y[i]
	u_z[i]=zDef_p[i] - σₐ - z[i] * (x[i] - ρₐ)

	#System
	x_p[i] = -y[i] - z[i] + u_x[i] 
	y_p[i] = x[i] + βₑ * y[i] + u_y[i]
	z_p[i] =  σₑ + z[i] * (x[i] - ρₑ) + u_z[i]
	past_response = [x_p[i], y_p[i], z_p[i]]

	#Integrals
	x[i+1]=x[i]+δt*x_p[i]
	y[i+1]=y[i]+δt*y_p[i]
	z[i+1]=z[i]+δt*z_p[i]

    hint_x=hint_x+δt*h_x[i]
    hint_y=hint_y+δt*h_y[i]
    hint_z=hint_z+δt*h_z[i]

end # for

figure(1)
grid(true)
title("traj. tracking")
plot(t[1:l],xN[1:l])
plot(t[1:l],yN[1:l])
plot(t[1:l],zN[1:l])
plot(t[1:l],x[1:l],"r--")
plot(t[1:l],y[1:l],"g--")
plot(t[1:l],z[1:l],"b--")
display(gcf())


using PyPlot
figure(2)
grid(true)
title("Nominális és Realizált trajektória, és x,y,z")
plot(t[1:l],xN[1:l], "r")
plot(t[1:l],yN[1:l], "g")
plot(t[1:l],zN[1:l], "b")
#plot(t[1:l],q[1:l],"r--")
plot(t[1:l],x[1:l], "b--")
plot(t[1:l],y[1:l], "r--")
plot(t[1:l],z[1:l], "g--")
legend(["xN","yN","zN","x","y", "z"])
display(gcf())

figure(3)
grid(true)
title("hiba")
plot(t[1:l],h_x[1:l],"r--")
plot(t[1:l],h_y[1:l],"g--")
plot(t[1:l],h_z[1:l],"b--")
display(gcf())

figure(4)
grid(true)
title("fázistér")
plot(xN_p[1:l],xN[1:l])
plot(yN_p[1:l],yN[1:l])
plot(zN_p[1:l],zN[1:l])
plot(x[1:l],x_p[1:l])
plot(y[1:l],y_p[1:l])
plot(z[1:l],z_p[1:l])
#plot(q_p[1:l],q[1:l],"r--")
legend(["xN","yN","zN","xp","yp", "zp"])
display(gcf())

figure(5)
grid(true)
title("Szabályozó jel")
plot(t[1:l],u_x[1:l])
plot(t[1:l],u_y[1:l])
plot(t[1:l],u_z[1:l])
#plot(q_p[1:l],q[1:l],"r--")
display(gcf())

