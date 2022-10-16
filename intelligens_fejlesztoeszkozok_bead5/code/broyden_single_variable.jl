#Newton
f(x)=x^3-x-2

approx(x,x_n_1) = (f(x) - f(x_n_1)) / (x - x_n_1)
newton(x,x_n_1) = x-(f(x)/approx(x,x_n_1))
	
#starting point is same as the secant method
x=-10
ϵ = 10e-7
idx = 0
while (true)
	global x
	global x_n_1
	global idx
	if idx == 0
		x_n_1 = x
		x=newton(x,0)
		idx += 1	
	else
		tmp = x
		x=newton(x,x_n_1)
		x_n_1 = tmp
	end

	println("x= ",x)
	println("f(x)= ",f(x))
	println()
	
	if abs(f(x))<ϵ
		break
	end
end