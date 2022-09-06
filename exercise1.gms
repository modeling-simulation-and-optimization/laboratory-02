$onText
Laboratorio 2 - MOS
Ejercicio 1

Realizado por:
Juan Andrés Romero C - 202013449
Juan Sebastián Alegría - 202011282
$offText

Sets i 'Origin CPUs'           /i1, i2, i3/
     j 'Destination CPUs'      /j1, j2/
     p 'Proccess Type'         /pk, pu/;
     
Table oProcess(i,p) 'Amount of processes supplied by Origin'
     pk  pu
 i1  60  80 
 i2  80  50
 i3  50  50;
 
Table dProcess(j,p) 'Amount of procceses needed by Destination'
     pk  pu
 j1  100 60 
 j2  90  120;
     
Table cost(i, j) 'Transmission costs between CPUs' 
     j1  j2
 i1  300 500
 i2  200 300
 i3  600 300;
 
Variables
  x(i,j,p) 'Amount of processes sent per path and type'
  z        'Target Function';
  
Positive Variable
    x;
  

Equations
    targetFunc 'Target Function'
    maxProcessesSent(i,p) 'Maximum amount of processes sent per origin CPU'
    satisfiedCPUDemand(j,p) 'Destination CPU process demand';
    
targetFunc .. z =e= sum((i,j,p), cost(i,j)*x(i,j,p));
maxProcessesSent(i,p) .. sum((j), x(i,j,p)) =l= oProcess(i,p);
satisfiedCPUDemand(j,p) .. sum((i), x(i,j,p)) =e= dProcess(j,p);


Model Exercise3 /all/;
option MIP=CPLEX;
Solve Exercise3 using LP minimizing z;
Display x.l;