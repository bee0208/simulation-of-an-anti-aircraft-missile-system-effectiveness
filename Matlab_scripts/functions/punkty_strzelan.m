function [hE,hB,h] = punkty_strzelan(xyz_r,xyz_c)
%wyznaczanie odległości rakiety i celu od SNR oraz odległości między rakietą a celem
R=sqrt((xyz_c(end,1)-xyz_r(end,1))^2+(xyz_c(end,2)-xyz_r(end,2))^2+(xyz_c(end,3)-xyz_r(end,3))^2);
Rc=sqrt(xyz_c(end,1)^2+xyz_c(end,2)^2+xyz_c(end,3));
Rr=sqrt(xyz_r(end,1)^2+xyz_r(end,2)^2+xyz_r(end,3));

%wyznaczenie wektora przemieszczenia rakiety w końcowym momencie
delta_r=[xyz_r(end,1)-xyz_r(end-1,1)
    xyz_r(end,2)-xyz_r(end-1,2)
    xyz_r(end,3)-xyz_r(end-1,3)];

%wyznaczenie wektora przemieszczenia celu w końcowym momencie
delta_rc=[xyz_c(end,1)-xyz_c(end-1,1)
    xyz_c(end,2)-xyz_c(end-1,2)
    xyz_c(end,3)-xyz_c(end-1,3)];

%wyznaczenie wekora zbliżania rakiety do celu
delta_rz=[delta_r(1,1)-delta_rc(1,1)
    delta_r(2,1)-delta_rc(2,1)
    delta_r(3,1)-delta_rc(3,1)];

%wyznaczenie wektora linii obserwacji celu przez rakietę
wektor_rc=[xyz_c(end,1)-xyz_r(end,1)
        xyz_c(end,2)-xyz_r(end,2)
        xyz_c(end,3)-xyz_r(end,3)];

%wyznaczenie kątu azymutu i elewacji wektora linii obserwacji celu
B_rc=azymut(wektor_rc(1,1),wektor_rc(2,1));
if Rc>Rr
    E_rc=atan(wektor_rc(3,1)/sqrt(wektor_rc(1,1)^2+wektor_rc(2,1)^2));
else
    E_rc=atan((-1)*wektor_rc(3,1)/sqrt(wektor_rc(1,1)^2+wektor_rc(2,1)^2));
end

%wyznaczenie kątu azymutu i elewacji wektora zbliżania
B_delta_rz=azymut(delta_rz(1,1),delta_rz(2,1));
E_delta_rz=atan(delta_rz(3,1)/sqrt(delta_rz(1,1)^2+delta_rz(2,1)^2));

%wyznaczenie uchybów
hE=R*sin(E_delta_rz-E_rc);
hB=R*sin(B_delta_rz-B_rc);
h=sqrt(hE^2+hB^2);
end

