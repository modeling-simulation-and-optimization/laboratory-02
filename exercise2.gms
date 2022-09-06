$onText
Laboratorio 2 - MOS
Ejercicio 2

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets t 'ML Techniques' /S, NS, DL, RL/
     c 'Scientists' /c1, c2, c3, c4, c5, c6/;
     
Table scores(t,c)
    c1 c2 c3 c4 c5 c6
S   85 88 87 82 91 86
NS  78 77 77 76 79 78
DL  82 82 82 80 86 81
RL  84 84 88 83 84 85;

Variables
    x(t,c) 'Scientist/Technique selected'
    z 'Target function';
    
Binary Variable
    x;

Equations
    targetFunc 'Target Function'
    uniqueConstraintT(t) 'Every technique must be done by a single scientist'
    uniqueConstraintC(c) 'Every scientist can do only one technique (max 4 scientists)'
    maxScientists 'Max number of scientists required for the study';
    
targetFunc .. z =e= sum((t,c), t(t,c)*x(t,c));
uniqueConstraintT(t) .. sum((c), x(t,c)) =e= 1;
uniqueConstraintC(c) .. sum((t), x(t,c)) =e= 1;

Model Exercise2 /all/;
option MIP=CPLEX;
Solve Exercise2 using mip maximizing z;
Display x.l;
Display z.l;