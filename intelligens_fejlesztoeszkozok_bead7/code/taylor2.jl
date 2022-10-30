# 1 feladat
function f11(x)
    sin(x)
end

x₀ = π/4

f11ₜ₁(x) = 1/sqrt(2) + 1/sqrt(2) *(x - π/4)
f11ₜ₂(x) = 1/sqrt(2) + 1/sqrt(2) *(x - π/4) - 2/sqrt(2) *(x - π/4)^2 
f11ₜ₃(x) = 1/sqrt(2) + 1/sqrt(2) *(x - π/4) - 2/sqrt(2) *(x - π/4)^2 - sqrt(2)/12 *(x - π/4)^3

# 2 feladat
function f2(x)
    sin(x)
end

### function plotter
    LONG=Int(20) #step number
    δ=0.2
    l=LONG-1 

    hf1 = zeros(LONG)
    hf1t1 = zeros(LONG)
    hf1t2 = zeros(LONG)
    hf1t3 = zeros(LONG)
    m = zeros(LONG)
    
    hf1[1] = f11(-1)
    hf1t1[1] = f11ₜ₁(-1)
    hf1t2[1] = f11ₜ₂(-1)
    hf1t3[1] = f11ₜ₃(-1)
    m[1] = -1

    for i in 1:l
        hf1[i]   = f11(m[i])
        hf1t1[i] = f11ₜ₁(m[i])
        hf1t2[i] = f11ₜ₂(m[i])
        hf1t3[i] = f11ₜ₃(m[i])
        m[i+1]   = m[i]+δ
    end
    
    #xkcd()
    using PyPlot
    figure()    
            
    #ax = gca()
    #axis("tight")
    ##ax.spines["top"].set_visible(false) # Hide the top edge of the axis
    ##ax.spines["right"].set_visible(false) # Hide the right edge of the axis
    #ax.spines["left"].set_position("center") # Move the right axis to the center
    #ax.spines["bottom"].set_position("center") # Most the bottom axis to the center
    ##ax.spines["left"].set_smart_bounds(true)
    #ax.xaxis.set_ticks_position("bottom") # Set the x-ticks to only the bottom
    #ax.yaxis.set_ticks_position("left") # Set the y-ticks to only the left

    plot(m[1:l],hf1[1:l])
    plot(m[1:l],hf1t1[1:l])
    plot(m[1:l],hf1t2[1:l])
    plot(m[1:l],hf1t3[1:l])
    grid("on")
    title(" sin(x) és 1, 2., 3. Taylor sora")
    legend(["sin(x)", "T₁(f(x)) ", "T₂f(x) ", "T₃f(x) "])
    #annotate("THE DAY I REALIZED\nI COULD COOK BACON\nWHENEVER I WANTED",xy=[0;0],arrowprops=Dict("arrowstyle"=>"->"),xytext=[0;0.8])
    display(gcf())
    
#    using PyPlot
#    figure()
#    plot(m[1:l],hf1t1#   2plot(m[1:l],hf1t1[1:l])
#    display(gcf())
