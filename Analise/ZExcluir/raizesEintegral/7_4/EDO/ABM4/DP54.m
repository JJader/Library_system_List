% algoritmo DP54
% Resolver um PVI pelo método de Dormand-Price(5,4)
%
% Entrada: 
%  a,b --> limites, 
%  y0 --> valor inicial, 
%  m --> número de subintervalos, 
%  f = inline('f(x)')
%
%
% Saída: vetX, vetY, dify

function [vetX,vetY,dify] = DP54(a,b,y0,m,f)
  
  a21  =  (1.0/5.0);
  a31  = (3.0/40.0);
  a32  = (9.0/40.0);
  a41  = (44.0/45.0);
  a42   = (-56.0/15.0);
  a43   = (32.0/9.0);
  a51  =  (19372.0/6561.0);
  a52    =(-25360.0/2187.0);
  a53   = (64448.0/6561.0);
  a54   = (-212.0/729.0);
  a61   = (9017.0/3168.0);
  a62   = (-355.0/33.0);
  a63   = (46732.0/5247.0);
  a64  = (49.0/176.0);
  a65  = (-5103.0/18656.0);
  a71  = (35.0/384.0);
  a72  = (0.0);
  a73  = (500.0/1113.0);
  a74  = (125.0/192.0);
  a75  = (-2187.0/6784.0);
  a76  = (11.0/84.0);

  c2   = (1.0 / 5.0);
  c3   = (3.0 / 10.0);
  c4   = (4.0 / 5.0);
  c5   = (8.0 / 9.0);
  c6   = (1.0);
  c7   = (1.0);

  b1   = (35.0/384.0);
  b2   = (0.0);
  b3   = (500.0/1113.0);
  b4   = (125.0/192.0);
  b5   = (-2187.0/6784.0);
  b6   = (11.0/84.0);
  b7   = (0.0);

  b1p  = (5179.0/57600.0);
  b2p  = (0.0);
  b3p  = (7571.0/16695.0);
  b4p  = (393.0/640.0);
  b5p  = (-92097.0/339200.0);
  b6p  = (187.0/2100.0);
  b7p  = (1.0/40.0);
  
  h = (b-a)/m;
  xt = a;
  yt = y0;
  
  vetX(1) = xt;
  vetY(1) = yt;
  dify(1) = 0;
  
  for i = 1:m
    x = xt;
    y = yt;
    
    K1 = f(x,y);
    K2 = f(x+ c2*h, y+h*(a21*K1));
    K3 = f(x+ c3*h, y+h*(a31*K1+a32*K2));
    K4 = f(x+ c4*h, y+h*(a41*K1+a42*K2+a43*K3));
    K5 = f(x+ c5*h, y+h*(a51*K1+a52*K2+a53*K3+a54*K4));
    K6 = f(x+h, y+h*(a61*K1+a62*K2+a63*K3+a64*K4+a65*K5));
    K7 = f(x+h, y+h*(a71*K1+a72*K2+a73*K3+a74*K4+a75*K5+a76*K6));
    
    xt = a+i*h;
    y4t = yt+h*(b1p*K1 + b3p*K3 + b4p*K4 + b5p*K5 + b6p*K6 + b7p*K7);
    yt = yt + h*(a71*K1 + a73*K3 + a74*K4 + a75*K5 + a76*K6);
    
    vetX(i+1) = xt;
    vetY(i+1) = yt;
    dify(i+1) = yt-y4t;
  endfor
endfunction  