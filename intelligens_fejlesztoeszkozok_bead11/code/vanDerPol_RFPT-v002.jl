#vanDerPol RFPT Int. Fejl. esszkozok Ora
LONG=Int(2e4)
l=LONG-1

#Adaptivitas switch
Adaptiv=1

#Szabalyzo parameterek
K=150
w=100
Λ=150

"""
#Adaptiv Szab. Parameterek
K=1e5
A=1e-5
#KB Szab. Parameterek
Λ=4
"""
B=-1

#Nom. palya parameterek
Ampl=2
ω=0.5

#Model Parameterek
##########################
# Exact Model Parameters #
##########################

μₑ=0.4
ωₑ=0.46
αₑ=-0.01
λₑ=0.2
mₑ=5.7

################################
# Approximate Model Parameters #
################################

μₐ=0.5
ωₐ=0.42
αₐ=0.1
λₐ=0.3
mₐ=5.5

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

qxN_pp=zeros(LONG)
qyN_pp=zeros(LONG)
qzN_pp=zeros(LONG)

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

hintx=0
hinty=0
hintz=0

#szimulacio parameterei
LONG=Int(2e4)
l=LONG-1
δt=1e-3

#tombok eredmenyek tarolasara.
qN=zeros(LONG)
qN_p=zeros(LONG)
qN_pp=zeros(LONG)

q=zeros(LONG)
q_p=zeros(LONG)
q_pp=zeros(LONG)

qxDef_pp = zeros(LONG)
qyDef_pp = zeros(LONG)
qzDef_pp = zeros(LONG)

qx_pp = zeros(LONG)
qy_pp = zeros(LONG)
qz_pp = zeros(LONG)

qx_p = zeros(LONG)
qy_p = zeros(LONG)
qz_p = zeros(LONG)

qx = zeros(LONG)
qy = zeros(LONG)
qz = zeros(LONG)

ux = zeros(LONG)
uy = zeros(LONG)
uz = zeros(LONG)

t=zeros(LONG)

qDes_pp=zeros(LONG)
u=zeros(LONG)
qDef_pp=zeros(LONG)
q[1]=Ampl*sin(ω*δt)
q_p[1]=Ampl*ω*cos(ω*δt)

hint=0
for i=1:l
    global hint

    t[i]=i*δt
    
    #nominalis palya
    #qxN = A*sin( ω * t )
   
    qxN[i]=A₁*sin(ω₁*t[i])
    qyN[i]=A₂*sin(ω₂*t[i])
    qzN[i]=A₃*sin(ω₃*t[i])
    
    qxN_p[i]=A₁ * ω₁ * cos(ω₁*t[i])
    qyN_p[i]=A₂ * ω₂ * cos(ω₂*t[i])
    qzN_p[i]=A₃ * ω₃ * cos(ω₃*t[i])

    qxN_pp[i]=-A₁ * ω₁^2 * sin(ω₁*t[i])
    qyN_pp[i]=-A₂ * ω₂^2 * sin(ω₂*t[i])
    qzN_pp[i]=-A₃ * ω₃^2 * sin(ω₃*t[i])
    
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
    qxDes_pp[i]=Λ^3*hintx+3*Λ^2*(qxN[i]-q[i])+3*Λ*(qxN_p[i]-qx_p[i])+qxN_pp[i]
    qyDes_pp[i]=Λ^3*hinty+3*Λ^2*(qyN[i]-q[i])+3*Λ*(qyN_p[i]-qy_p[i])+qyN_pp[i]
    qzDes_pp[i]=Λ^3*hintz+3*Λ^2*(qzN[i]-q[i])+3*Λ*(qzN_p[i]-qz_p[i])+qzN_pp[i]

    if Adaptiv==1 && i>3
        qxDef_pp[i]=(qxDef_pp[i-1]+K)*(1+B*tanh(A₁*(qx_pp[i-1]-qxDes_pp[i])))-K
        qyDef_pp[i]=(qyDef_pp[i-1]+K)*(1+B*tanh(A₂*(qy_pp[i-1]-qyDes_pp[i])))-K
        qzDef_pp[i]=(qzDef_pp[i-1]+K)*(1+B*tanh(A₃*(qz_pp[i-1]-qzDes_pp[i])))-K
    else
        qxDef_pp[i]=qxDes_pp[i]
        qyDef_pp[i]=qyDes_pp[i]
        qzDef_pp[i]=qzDes_pp[i]
    end#if
    ux[i]=mₐ*qxDef_pp[i]
    uy[i]=mₐ*qyDef_pp[i]
    uz[i]=mₐ*qzDef_pp[i]
    #u[i]=mₐ*qzDef_pp[i]
    #-μₐ*(1-q[i]^2)*q_p[i]+ωₐ^2*q[i]+αₐ*q[i]^3+λₐ*q[i]^5
    #q_pp[i]=(u[i]+μₑ*(1-q[i]^2)*q_p[i]-ωₑ^2*q[i]-αₑ*q[i]^3-λₑ*q[i]^5)/mₑ
    qx_pp[i]=(ux[i] + mₑ * qx[i]^3 + λₑ * qx_p[i] + αₑ * qx[i])
    qy_pp[i]=(uy[i] + mₑ * qy[i]^3 + λₑ * qy_p[i] + αₑ * qy[i])
    qz_pp[i]=(uz[i] + mₑ * qz[i]^3 + λₑ * qz_p[i] + αₑ * qz[i])
    #integralok
    hintx=hintx+δt*(qxN[i]-qx[i])
    hinty=hinty+δt*(qyN[i]-qy[i])
    hintz=hintz+δt*(qzN[i]-qz[i])

    qx_p[i+1]=qx_p[i]+δt*qx_pp[i]
    qx[i+1]=qx[i]+δt*qx_p[i]

    qy_p[i+1]=qy_p[i]+δt*qy_pp[i]
    qy[i+1]=qy[i]+δt*qy_p[i]
    
    qz_p[i+1]=qz_p[i]+δt*qz_pp[i]
    qz[i+1]=qz[i]+δt*qz_p[i]
end#for


#using PyPlot
#figure(1)
#grid(true)
#plot(t[1:l],qN[1:l])
#plot(t[1:l],q[1:l],"r--")
#display(gcf())

#figure(2)
#grid(true)
#plot(t[1:l],qN[1:l]-q[1:l])
#display(gcf())

#figure(3)
#grid(true)
#plot(qN_p[1:l],qN[1:l])
#plot(q_p[1:l],q[1:l],"r--")
#display(gcf())

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



