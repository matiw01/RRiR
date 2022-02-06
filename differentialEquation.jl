begin
    using Pkg
    using QuadGK
    using Plots
    using CalculusWithJulia
end

# B(u, v) functional
function B_f(dv, i, dw, j, n)
    if abs(i-j) > 1
        return 0
    end
    h = 3/n
    integral, err = quadgk((x) -> dv(x)*dw(x), min(0,h*(i-1)), min(3,h*(i+1)), rtol = 1e-3)
    return -integral
end

# L(V) functional
function L_f(v)
    G = 6.67*10^-11
    integral1, err1 = quadgk(v, 1, 2, rtol = 1e-3)
    return 4*pi*G*integral1
end

function solve_equatacion(n)
    println("-----")
    h = 3/n
#   creation of e functions (linear functions used to create result function)
    e = [(x) -> (h*(i-1) <= x < h*i) ? x/h - i + 1 :
                (h*i <= x <= h*(i+1)) ? 1 + i - x/h :
                0
                for i = 1:n-1]
#   creation of derivatives of e functions
    de = [(x) -> (h*(i-1) <= x < h*i) ? 1/h :
                (h*i <= x <= h*(i+1)) ? -1/h :
                 0
                 for i = 1:n-1]
#   A, R, X matrixes are creating an equation A*X = R
    A = [ B_f(de[j],j, de[i],i,n) for i = 1:n-1, j = 1:n-1 ]
    R = [ L_f(e[i]) - B_f(x -> -1/3,i, de[i],i,n) for  j = 1:1, i = 1:n-1 ]
#   getting X (unown vector) out of an previous equation A*X = R -> X = R/A
    X = R/A
#   creating chart of a funcion by calculating sum of (5 - x/3) and funcion created as sum of X[i]*e[i] for i in 1:n-1 in 100 points in domain
    Y = [sum([X[i]*e[i](j*3/100) for i in 1:n-1])  for j = 0:99]
    u = map((x) -> 5 - x/3, [(j*3/100) for j in 0:99])
    plot([j*3/100 for j = 0:99], vec(Y) + u)
end

solve_equatacion(100)
