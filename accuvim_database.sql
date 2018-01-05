DROP DATABASE IF EXISTS accuvim_monitor;
CREATE DATABASE accuvim_monitor;
USE accuvim_monitor;

CREATE TABLE divisiones
(     
     division_id INT NOT NULL PRIMARY KEY,
     division_nombre NVARCHAR(30) NOT NULL,
     ciudad NVARCHAR(20) NOT NULL
);

INSERT INTO divisiones(division_id, division_nombre, ciudad) VALUES (1, 'DICIS', 'Salamanca');
INSERT INTO divisiones(division_id, division_nombre, ciudad) VALUES (2, 'DICIVA', 'Irapuato');
INSERT INTO divisiones(division_id, division_nombre, ciudad) VALUES (3, 'Campus Yuriria', 'Yuriria');

CREATE TABLE subdivisiones
(
    division_id INT NOT NULL REFERENCES divisiones(division_id),
    edificio_id CHAR NOT NULL,
    edificio NVARCHAR(30) NOT NULL,
    ip NVARCHAR(15) NOT NULL,
    subnet_mask NVARCHAR(15) NOT NULL,
    gateway NVARCHAR(15) NOT NULL,
    dns1 NVARCHAR(15) NOT NULL,
    pa_ss INT NOT NULL,
    PRIMARY KEY(division_id, edificio_id)
);

INSERT INTO subdivisiones(division_id, edificio_id, edificio, ip, subnet_mask, gateway, dns1, pa_ss) VALUES (1, 'A', 'Edificio Central', '10.70.17.9', '255.255.254.0', '10.70.16.1', '10.70.102.10', 0000);
INSERT INTO subdivisiones(division_id, edificio_id, edificio, ip, subnet_mask, gateway, dns1, pa_ss) VALUES (1, 'B', 'Cafeteria', '10.70.17.10', '255.255.254.0', '10.70.16.1', '10.70.102.10', 0000);
INSERT INTO subdivisiones(division_id, edificio_id, edificio, ip, subnet_mask, gateway, dns1, pa_ss) VALUES (2, 'C', 'Edificio Central', '10.70.21.93', '255.255.254.0', '10.73.20.1', '8.8.8.8', 0000);
INSERT INTO subdivisiones(division_id, edificio_id, edificio, ip, subnet_mask, gateway, dns1, pa_ss) VALUES (2, 'D', 'Ex Hacienda', '10.73.16.250', '255.255.254.0', '10.73.16.1', '8.8.8.8', 1856);
INSERT INTO subdivisiones(division_id, edificio_id, edificio, ip, subnet_mask, gateway, dns1, pa_ss) VALUES (3, 'E', 'Campus Yuriria', '10.70.17.10', '255.255.254.0', '10.70.16.1', '10.70.102.10', 0000);

CREATE TABLE medidor_energy
(
    ip NVARCHAR(15) NOT NULL REFERENCES subdivisiones(ip),
    date_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    import_energy FLOAT(10,3) NOT NULL,
    export_energy FLOAT(10,3) NOT NULL,
    i_reactive_energy FLOAT(10,3) NOT NULL,
    e_reactive_energy FLOAT(10,3) NOT NULL,
    total_energy FLOAT(10,3) NOT NULL,
    net_energy FLOAT(10,3) NOT NULL,
    total_r_energy FLOAT(10,3) NOT NULL,
    net_r_energy FLOAT(10,3) NOT NULL,
    apparent_energy FLOAT(10,3) NOT NULL,
    import_energy_a FLOAT(10,3) NOT NULL,
    export_energy_a FLOAT(10,3) NOT NULL,
    import_energy_b FLOAT(10,3) NOT NULL,
    export_energy_b FLOAT(10,3) NOT NULL,
    import_energy_c FLOAT(10,3) NOT NULL,
    export_energy_c FLOAT(10,3) NOT NULL,
    i_r_energy_a FLOAT(10,3) NOT NULL,
    e_r_energy_a FLOAT(10,3) NOT NULL,
    i_r_energy_b FLOAT(10,3) NOT NULL,
    e_r_energy_b FLOAT(10,3) NOT NULL,
    i_r_energy_c FLOAT(10,3) NOT NULL,
    e_r_energy_c FLOAT(10,3) NOT NULL,
    apparent_energy_a FLOAT(10,3) NOT NULL,
    apparent_energy_b FLOAT(10,3) NOT NULL,
    apparent_energy_c FLOAT(10,3) NOT NULL,
    PRIMARY KEY(ip)
);

