function P = jacobian_P(Fext,M,g,l,m,sigma,theta,thetad)
%jacobian_P
%    P = jacobian_P(Fext,M,G,L,m,SIGMA,THETA,THETAD)

%    This function was generated by the Symbolic Math Toolbox version 24.1.
%    28-Nov-2024 16:57:40

t2 = cos(theta);
t3 = sin(theta);
t4 = Fext.*l;
t5 = sigma.*thetad;
t6 = l.^2;
t7 = m.^2;
t8 = thetad.^2;
t12 = 1.0./l;
t14 = 1.0./m;
t9 = t2.^2;
t10 = M.*t5;
t11 = m.*t5;
t13 = 1.0./t6;
t15 = t2.*t5;
t17 = m.*t2.*t4;
t19 = M.*g.*l.*m.*t3;
t21 = g.*l.*m.*t2.*t3;
t22 = g.*l.*t3.*t7;
t23 = m.*t3.*t6.*t8;
t27 = t2.*t3.*t6.*t7.*t8;
t16 = m.*t9;
t18 = t9-1.0;
t28 = t4+t15+t21+t23;
t29 = t10+t11+t17+t19+t22+t27;
t20 = -t16;
t24 = M+m+t20;
t25 = 1.0./t24;
t26 = t25.^2;
P = reshape([0.0,t12.*t25.*(t3.*t6.*t8+g.*l.*t2.*t3)+t12.*t18.*t26.*t28,0.0,-t13.*t14.*t25.*(t5+t2.*t4+t2.*t23.*2.0+g.*l.*m.*t3.*2.0+M.*g.*l.*t3)+(t13.*t25.*t29)./t7-t13.*t14.*t18.*t26.*t29,0.0,-t12.*t26.*t28,0.0,t13.*t14.*t26.*t29-t13.*t14.*t25.*(t5+g.*l.*m.*t3)],[4,2]);
end
