BELASTNINGSSIMULERING AV FRILAGD NMOS

.Model N NMOS Level=1 VT0=0.7 KP=200U
.Param SupplyV = 3.3V
.Options Post

* Spanningskallor
Vut ut 0 DC SupplyV
Vin in 0 DC SupplyV

* NMOS
MN2 ut in 0 0 N W=5U L=1U

* DC-Simulering (Sweep)
* .DC Vin 0 SupplyV 0.5 Vut 0 3.3 0.1
.DC Vut 0 SupplyV 0.1 Vin 0 SupplyV 0.1

.Probe IR2 = Par('-I(Vut)')

.End
