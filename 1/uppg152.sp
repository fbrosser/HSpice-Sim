J-OMEGA-Metoden - UPPGIFT 1.5.2

.OPTIONS POST

.PARAM frekvensskalning = 10
.MODEL DIOD D LEVEL=1 IS=1F

R1 IN UT 3.3k
C1 UT 0 1n
VIN IN 0 SIN(0 1 100k)

.TRAN '0.1u/frekvensskalning' '1m/frekvensskalning'

.END