INSERT INTO medidor_energy(ip, date_time, import_energy, export_energy, i_reactive_energy, e_reactive_energy, 
total_energy, net_energy, total_r_energy, net_r_energy, apparent_energy, import_energy_a, 
export_energy_a, import_energy_b, export_energy_b, import_energy_c, export_energy_c, i_r_energy_a, 
e_r_energy_a, i_r_energy_b, e_r_energy_b, i_r_energy_c, e_r_energy_c, apparent_energy_a, 
apparent_energy_b, apparent_energy_c) VALUES ('10.70.17.9',
 '2017-12-30', 20135.000,0.000,1265.400,180.300,20135.000,20135.000,1445.700,1085.100,21364.400,
 6924.400,0.000,6893.500,0.000,6316.500,0.000,682.900,100.300,420.900,143.500,359.400,134.300,7383.900,7260.600,6719.400); -- 26
 
 CREATE TABLE medidor_metering
(
    ip NVARCHAR(15) NOT NULL REFERENCES subdivisiones(ip),
    date_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Ua FLOAT(10,3) NOT NULL,
    Ub FLOAT(10,3) NOT NULL,
    Uc FLOAT(10,3) NOT NULL,
    Un_avg FLOAT(10,3) NOT NULL,
    Uab FLOAT(10,3) NOT NULL,
    Ubc FLOAT(10,3) NOT NULL,
    Uca FLOAT(10,3) NOT NULL,
    Ul_avg FLOAT(10,3) NOT NULL,
    la FLOAT(10,3) NOT NULL,
    lb FLOAT(10,3) NOT NULL,
    lc FLOAT(10,3) NOT NULL,
    lavg FLOAT(10,3) NOT NULL,
    ln FLOAT(10,3) NOT NULL,
    Pa FLOAT(10,3) NOT NULL,
    Pb FLOAT(10,3) NOT NULL,
    Pc FLOAT(10,3) NOT NULL,
    P FLOAT(10,3) NOT NULL,
    Qa FLOAT(10,3) NOT NULL,
    Qb FLOAT(10,3) NOT NULL,
    Qc FLOAT(10,3) NOT NULL,
    Q FLOAT(10,3) NOT NULL,
    Sa FLOAT(10,3) NOT NULL,
    Sb FLOAT(10,3) NOT NULL,
    Sc FLOAT(10,3) NOT NULL,
    S FLOAT(10,3) NOT NULL,
    F FLOAT(10,3) NOT NULL,
    PFa FLOAT(10,3) NOT NULL,
    PFb FLOAT(10,3) NOT NULL,
    PFc FLOAT(10,3) NOT NULL,
    PF FLOAT(10,3) NOT NULL,
    Unbl_U FLOAT(10,3) NOT NULL,
    Unbl_l FLOAT(10,3) NOT NULL,
    load_type CHAR NOT NULL,
    P_Dmd FLOAT(10,3) NOT NULL,
    Q_Dmd FLOAT(10,3) NOT NULL,
    S_Dmd FLOAT(10,3) NOT NULL,
    la_Dmd FLOAT(10,3) NOT NULL,
    lb_Dmd FLOAT(10,3) NOT NULL,
    lc_Dmd FLOAT(10,3) NOT NULL,
    PRIMARY KEY(ip)
);

INSERT INTO medidor_metering(ip, date_time, Ua, Ub, Uc, Un_avg, Uab, Ubc, Uca, Ul_avg, la, lb, lc, lavg, ln,
Pa, Pb, Pc, P, Qa, Qb, QC, Q, Sa, Sb, Sc, S, F,
PFa, PFb, PFc, PF, Unbl_u, Unbl_l, load_type, P_Dmd, Q_Dmd, S_Dmd, la_Dmd, lb_Dmd, lc_Dmd) VALUES('10.70.17.9', '2017-12-30',
126.712,125.756,125.390,125.952,219.050,216.618,218.363,218.011,28.006,23.699,25.639,25.781,0.000,
3.317,2.901,3.072,9.289,-0.494,0.022,0.025,-0.446,3.546,2.987,3.213,9.746,60.000,
0.935,0.971,0.956,0.953,100.000,100.000,'c',9.903,-0.776,10.411,31.343,25.633,25.737);