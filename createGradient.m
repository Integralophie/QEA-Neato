function [result] = createGradient (M,B,DOMAIN)
    result = 0
    for i = 1:8

    m = M(i);
    b = B(i);

    domain = DOMAIN(:,i);

    result = -createLine(m,b,domain) + result;
    end
%     figure()
%     fsurf(result/100)
%     axis([-.25 1.25 -.25 2.25 -10 10])

    figure()
    fcontour(result/100)

    axis([-.25 1.25 -.25 2.25 -10 10])

end