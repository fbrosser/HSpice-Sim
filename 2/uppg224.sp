Transistormodeller, Simulering av forstarkarsteg - UPPGIFT 2.2.4

* Modelldeklarationer
.MODEL N NMOS LEVEL=1 VT0=0.7 KP=110u GAMMA=0.4 LAMBDA=0.04 PHI=0.7

.PARAM SUPPLYV=3.3V
.OPTIONS POST

R2 VDD UT 3300
* Transistorbredd inom intervallet
* MN1 UT IN 0 0 N W=24U L=1U
* Transistorbredd over intervallet
* MN1 UT IN 0 0 N W=32U L=1U
* Transistorbredd under intervallet
* MN1 UT IN 0 0 N W=12U L=1U

VVDD VDD 0 DC SUPPLYV
VIN IN 0 SIN(1.2 0.2 1MEG)

* Transientsimulering
.TRAN 10N 2U

.END
