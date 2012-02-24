I-V for PMOS i uppgift 10.2.2

**************************************************************************
* MOSFET-modeller

* Observera lambda = 0
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
MP1 Vs 0 Vdd Vdd P W=38.46u L=1u

* RL
RL Vr 0 2200

* Rs
RS1 VS1 0 200
RL2 VL2 0 200
RS3 VS3 0 200
RL4 VL4 0 200
RS5 VS5 0 200

* Logisk Insignal och matningsspanning
VVdd Vdd 0 DC SupplyV
VVs Vs 0 DC SupplyV
VVr Vr 0 DC SupplyV

VVS1 VS1 0 DC SupplyV
VVL2 VL2 0 DC SupplyV
VVS3 VS3 0 DC SupplyV
VVL4 VL4 0 DC SupplyV
VVS5 VS5 0 DC SupplyV

**************************************************************************
* SIMULERING

* DC-Sweep for Vs 
.DC VVs 0 3.3 0.01

* DC-Sweep for Vr
.DC VVr 0 3.3 0.01

* DC-Sweep for VS1
.DC VVS1 0 1.24 0.01
* DC-Sweep for VL2
.DC VVL2 1.24 2.28 0.01
* DC-Sweep for VS3
.DC VVS3 2.28 2.65 0.01
* DC-Sweep for VL4
.DC VVL4 2.65 2.945 0.01
* DC-Sweep for VS5
.DC VVS5 2.940 2.9818 0.01

* Stromprob genom RL
.Probe Ir = Par('-I(VVr)')

* Bergeron-linjer
.Probe IS1 = Par('-I(VVS1)')
.Probe IL2 = Par('I(VVL2)+0.01242')
.Probe IS3 = Par('-I(VVS3)-0.01042')
.Probe IL4 = Par('I(VVL4)+0.01605')
.Probe IS5 = Par('-I(VVS5)-0.013365')

.End
