$onText
Laboratorio 2 - MOS
Ejercicio 4

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Graph Nodes' /i1*i7/
     coords 'Coordinate Dimensions' /coordX, coordY/
     alias(j,i);

Table positions(i, coords)
    coordX  coordY
i1  20      6
i2  22      1
i3  9       2
i4  3       25
i5  21      10
i6  29      2
i7  14      12;

Parameter distance(i,j) 'Distances between nodes';

Parameter graph(i,j) 'Resulting graph between the node set';


loop((i,j),
    distance(i,j) = sqrt(sqr(positions(i, 'coordX') - positions(j, 'coordX')) + sqr(positions(i, 'coordY') - positions(j, 'coordY')));
    if ((distance(i,j) <=20 and distance(i,j) >0),
        graph(i,j) = distance(i,j);
    else
        graph(i,j) = 999;
    );
);

Scalar sourceNode /4/;
Scalar destinationNode /6/;

Variables
  x(i,j)      Indicates if the link i-j is selected or not.
  z           Objective function  ;

Binary Variable x;

Equations
targetFunc               target function
sourceNodeRestriction(i)            source node
destinationNodeRestriction(j)       destination node
intermediateNodeRestriction         intermediate node;

targetFunc                                                                           ..  z =e= sum((i,j), graph(i,j) * x(i,j));

sourceNodeRestriction(i)$(ord(i) = sourceNode)                                       ..  sum((j), x(i,j)) =e= 1;

destinationNodeRestriction(j)$(ord(j) = destinationNode)                             ..  sum((i), x(i,j)) =e= 1;

intermediateNodeRestriction(i)$(ord(i) <> sourceNode and ord(i) ne destinationNode)  ..  sum((j), x(i,j)) - sum((j), x(j,i)) =e= 0;

Model Exercise4 /all/ ;
option mip=cplex
Solve Exercise4 using mip minimizing z;

Display graph;
Display x.l;
Display z.l;