Transientanalys av PMOS modellerad med ON-Resistans

* Matningsspanning och pmoskonstanter
.Param SupplyV=3.3V OnResVal=1748
.Options Post
* Initialtillstand
.IC V(ut)=0

* On-resistans
Ron Vdd ut OnResVal

* Lastkapacitans
CL ut 0 20f

* Vdd kalla
VVdd Vdd 0 DC SupplyV

.Tran 0.01p 200p UIC
.Probe IVdd=Par('-I(VVdd)')

.End
