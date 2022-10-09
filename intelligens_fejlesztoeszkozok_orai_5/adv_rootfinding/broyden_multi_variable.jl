using LinearAlgebra

long=Int(1e2)
l=long-1
f(a,b)=[a^2-b^2-3,a-b-3]
x=zeros(2,long)
x[1,1]=1.9
x[2,1]=-1.1
F=zeros(2,long)

ϵ=1e-7
j_inv=zeros(2,2,long)
i=0
exit=long
j_inv[:,:,1]=Matrix(I,2,2)
for i=2:l
#while true
    #global i
    #i=i+1
    dx=x[:,i]-x[:,i-1]
    #tmp_F = F[:,1]

    F[:,i]=f(x[1,i],x[2,i])
    dxt=transpose(dx)
    dF=F[:,i]-F[:,i-1]
    #upadte Jk invers
    j_inv[:,:,i]=j_inv[:,:,i-1]+(dx-j_inv[:,:,i-1]*dF)/(dxt*j_inv[:,:,i-1]*dF)*(dxt*j_inv[:,:,i-1])
    println("jinv=",j_inv[:,:,i])
   
    x[:,i+1]=x[:,i]-j_inv[:,:,i]*F[:,i]
   
    println("dx=",dx)
    println("dxt=",dxt)
    println("dF=",dF)
    println("x=",x[:,i])
    println("f=",F[:,i])
    println("norm:",norm(f(x[1,1],x[2,1])))

    if norm(f(x[1,i],x[2,i]))<ϵ
        break
    end
    #j_inv[:,:,2]=j_inv[:,:,1]
    #x[:,2]=x[:,1]
    #F[:,2]=tmp_F
  #  x[1,1]=2
  #  x[2,1]=-1
   
  #  if i>=exit
  #      break
  #  end
#end#while
end#for
println("exit")