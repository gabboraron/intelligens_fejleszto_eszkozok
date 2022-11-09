#vanDerPol oszcillator VSSM szabalyzasa

#Szabalyzo parameterek
K=150
w=100
Λ=150

#K=0
#w=0
#Λ=0

#Szimulacio parameterek
δt=1e-3
LONG=Int(2e4)
l=LONG-1

##########################
# Exact Model Parameters #
##########################

exactₐ = 0.01
exactᵦ = 0.2
exactᵪ = 5.7

μₑ=0.4
ωₑ=0.46
αₑ=1
λₑ=0.1 
mₑ=1

################################
# Approximate Model Parameters #
################################

approxₐ = 0.1
approxᵦ = 0.3
approxᵪ = 5.5

μₐ=0.5
ωₐ=0.42
αₐ=0.8
λₐ=0.09
mₐ=0.8  


#Nominalis Palya parameterek
A₁ = 5
ω₁ = 1
A₂ = 3
ω₂ = 0.7
A₃ = 1
ω₃ = 1

#tombok
#ido
t=zeros(LONG)
#nominalis
qxN=zeros(LONG)
qyN=zeros(LONG)
qzN=zeros(LONG)

qxN_p=zeros(LONG)
qyN_p=zeros(LONG)
qzN_p=zeros(LONG)

qxDes_pp=zeros(LONG)
qyDes_pp=zeros(LONG)
qzDes_pp=zeros(LONG)

ux =zeros(LONG)
uy =zeros(LONG)
uz =zeros(LONG)

x =zeros(LONG)
y =zeros(LONG)
z =zeros(LONG)
xₚ =zeros(LONG)
yₚ =zeros(LONG)
zₚ =zeros(LONG)

qx=zeros(LONG)
qx_p=zeros(LONG)
qy=zeros(LONG)
qy_p=zeros(LONG)
qz=zeros(LONG)
qz_p=zeros(LONG)

#q_pp=zeros(LONG)

x[1] = A₁ *sin(ω₁ * 0.001)
y[1] = A₂ *sin(ω₂ * 0.001)
z[1] = A₃ *sin(ω₃ * 0.001)

xₚ[1] = A₁*ω₁*cos(ω₁* 0.001)
yₚ[1] = A₂*ω₂*cos(ω₂* 0.001)
zₚ[1] = A₃*ω₃*cos(ω₃* 0.001)

#x[1] = 0
#y[1] = 0
#z[1] = 0

#xₚ[1] = 0
#yₚ[1] = 0
#zₚ[1] = 0

hintx=0
hinty=0
hintz=0

#q[1]   = 1
#q_p[1] = 0
#q[1]   = A*sin(ω* 0.001)
#q_p[1] = A*ω*cos(ω* 0.001)
#q[1]   = 1
#q_p[1] = 1

#qx[1]   = 0
#qx_p[1] = 0

#qy[1]   = 0
#qy_p[1] = 0

#qz[1]   = 0
#qz_p[1] = 0



#Approx Model
αₐ = 0.8
δₐ = 0.1
βₐ = 0.9

#Exact System
αₛ  = 1
δₛ  = 0.2
βₛ  = 1

#Szimulacio
for i=1:l
    #ido
    t[i]=i*δt
    
    #nominalis palya
    #qxN = A*sin( ω * t )
   
   qxN[i]=A₁*sin(ω₁*t[i])
   qyN[i]=A₂*sin(ω₂*t[i])
   qzN[i]=A₃*sin(ω₃*t[i])
    
   qxN_p[i]=A₁ * ω₁ * cos(ω₁*t[i])
   qyN_p[i]=A₂ * ω₂ * cos(ω₂*t[i])
   qzN_p[i]=A₃ * ω₃ * cos(ω₃*t[i])
    
    #hiba
    hx=qxN[i]-x[i]
    hy=qyN[i]-y[i]
    hz=qzN[i]-z[i]
    
    #h_p=qN_p[i]-q_p[i]
    
    #ErrorMetrics
    #S=Λ*h+h_p
    Sx=Λ*hintx+hx
    Sy=Λ*hinty+hy
    Sz=Λ*hintz+hz

    #Kinematic_Block
    qxDes_pp[i]=Λ*hx+qxN_p[i]+K*tanh(Sx/w)
    qyDes_pp[i]=Λ*hy+qyN_p[i]+K*tanh(Sy/w)
    qzDes_pp[i]=Λ*hz+qzN_p[i]+K*tanh(Sz/w)

    #Approx Model
    #Approx
    #u[i]=mₐ*qDes_pp[i]-μₐ*(1-q[i]^2)*q_p[i]+ωₐ^2*q[i]+αₐ*q[i]^3+λₐ*q[i]^5
    #u[i]=qDes_pp[i] - δₐ *q_p[i] - αₐ *q[i] - βₐ *q[i]^3
    ux[i]=qxDes_pp[i] + y[i] + z[i] 
    uy[i]=qyDes_pp[i] - x[i] - approxₐ *y[i]
    uz[i]=qzDes_pp[i] - approxᵦ - z[i]*(x[i] - approxᵪ)

    #Exact System
    #q_pp[i]=(u[i]+μₑ*(1-q[i]^2)*q_p[i]-ωₑ^2*q[i]-αₑ*q[i]^3-λₑ*q[i]^5)/mₑ
    #q_pp[i]=u[i] + δₛ *q_p[i] + αₛ *q[i] + βₛ *q[i]^3
    xₚ[i] = y[i] - z[i] + ux[i]
    yₚ[i] = x[i] - exactₐ * y[i] + uy[i]
    zₚ[i] = exactᵦ + z[i] * (x[i] - exactᵪ) + uz[i]

    
    #Euler Integralok
    x[i+1]=x[i]+δt*xₚ[i]
    y[i+1]=y[i]+δt*yₚ[i]
    z[i+1]=z[i]+δt*zₚ[i]
        
    hintx=hintx+δt*hx
    hinty=hinty+δt*hy
    hintz=hintz+δt*hz
end #for

using PyPlot
figure(1)
grid(true)
title("Nominalis es realizalt trajectoria")
plot(t[1:l],qxN[1:l])
plot(t[1:l],qyN[1:l])
plot(t[1:l],qzN[1:l])
plot(t[1:l],x[1:l],"r--")
plot(t[1:l],y[1:l],"r--")
plot(t[1:l],z[1:l],"r--")
display(gcf())

figure(2)
grid(true)
title("Kovetesi hiba")
plot(t[1:l],qxN[1:l]-x[1:l])
plot(t[1:l],qyN[1:l]-y[1:l])
plot(t[1:l],qzN[1:l]-z[1:l])
display(gcf())

figure(3)
grid(true)
title("Fazis ter")
plot(qxN[1:l],qxN_p[1:l])
plot(qyN[1:l],qyN_p[1:l])
plot(qzN[1:l],qzN_p[1:l])
plot(x[1:l],xₚ[1:l],"r--")
plot(y[1:l],yₚ[1:l],"r--")
plot(z[1:l],zₚ[1:l],"r--")
display(gcf())

figure(4)
grid(true)
title("szabalyzo jel")
plot(t[1:l],ux[1:l])
plot(t[1:l],uy[1:l])
plot(t[1:l],uz[1:l])
display(gcf())







