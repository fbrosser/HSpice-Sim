Simulering med enkel kapacitiv ledningsmodell

* MOSFET-modeller
.MODEL N NMOS Level=1 VT0=0.7 Kp=110u Gamma=0.4 Lambda=0.04 Phi=0.7
.MODEL P PMOS Level=1 VT0=-0.7 Kp=50u Gamma=0.57 Lambda=0.05 Phi=0.8

* Matningspanning
* Td = tid fran t=0 tills logikpuls startar
* Trf = stigtid = falltid
* Tp = periodtid for puls
.Param SupplyV=3.3V Td=50p Trf=1p Tp=1300p

.Options CAPTAB Post

* Transistorer, natdeklaration
* AS, AD ger diffusionsdioder
MP1 ut1 in Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MN1 ut1 in 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

MP2 ut2 ut1 Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MN2 ut2 ut1 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

MP3 ut3 ut2 Vdd Vdd P W=44u L=1u AD='44u*2u' AS='44u*2u'
MN3 ut3 ut2 0 0 N W=20u L=1u AD='20u*2u' AS='20u*2u'

* Ledningskapacitans
* 2mm ledning. Anvander typiskt varde 0.1875fF/um
Cw ut1 0 375f

VVdd Vdd 0 DC SupplyV
Vin in 0 Pulse(0 SupplyV Td Trf Trf 'TP/2-Trf' Tp)

* Transientsimulering under hel periodtid
.Tran 0.01p Tp

.End
