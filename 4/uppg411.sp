Frekvensegenskaper hos Forstarkarsteget

.Model N NMOS Level=1 VT0=0.7 KP=150U Gamma=0.4 Lambda=0.04 Phi=0.7

* Matningsspanning
.Param SupplyV = 3.3V
.Options Post

* Spanningskallor
VVdd Vdd 0 DC SupplyV
Vin in 0 Sin(1.3 0.01 1MEG)

* NMOS
MN2 ut in 0 0 N W=50U L=1U
R2 Vdd Ut 75k
C2 ut 0 20f

* Transientsimulering
.Tran 10N 2U

.End
