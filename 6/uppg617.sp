Transientanalys av PMOS

* PMOS-Modell
.MODEL P PMOS LEVEL=1 VT0=-0.7 KP=50U GAMMA=0.57 LAMBDA=0 PHI=0.8

* Matningsspanning och pmoskonstanter
.Param SupplyV=3.3V
.Options Post
* Initialtillstand
.IC V(ut)=0

* Lastkapacitans
CL ut 0 20f

* PMOS
MP1 Vdd in ut Vdd P W=4.4u L=1u

* Spanningskallor
VVdd Vdd 0 DC SupplyV
Vin in 0 DC 0

.Tran 0.01p 200p UIC
.Probe IVdd=Par('-I(VVdd)')

.End
