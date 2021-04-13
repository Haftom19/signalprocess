function [C] = convolution(a,b)
l1 = length(b);
l2 = length(a);
m = l1+l2-1;
c = zeros(1, m);
for i = 1:l1
    for j = 1:l2
       c(i+j-1) = c(i+j-1) + a(j)*b(i);
    end
end
C = c;
end