Transientanalys av PMOS modellerad med konstantströmkälla

* Matningsspanning och pmoskonstanter
.Param SupplyV=3.3V Wp=4.4u Lp=1u Kp=50u VT0=0.7 Laddtid=80n
.Options Post
* Initialtillstand
.IC V(ut)=0

* Lastkapacitans
CL ut 0 20f

* Vdd kalla
VVdd Vdd 0 DC SupplyV

* Stromkalla
IP Vdd ut pulse(0 '0.5*Kp*Wp/Lp*(SupplyV-VT0)*(SupplyV-VT0)' 0 1p 1p Laddtid 200p)

.Tran 0.01p 200p UIC
.Probe IVdd=Par('-I(VVdd)')

.End
