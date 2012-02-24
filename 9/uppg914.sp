Simulering med distribuerad RC-ledningsmodell

* MOSFET-modeller
.MODEL N NMOS Level=1 VT0=0.7 Kp=110u Gamma=0.4 Lambda=0.04 Phi=0.7
.MODEL P PMOS Level=1 VT0=-0.7 Kp=50u Gamma=0.57 Lambda=0.05 Phi=0.8

* SupplyV = matningsspanning
* Td = tid fran t=0 tills logikpuls startar
* Trf = stigtid = falltid
* Tp = periodtid for puls
* NL = Antal RC-lankar
.Param SupplyV = 3.3V 
+ Td = 50p 
+ Trf = 1p 
+ Tp = 1300p
+ Ledningslangd = 2m
+ NL = 10

* Ledningssegment (RC)
.Subckt RCLank subin subut
RLEDN subin subut '(Ledningslangd/NL)*0.375*1000000'
CLEDN subut 0 '(Ledningslangd/NL)*0.1875f*1000000'
.Ends RCLank

* Punktformig (RC)
.Subckt RCLumped subin subut
* Distribuerad RC-modell för ledning
XRCLank1 subin w2 RCLank
XRCLank2 w2 w3 RCLank
XRCLank3 w3 w4 RCLank
XRCLank4 w4 w5 RCLank
XRCLank5 w5 w6 RCLank
XRCLank6 w6 w7 RCLank
XRCLank7 w7 w8 RCLank
XRCLank8 w8 w9 RCLank
XRCLank9 w9 w10 RCLank
XRCLank10 w10 subut RCLank
.Ends RCLumped

.Options CAPTAB Post

* Transistorer, natdeklaration
* AS, AD ger diffusionsdioder
MP1 ut1 in Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MN1 ut1 in 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

MP2 ut2 utw Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MN2 ut2 utw 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

MP3 ut3 ut2 Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MN3 ut3 ut2 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

* Punktformig modell bestaende av NL st sub-RC-lankar
XRCLumped1 ut1 utw RCLumped

* Logisk Insignal och matningsspanning
VVdd Vdd 0 DC SupplyV
Vin in 0 Pulse(0 SupplyV Td Trf Trf 'TP/2-Trf' Tp)

* Transientsimulering under hel periodtid
.Tran 0.01p Tp

.End
