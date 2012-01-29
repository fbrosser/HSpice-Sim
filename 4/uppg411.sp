Frekvensegenskaper hos Forstarkarsteget

*.Model N NMOS Level=1 VT0=0.7 
*+ KP = 192
.Model N NMOS Level=1 VT0=0.7 KP=110U Gamma=0.4 Lambda=0.04 Phi=0.7

* Matningsspanning
.Param SupplyV = 3.3V
.Options Post

* Spanningskallor
VVdd Vdd 0 DC SupplyV

* a)
* Vin in 0 Sin(0.81 0.01 100k)
* b)
 Vin in 0 Sin(0.81 0.01 100MEG)
* c)
* Vin in 0 Sin(0.81 0.01 200MEG)

* NMOS
MN2 ut in 0 0 N W=50U L=1U
R2 Vdd ut 75k
C2 ut 0 20f

* Transientsimulering
* a)
* .Tran 10N 40U
* b)
 .Tran 10N 40n
* c)
* .Tran 10N 20n

.End
