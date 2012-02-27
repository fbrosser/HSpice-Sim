Forstarkarens hogfrekvensegenskaper

.Param SupplyV = 3.3V
+ Vinf = 1MEG

.Options Post

* Natdeklaration
R1 in gate 10k
C1 gate 0 10f
R2 drain 0 100k
C2 drain 0 30f

* Spanningsberoende stromkalla
G0 drain 0 Cur = '0.001*V(gate)'

* Insignal med amplitud 10mV
Vin in 0 AC sin(0.0 0.01 Vinf)

* Variera frekvensen for Vin 1MHz -> 1THz med 10 punkter per dekad
.AC DEC 10 1Meg 1T

* Transientsimulering
.Tran '0.0001*1/Vinf' '2*1/Vinf'

.End
