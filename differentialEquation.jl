begin
    using Pkg
    using QuadGK
    using Plots
    using CalculusWithJulia
end

function B_f(dv, i, dw, j, n)
    h = 3/n
    integral, err = quadgk((x) -> dv(x)*dw(x), min(0,h*(i-1)), min(3,h*(i+1)), rtol = 1e-3)
    return -integral
end

function L_f(v)
    G = 6.67*10^-11
    integral1, err1 = quadgk(v, 1, 2, rtol = 1e-3)
    return 4*pi*G*integral1
end

function solve_equatacion(n)
    println("-----")
    h = 3/n
    e = [(x) -> (h*(i-1) <= x < h*i) ? x/h - i + 1 :
                (h*i <= x <= h*(i+1)) ? 1 + i - x/h :
                0
                for i = 1:n-1]
    de = [(x) -> (h*(i-1) <= x < h*i) ? 1/h :
                (h*i <= x <= h*(i+1)) ? -1/h :
                 0
                 for i = 1:n-1]

    A = [ B_f(de[j],j, de[i],i,n) for i = 1:n-1, j = 1:n-1 ]
    R = [ L_f(e[i]) - B_f(x -> -1/3,i, de[i],i,n) for  j = 1:1, i = 1:n-1 ]
    # print("det(A) = ")
    # println(det(A))
    # println("A ")
    # display(A)
    X = R/A
    # print("R ")
    # println(R)
    # print("X")
    # println(X)
    Y = [sum([X[i]*e[i](j*3/100) for i in 1:n-1])  for j = 0:99]
    u = map((x) -> 5 - x/3, [(j*3/100) for j in 0:99])
    # println(u)
    # println("Y")
    # println(vec(Y) + u)
    plot([j*3/100 for j = 0:99], vec(Y) + u)


end

solve_equatacion(100)
