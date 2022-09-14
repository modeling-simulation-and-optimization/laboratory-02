$onText
Laboratorio 2 - MOS
Ejercicio 3

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Zones' /i1*i12/
alias(j,i);

Parameter edges(i,j) graph edges;

* Connections from node 1
edges('i1','i2') = 1;
edges('i1','i3') = 1;
edges('i1','i5') = 1;
* Connections from node 2
edges('i2','i5') = 1;
* Connections from node 3
edges('i3','i6') = 1;
edges('i3','i4') = 1;
edges('i3','i5') = 1;
edges('i3','i7') = 1;
edges('i3','i8') = 1;
* Connections from node 4
edges('i4','i5') = 1;
edges('i4','i6') = 1;
edges('i4','i11') = 1;
* Connections from node 5
edges('i5','i10') = 1;
edges('i5','i11') = 1;
* Connections from node 6
edges('i6','i8') = 1;
edges('i6','i11') = 1;
* Connections from node 7
edges('i7','i8') = 1;
edges('i7','i12') = 1;
* Connections from node 8
edges('i8','i9') = 1;
edges('i8','i11') = 1;
edges('i8','i12') = 1;
* Connections from node 9
edges('i9','i10') = 1;
edges('i9','i11') = 1;
edges('i9','i12') = 1;
* Connections from node 10
edges('i10','i11') = 1;

* Since it's an undirected graph there are bidirectional connections
loop((i,j),
    if ((edges(i,j) = 1),
        edges(j,i) = 1
    );
);

* We also need to consider that the zone that the antenna is being installed at
* also has coverage
loop((i),
    edges(i,i) = 1;
);


Variables
    x(i) 'Node selected'
    z 'Target function';
    
Binary Variable
    x;

Equations
    targetFunc 'Target Function'
    coverage(i) 'All nodes must be covered';
    
targetFunc .. z =e= sum(i, x(i));
coverage(i) .. sum((j), x(j)*edges(i,j)) =g=1;



Model Exercise3 /all/ ;
option mip=cplex
Solve Exercise3 using mip minimizing z;
Display x.l;


