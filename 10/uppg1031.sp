Bergeronmetoden for fallande signal

**************************************************************************
* MOSFET-modeller

* Observera lambda = 0
.MODEL N NMOS Level=1 VT0=0.7 Kp=110u Gamma=0.4 Lambda=0 Phi=0.7
.MODEL P PMOS Level=1 VT0=-0.7 Kp=50u Gamma=0.57 Lambda=0 Phi=0.8

**************************************************************************
* PARAMETERDEKLARATIONER

* SupplyV = matningsspanning
* Td = tid fran t=0 tills logikpuls startar
* Trf = stigtid = falltid
* Tp = periodtid for puls
* NL = Antal LC-lankar
* LLed = Ledningsinduktans, given
* CLed = Ledningskapacitans, given
* TdLed = Transmissionsfordrojning i ledning
.Param SupplyV = 3.3V 
+ Td = 0p 
+ Trf = 0p
+ Tp = 5*TdLedp
+ NL = 100
+ LLed = 40n
+ CLed = 1p
+ TdLed = 'sqrt(LLed*CLed)'

.Options CAPTAB Post

**************************************************************************
* SUB-KRETSARMP1 ledIn in Vdd Vdd P W=56u L=1u

* Ledningssegment (LC)
.Subckt LCLank subin subut
LLEDN subin subut 'LLed/NL'
CLEDN subut 0 'CLed/NL'
.Ends RCLank

* 10 LC-ledningssegment i serie
.Subckt LC_10Seg subin subut
XLCLank1 subin lw2 LCLank
XLCLank2 lw2 lw3 LCLank
XLCLank3 lw3 lw4 LCLank
XLCLank4 lw4 lw5 LCLank
XLCLank5 lw5 lw6 LCLank
XLCLank6 lw6 lw7 LCLank
XLCLank7 lw7 lw8 LCLank
XLCLank8 lw8 lw9 LCLank
XLCLank9 lw9 lw10 LCLank
XLCLank10 lw10 subut LCLank
.Ends LC_10Seg

* 10*10 LC-ledningssegment i serie
.Subckt LC_10_10Seg subin subut
XLC_10Seg1 subin sw2 LC_10Seg
XLC_10Seg2 sw2 sw3 LC_10Seg
XLC_10Seg3 sw3 sw4 LC_10Seg
XLC_10Seg4 sw4 sw5 LC_10Seg
XLC_10Seg5 sw5 sw6 LC_10Seg
XLC_10Seg6 sw6 sw7 LC_10Seg
XLC_10Seg7 sw7 sw8 LC_10Seg
XLC_10Seg8 sw8 sw9 LC_10Seg
XLC_10Seg9 sw9 sw10 LC_10Seg
XLC_10Seg10 sw10 subut LC_10Seg
.Ends LC_10_10Seg

**************************************************************************
* NAT

* PMOS 
* Drain Gate Souce Bbody
MP1 ledIn in Vdd Vdd P W=1u L=1u
MN1 ledIn in 0 0 N W=10u L=1u

* Ledningsmodell
XLC_10_10Seg1 ledIn ledUt LC_10_10Seg

* RL
RL ledUt 0 9999999999999999

* Logisk Insignal och matningsspanning
VVdd Vdd 0 DC SupplyV
Vin in 0 Pulse(0 SupplyV Td Trf Trf 'TP/2-Trf' Tp)

**************************************************************************
* SIMULERING

* Transientsimulering under 1ns
.Tran 0.01p 1n

.End
