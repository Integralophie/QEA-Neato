gnorm = inf;
r = [0;0];
X = 0;
Y = 0;
lambda = 0.2;
delta = 1.02;
tol = 1E-3;
grad = createGradient(M,B,DOMAIN);
%I have problems with defining the initial position: if the X and Y are
%syms, no plot is created since we don't have a numerical value of X and Y
%I'm trying to use a for loop instead of a while loop
while gnorm>=tol
    % calculate gradient:
     
    Fx = diff(grad,X);
    Fy = diff(grad,Y);
    X = X + lambda * Fx;
    Y = Y + lambda * Fy;
    lambda = lambda * delta;
    gnorm = norm([Fx,Fy]);
   
     

    % plot current point
   
    scatter(X,Y)
    hold on

     
end
createGradient(M,B,DOMAIN)
hold off
