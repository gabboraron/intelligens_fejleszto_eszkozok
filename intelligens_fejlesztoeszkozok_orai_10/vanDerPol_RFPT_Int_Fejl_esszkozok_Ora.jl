#vanDerPol RFPT Int. Fejl. esszkozok Ora

#Adaptivitas switch
Adaptiv=1

#Adaptiv Szab. Parameterek
K=1e5
A=1e-5
B=-1
#KB Szab. Parameterek
Λ=4

#Nom. palya parameterek
Ampl=2
ω=0.5

#Model Parameterek
##########################
# Exact Model Parameters #
##########################

μₑ=0.4
ωₑ=0.46
αₑ=1
λₑ=0.1
mₑ=1

################################
# Approximate Model Parameters #
################################

μₐ=0.5
ωₐ=0.42
αₐ=0.9
λₐ=0.09
mₐ=0.8

#szimulacio parameterei
LONG=Int(2e5)
l=LONG-1
δt=1e-3

#tombok eredmenyek tarolasara.
qN=zeros(LONG)
qN_p=zeros(LONG)
qN_pp=zeros(LONG)

q=zeros(LONG)
q_p=zeros(LONG)
q_pp=zeros(LONG)

t=zeros(LONG)

qDes_pp=zeros(LONG)
u=zeros(LONG)
qDef_pp=zeros(LONG)
q[1]=Ampl*sin(ω*δt)
q_p[1]=Ampl*ω*cos(ω*δt)

hint=0
for i=1:l
    global hint
    #ido
    t[i]=i*δt
    #Nominalis palya
    qN[i]=Ampl*sin(ω*t[i])
    qN_p[i]=Ampl*ω*cos(ω*t[i])
    qN_pp[i]=-Ampl*ω^2*sin(ω*t[i])
    #hiba
    #h=qN[i]-q[i]
    #h_p=qN_p[i]-q_p[i]
    #KB
    qDes_pp[i]=Λ^3*hint+3*Λ^2*(qN[i]-q[i])+3*Λ*(qN_p[i]-q_p[i])+qN_pp[i]
    if Adaptiv==1 && i>3
        qDef_pp[i]=(qDef_pp[i-1]+K)*(1+B*tanh(A*(q_pp[i-1]-qDes_pp[i])))-K
    else
        qDef_pp[i]=qDes_pp[i]
    end#if
    u[i]=mₐ*qDef_pp[i]#-μₐ*(1-q[i]^2)*q_p[i]+ωₐ^2*q[i]+αₐ*q[i]^3+λₐ*q[i]^5
    q_pp[i]=(u[i]+μₑ*(1-q[i]^2)*q_p[i]-ωₑ^2*q[i]-αₑ*q[i]^3-λₑ*q[i]^5)/mₑ
    #integralok
    hint=hint+δt*(qN[i]-q[i])
    q_p[i+1]=q_p[i]+δt*q_pp[i]
    q[i+1]=q[i]+δt*q_p[i]
end#for

using PyPlot
figure(1)
grid(true)
plot(t[1:l],qN[1:l])
plot(t[1:l],q[1:l],"r--")

figure(2)
grid(true)
plot(t[1:l],qN[1:l]-q[1:l])

figure(3)
grid(true)
plot(qN_p[1:l],qN[1:l])
plot(q_p[1:l],q[1:l],"r--")