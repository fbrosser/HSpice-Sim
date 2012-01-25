Transistormodeller, Simulering av forstarkarsteg - UPPGIFT 2.2.2

* Modelldeklarationer
.MODEL N NMOS LEVEL=1 VT0=0.7 KP=110u GAMMA=0.4 LAMBDA=0.04 PHI=0.7

.PARAM SUPPLYV=3.3V
.OPTIONS POST

R2 VDD UT 3300
MN1 UT IN 0 0 N W=28.4U L=1U

VVDD VDD 0 DC SUPPLYV
VIN IN 0 DC SUPPLYV
 
.print I(N1)
.probe v(*) i(*)

* Spanningssvep, Vin fran 0 till 3.3V i steg om 0.1V
.DC VIN 0 SUPPLYV 0.1

.END
