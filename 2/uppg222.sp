Transistormodeller, Simulering av forstarkarsteg - UPPGIFT 2.2.1

.OPTIONS POST

* Modelldeklarationer
.MODEL N NMOS Level=1 Vt0=0.7 Kp=110u Gamma=0.4 Lambda=0.04 Phi=0.7
.MODEL P PMOS Level=1 Vt0=0.7 Kp=50u Gamma=0.57 Lambda=0.05 Phi=0.8

.PARAM SupplyV = 3.3V

R2 Vdd Ut 3.3k
MN1  Ut In 0 0 N L=1u W=181.5u

VVdd Vdd 0 DC SupplyV
Vin In 0 DC SupplyV

.DC Vin 0 SupplyV 0.1

.END
