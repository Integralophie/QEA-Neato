function [result] = createLine (m,b,domain)

    x = linspace(domain(1),domain(2));
    syms X Y
    result = 0;

    for i = 1:100
        result = result + log((sqrt((X-x(i))^2+(Y-(m*x(i)+b))^2)));
    end
end
