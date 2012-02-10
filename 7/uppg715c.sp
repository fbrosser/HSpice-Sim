Transientanalys av effekt i CMOS-inverterare, Wp=Wn=4.4um

* PMOS-Modell
.MODEL P PMOS LEVEL=1 VT0=-0.7 KP=50U GAMMA=0.57 LAMBDA=0 PHI=0.8
.MODEL N NMOS LEVEL=1 VT0=0.7 KP=110U GAMMA=0.4 LAMBDA=0 PHI=0.7

* Matningsspanning och pmoskonstanter
.Param SupplyV=3.3V
.Options Post
* Initialtillstand
.IC V(ut)=0

* Lastkapacitans
CL ut 0 20f

* PMOS
MP1 Vdd in ut Vdd P W=8.8u L=1u
MN1 ut in 0 0 N W=8.8u L=1u

* Spanningskallor
VVdd Vdd 0 DC SupplyV
Vin in 0 DC 0

.Tran 0.01p 300p UIC
.Probe IVdd=Par('-I(VVdd)')

.End
