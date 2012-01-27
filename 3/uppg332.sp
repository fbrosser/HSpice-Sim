FORSTARKNINGSSIMULERING

.Model N NMOS Level=1 VT0=0.7 KP=200U
.Param SupplyV = 3.3V
.Options Post

* Spanningskallor
VVdd Vdd 0 DC SupplyV
*Vin in 0 DC SupplyV
Vin in 0 Sin(1.3 0.1 1MEG)

* NMOS
MN2 ut in 0 0 N W=5U L=1U
R2 Vdd Ut 15k

* DC-Simulering (Sweep)
*.DC Vin 0 SupplyV 0.1
.Tran 10N 2U

.End
