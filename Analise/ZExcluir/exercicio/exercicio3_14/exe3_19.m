x = [ 0.7 1.2 1.3 1.5 2 2.3 2.6];
y = [0.043 1.928 2.497 3.875 9 13.467 19.176];

c = coeficientes_polinomio(x,y);

printf(" %d + %d*x + %d*x^2 + %d*x^3 + %d*x^4 + %d*x^5 + %d*x^6\n\n\n", c(1), c(2), c(3),c(4),c(5),c(6), c(7))

z = c(1) + c(2)*1.4 + c(3)*1.4^2 + c(4)*1.4^3 + c(5)*1.4^4 + c(6)*1.4^5 + c(7)*1.4^6 