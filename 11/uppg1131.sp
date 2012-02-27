Forstarkarens hogfrekvensegenskaper

.Model N NMOS Level=1 VT0=0.7 KP=110u Gamma=0.4 Lambda=0.04 Phi=0.7

.Param SupplyV = 3.3V
+ Vinf = 1MEG

.Options Post

* Natdeklaration
R1 in0 in 10k
R2 Vdd ut 75k
C2 ut 0 5f
CF in ut 2f
MN1 ut in 0 0 N W=50u L=1u AD=100e-12 AS=100e-12 PS=104e-6 PD104e-6

* Insignal med amplitud 10mV, arbetspunkt 0.81V
Vin in 0 AC sin(0.81 0.01 Vinf)

* Matningsspanning
VVdd Vdd 0 DC SupplyV

* Variera frekvensen for Vin 1MHz -> 1THz med 10 punkter per dekad
.AC DEC 10 1Meg 10T

* Transientsimulering
*.Tran '0.0001*1/Vinf' '2*1/Vinf'

.End
