Simulering med 3 repeatrar

* MOSFET-modeller
.MODEL N NMOS Level=1 VT0=0.7 Kp=110u Gamma=0.4 Lambda=0.04 Phi=0.7
.MODEL P PMOS Level=1 VT0=-0.7 Kp=50u Gamma=0.57 Lambda=0.05 Phi=0.8

* SupplyV = matningsspanning
* Td = tid fran t=0 tills logikpuls startar
* Trf = stigtid = falltid
* Tp = periodtid for puls
* NW = Antal uppdelningar av ledningen (delledningar)
* NL = Antal RC-lankar per delledning
.Param SupplyV = 3.3V 
+ Td = 50p 
+ Trf = 1p 
+ Tp = 1300p
+ Ledningslangd = 2m
+ NW = 4
+ NL = 10
+ Delledningslangd = Ledningslangd/NW

* Ledningssegment (RC)
.Subckt RCLank subin subut
RLEDN subin subut '(Delledningslangd/NL)*0.375*1000000'
CLEDN subut 0 '(Delledningslangd/NL)*0.1875f*1000000'
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

* Repeater 1
MPr1 utr1 utw1 Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MNr1 utr1 utw1 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

MP2 ut2 utw2 Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MN2 ut2 utw2 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

* Repeater 2
MPr2 utr2 utw3 Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MNr2 utr2 utw3 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

MP3 ut3 utw4 Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MN3 ut3 utw4 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

* Ledningsmodeller
XRCLumped1 ut1 utw1 RCLumped
XRCLumped2 utr1 utw2 RCLumped
XRCLumped3 ut2 utw3 RCLumped
XRCLumped4 utr2 utw4 RCLumped

* Logisk Insignal och matningsspanning
VVdd Vdd 0 DC SupplyV
Vin in 0 Pulse(0 SupplyV Td Trf Trf 'TP/2-Trf' Tp)

* Transientsimulering under hel periodtid
.Tran 0.01p Tp

.End
