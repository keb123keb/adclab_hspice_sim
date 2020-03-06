** Generated for: hspiceD
** Generated on: Mar  3 15:11:51 2020
** Design library name: OPAMP_YCH
** Design cell name: OP_1stage
** Design view name: schematic
.LIB "cic018.l" TT
.PARAM avdd=1.8 wn1=10 wp1=10 vcm=AVDD/2


.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2

** Library name: OPAMP_YCH
** Cell name: OP_1stage
** View name: schematic
mn1 out b1 agnd agnd n_18 L=180e-9 W='(500.0+wn1)*1e-9' AD='480e-9*((500.0+wn1)*1e-9)' AS='480e-9*((500.0+wn1)*1e-9)' PD='960e-9+2*((500.0+wn1)*1e-9)' PS='960e-9+2*((500.0+wn1)*1e-9)' NRD='270e-9/((500.0+wn1)*1e-9)' NRS='270e-9/((500.0+wn1)*1e-9)' M=1
mp1 out b2 avdd avdd p_18 L=180e-9 W='(500.0+wp1)*1e-9' AD='480e-9*((500.0+wp1)*1e-9)' AS='480e-9*((500.0+wp1)*1e-9)' PD='960e-9+2*((500.0+wp1)*1e-9)' PS='960e-9+2*((500.0+wp1)*1e-9)' NRD='270e-9/((500.0+wp1)*1e-9)' NRS='270e-9/((500.0+wp1)*1e-9)' M=1
vsin2 b2 agnd AC 1 180 SIN vcm 'avdd/4'
vsin1 b1 agnd AC 1 0 SIN vcm 'avdd/4'
vgnd agnd 0 0v

.AC DEC 50 10K 100Meg 
.meas ac ugain_freq when Vdb(out)=0
.measure ac min_phase MIN vp(out) from=1 to=ugain_freq
.measure ac phase_margin = param ('180+min_phase')
.noise
.tf
.pz
.END
