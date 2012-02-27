Smasignalsegenskaper hos riktigt forstarkarsteg

.Param SupplyV = 3.3V
+ Vinf = 1MEG

.Options Post

* Natdeklaration
R1 in gate 10k
CF gate drain 2f

C1 gate 0 14.0389f
C drain 0 12.5977f
R drain 0 68192.66702

* Spanningsberoende stromkalla
G0 drain 0 Cur = '(622.6991e-6)*V(gate)'

* Insignal med amplitud 10mV
Vin in 0 AC sin(0.81 0.01 Vinf)

* Variera frekvensen for Vin 1MHz -> 1THz med 10 punkter per dekad
.AC DEC 10 1Meg 10T

* Transientsimulering
.Tran '0.0001*1/Vinf' '2*1/Vinf'

.End
