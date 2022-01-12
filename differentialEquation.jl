begin
    using Pkg
    using QuadGK
    using Plots
    using Richardson
    using CalculusWithJulia
    using SymPy
end


function d(f)
    @syms h::real
    return (x) -> limit((f(x+h) - f(x))/h, h => 0)
end


function B_f(v, dv, w, dw)
    integral, err = quadgk((x) -> dv(x)*dw(x), 0, 3, rtol = 1e-3)
    return integral
end

function L_f(v,dv)
    G = 6.67*10^-11
    integral1, err1 = quadgk(v, 1, 2, rtol = 1e-3)
    integral2, err2 = quadgk(dv, 0, 3, rtol = 1e-3)
    return -4*pi*G*integral1 + (1/3)*integral2
end

function solve_equatacion(n)
    println("-----")
    # e = [(x) -> ( ((i-1)/n <= x <= i/n) ? n*x - i + 1 :   #((x - (i-1)/n)/(i/n - (i-1)/n))
    #                 (i/n <= x <= (i+1)/n) ? i+1 - n*x :  # (((i+1)/n - x)/((i+1)/n - i/n))
    #                 0 )
    #                 for i = 0:n]
    e = [(x) -> (3*(i-1)/n <= x < 3*i/n) ? (n/3)*x - i + 1 :
                (3*(i)/n <= x <= 3*(i+1)/n) ? 1 + i - (n/3)*x :
                0
                for i = 0:n]
    de = [(x) -> (3*(i-1)/n <= x <= 3*i/n) ? n/3 :
                 (3*(i)/n <= x <= 3*(i+1)/n) ? -n/3 :
                 0
                 for i = 0:n]

    A = [ B_f(e[i],de[i],e[j],de[j]) for i = 1:n+1, j = 1:n+1 ]
    R = [ L_f(e[i],de[i]) + B_f(x -> 5 - x/3,x -> -1/3, e[i], de[i]) for  j = 1:1, i = 1:n+1 ]
    X = R/A
    print("A ")
    println(A)
    println(det(A))
    print("R ")
    println(R)
    print("X")
    println(X)
    println(det(A))
    Y = [sum([X[i]*e[i](j*3/10) for i in 1:n+1])  for j = 0:9]
    u = map((x) -> 5 - x/3, [(j*3/10) for j in 0:9])
    println(u)
    println("Y")
    println(vec(Y) + u)
    plot([j*3/10 for j = 0:9], vec(Y) + u)


end

solve_equatacion(20)
