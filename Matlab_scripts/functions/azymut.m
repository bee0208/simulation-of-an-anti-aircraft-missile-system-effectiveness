function y = azymut(x, y)

if x>0 && y>0
    u=abs(atan(y/x));
elseif x<0 && y>0
    u=pi-abs(atan(y/x));
elseif x<0 && y<0
    u=pi+abs(atan(y/x));
else
    u=2*pi-abs(atan(y/x));
end
y = u;
