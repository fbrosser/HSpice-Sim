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
MP1 Vdd in ut Vdd P W=2u L=1u

* mn1 VSS IN OUT VSS n l=0.24u w=0.72u

* mp1 VDD IN OUT VDD p l=0.24u w=0.72u

* vVDD VDD 0 3.3
* vVSS VSS 0 0

Vin in 0 pulse(0 3.3 100ps 100ps 100ps 2ns 4ns)

* DC Sweep, Vin 0 -> 3.3V, 1mV inkrement
.DC Vin Start=0 Stop=SupplyV Step=10m

* Transientsimulering
.Tran 1ps 8ns
 
.End
