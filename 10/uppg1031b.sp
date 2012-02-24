I-V for PMOS i uppgift 10.2.2

**************************************************************************
* MOSFET-modeller

* Observera lambda = 0
.MODEL N NMOS Level=1 VT0=0.7 Kp=110u Gamma=0.4 Lambda=0 Phi=0.7
.MODEL P PMOS Level=1 VT0=-0.7 Kp=50u Gamma=0.57 Lambda=0 Phi=0.8

**************************************************************************
* PARAMETERDEKLARATIONER

* SupplyV = matningsspanning
.Param SupplyV = 3.3V 

.Options CAPTAB Post

**************************************************************************
* NAT

* PMOS 
* Drain Gate Souce Bbody
MP1 Vs Vin Vdd Vdd P W=1u L=1u
MN1 Vs Vin 0 0 N W=10u L=1u

* RL
RL Vr 0 2200

* Logisk Insignal och matningsspanning
VVin Vin 0 DC SupplyV
VVdd Vdd 0 DC SupplyV
VVs Vs 0 DC SupplyV
VVr Vr 0 DC SupplyV


**************************************************************************
* SIMULERING

* DC-Sweep for Vs 
.DC VVs 0 3.3 0.01

* Stromprob for inverteraren
.Probe Is = Par('-I(VVs)')

* DC-Sweep for Vr
.DC VVr 0 3.3 0.01

* Stromprob for inverteraren
.Probe Ir = Par('-I(VVr)')

.End
