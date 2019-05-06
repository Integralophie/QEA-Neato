% This part defines the range of the Gauntlet
[px,py]=meshgrid(-.4:.05:1.4,-.5:.05:2.5);
[xlim,ylim] = size(px);
V = zeros(xlim, ylim);

% This part defines the integral. Instead of using the function "Integral",
% the numerical value of integrals are manually calculated to save time on
% running. 

M = [.1072;9.4248;.0039;.4195;-2.089;.3365;.046;-0.1];
B = [1.327;-1.0683;2.1578;.0733;2.434;-.211;-.3076;-1.828];
DOMAIN = [0,.25;.25,.3;0,.4;.95,1.1;.75,.96;-.5,0;.25,1.5;.8144,1.044]';
gradient = createGradient(M,B,DOMAIN)
function [result] = createGradient (M,B,DOMAIN)
    result = 0
    for i = 1:8

    m = M(i);
    b = B(i);

    domain = DOMAIN(:,i);

    result = -createLine(m,b,domain) + result;
    end
    
    fsurf(result/100)

    axis([-.25 1.25 -.25 2.25 -10 10])

end

function [result] = createLine (m,b,domain)

    x = linspace(domain(1),domain(2));
    syms X Y
    result = 0;

    for i = 1:100
        result = result + log((sqrt((X-x(i))^2+(Y-(m*x(i)+b))^2)));
    end
end

