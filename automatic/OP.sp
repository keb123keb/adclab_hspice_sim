***OP***

***subckt CMFB***
.subckt CMFB VOP VON Vbnss VERR VCM vdd vss
M0	d0		Vbnss	vss	vss	N_18 W=2u L=2u m=2
M1	d1		g1		d0	vss	N_18 W=3u L=0.3u m=4
M2	VERR	vcm		d0	vss	N_18 W=3u L=0.3u m=4
M3	d1		d1		vdd	vdd	P_18 W=3u L=0.3u m=1
M4	VERR	VERR	vdd	vdd	P_18 W=3u L=0.3u m=1
*
ROP	vop	g1	10Meg
RON	von	g1	10Meg
.ends


***subckt bias***
.subckt bias Vbnss Vbp2 Vbp1 Vbn1 Vbn2 vdd vss
Mbn1	dbn1	Vbnss	vss		vss	N_18 W=2u L=2u m=1
Mbn2	Vbp2	Vbnss	vss		vss	N_18 W=2u L=2u m=1
Mbn3	Vbp1	Vbnss	vss		vss	N_18 W=2u L=2u m=1
*
Mbp1	dbn1	dbn1	vdd		vdd	P_18 W=4u L=2u m=1
Mbp2	Vbn2	dbn1	vdd		vdd	P_18 W=4u L=2u m=1
Mbp3	Vbn1	dbn1	vdd		vdd	P_18 W=4u L=2u m=1
*
Mvbp0	Vbp2	Vbp2	vdd		vdd	P_18 W=2u L=1.2u m=1 *W=2u L=0.9u m=1
Mvbp1	dvbp1	Vbp1	vdd		vdd	P_18 W=3u L=0.3u m=1
Mvbp2	Vbp1	Vbp2	dvbp1	vdd	P_18 W=3u L=0.3u m=1
*
Mvbn0	Vbn2	Vbn2	vss		vss	N_18 W=1.7u L=1u m=1 *W=1u L=1u m=1
Mvbn1	dvbn1	Vbn1	vss		vss	N_18 W=11u L=2u m=1 *W=11u
Mvbn2	Vbn1	Vbn2	dvbn1	vss	N_18 W=10u L=2u m=1 
*
M1 vx Vbnss vss vss N_18 W=2u L=2u m=1
M2 Vbnss Vbnss vss vss N_18 W=2u L=2u m=1
M3 Vbnss vx vs  vs  P_18 W=14u L=2u m=1
M4 vx vx vdd vdd P_18 W=10u L=2u m=1
Rs vdd vs 4.9k
.ends


.param I1=120 I2=35 I0=I1+I2 Iss=I1*2
***subckt folded-cascode***
.subckt FC VOP VON VIP VIN Vbn1 Vbn2 Vbp2 VERR vdd vss
MSS1	dss1	Vbn1	vss		vss	N_18 W=11u L=2u m=Iss
MSS2	dss2	Vbn2	dss1	vss	N_18 W=10u L=2u m=Iss
*
M1		d1		VIP		dss2	vss	N_18 W=3u L=0.3u m=94 *m=94
M2		d2		VIN		dss2	vss	N_18 W=3u L=0.3u m=94 *m=94
*
M3		VON		Vbp2	d1		vdd	P_18 W=3u L=0.3u m=I2+300
M4		VOP		Vbp2	d2		vdd	P_18 W=3u L=0.3u m=I2+300
*
M5		d1		VERR	vdd		vdd	P_18 W=3u L=0.3u m=I0
M6		d2		VERR	vdd		vdd	P_18 W=3u L=0.3u m=I0
*
M7		VON		Vbn2	s7		vss	N_18 W=10u L=2u m=I2+220
M8		VOP		Vbn2	s8		vss	N_18 W=10u L=2u m=I2+220
M9		s7		Vbn1	vss		vss	N_18 W=11u L=2u m=I2
M10		s8		Vbn1	vss		vss	N_18 W=11u L=2u m=I2
.ends


***subckt OP***
.subckt OP VDD VSS VIP VIN VOP VON VCM CLK
x1 Vbnss Vbp2 Vbp1 Vbn1 Vbn2 vdd vss bias
x2 VOP VON Vbnss VERR VCM vdd vss CMFB
x3 VOP VON VIP VIN Vbn1 Vbn2 Vbp2 VERR vdd vss FC
.ends