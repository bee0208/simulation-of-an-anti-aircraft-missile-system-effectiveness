function [hE,hB,h] = punkty_strzelan(xyz_r,xyz_c)
%determination of rocket and target distance from SNR and distance between rocket and target
R=sqrt((xyz_c(end,1)-xyz_r(end,1))^2+(xyz_c(end,2)-xyz_r(end,2))^2+(xyz_c(end,3)-xyz_r(end,3))^2);
Rc=sqrt(xyz_c(end,1)^2+xyz_c(end,2)^2+xyz_c(end,3));
Rr=sqrt(xyz_r(end,1)^2+xyz_r(end,2)^2+xyz_r(end,3));

% determination of the rocket's displacement vector at the final moment
delta_r=[xyz_r(end,1)-xyz_r(end-1,1)
    xyz_r(end,2)-xyz_r(end-1,2)
    xyz_r(end,3)-xyz_r(end-1,3)];

% determination of the target's displacement vector at the final moment
delta_rc=[xyz_c(end,1)-xyz_c(end-1,1)
    xyz_c(end,2)-xyz_c(end-1,2)
    xyz_c(end,3)-xyz_c(end-1,3)];

% determination of the rocket's approach vector to the target
delta_rz=[delta_r(1,1)-delta_rc(1,1)
    delta_r(2,1)-delta_rc(2,1)
    delta_r(3,1)-delta_rc(3,1)];

%determination of the vector of the line of observation of the target by the rocket
wektor_rc=[xyz_c(end,1)-xyz_r(end,1)
        xyz_c(end,2)-xyz_r(end,2)
        xyz_c(end,3)-xyz_r(end,3)];


%determination of the azimuth angle and elevation of the target observation line vector
B_rc=azymut(wektor_rc(1,1),wektor_rc(2,1));
if Rc>Rr
    E_rc=atan(wektor_rc(3,1)/sqrt(wektor_rc(1,1)^2+wektor_rc(2,1)^2));
else
    E_rc=atan((-1)*wektor_rc(3,1)/sqrt(wektor_rc(1,1)^2+wektor_rc(2,1)^2));
end

%determination of the azimuth angle and elevation of the approach vector
B_delta_rz=azymut(delta_rz(1,1),delta_rz(2,1));
E_delta_rz=atan(delta_rz(3,1)/sqrt(delta_rz(1,1)^2+delta_rz(2,1)^2));

%determination of errors
hE=R*sin(E_delta_rz-E_rc);
hB=R*sin(B_delta_rz-B_rc);
h=sqrt(hE^2+hB^2);
end

