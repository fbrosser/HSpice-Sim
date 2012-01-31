Simulering av CMOS-Inverterare

* MOSFET-modeller
.MODEL N NMOS LEVEL=1 VT0=0.7 KP=110U GAMMA=0.4 LAMBDA=0.04 PHI=0.7
.MODEL P PMOS LEVEL=1 VT0=-0.7 KP=50U GAMMA=0.57 LAMBDA=0.05 PHI=0.8

* Matningsspanning
.Param SupplyV = 3.3V
.Options Post

* Spanningskallor
VVdd Vdd 0 DC SupplyV
Vin in 0 DC SupplyV

* NMOS
MN1 ut in 0 0 N W=50u L=1u

* PMOS
MP1 Vdd in ut 0 P W=2u L=1u

* DC Sweep, Vin 0 -> 3.3V, 1mV inkrement
.DC Vin 0 SupplyV 1m

.End
