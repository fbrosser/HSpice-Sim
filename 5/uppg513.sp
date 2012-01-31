Simulering av CMOS-Inverterare

* MOSFET-modeller
.MODEL N NMOS LEVEL=1 VT0=0.7 KP=110U GAMMA=0.4 LAMBDA=0.04 PHI=0.7
.MODEL P PMOS LEVEL=1 VT0=-0.7 KP=50U GAMMA=0.57 LAMBDA=0.05 PHI=0.8

* Matningsspanning
.Param SupplyV = 3.3V
.Options Post

* Spanningskallor
VVdd Vdd 0 DC SupplyV
* Vin in 0 DC SupplyV

* NMOS
MN1 0 in ut 0 N W=2u L=1u

* PMOS
MP1 Vdd in ut Vdd P W=4.4u L=1u

Vin in 0 SupplyV

* DC Sweep, Vin 0 -> 3.3V, 1mV inkrement
.DC Vin Start=0 Stop=SupplyV Step=1m

* Transientsimulering
.Tran 1ps 8ns
 
.End
