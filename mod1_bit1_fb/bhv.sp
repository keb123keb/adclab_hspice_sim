*behavior simulation
*
***************************simulation options
.option runlvl=3
.option method=gear lvltim=2 vntol=1e-6 reltol=1e-6 rmin=1e-15 delmax=0.5n 
+post probe INTERP
*+post


**************************** circuit and macro model
*circuit netlist
*.inc '1int_1bit_fb2.cir'
.inc 'mod1_bit1_fb_G1o3.cir'
*macro models
.inc '../et710/ece627_bhv_ckt.cir'


*************************** define parameter
.param pwra=1.8 pwrd=1.8 fb=50e3 osr=128 fclk='2*fb*osr' tp='1/fclk' fsig=20e3
+ td1='0.013*tp' td2='0.013*tp' tr=0.1n tf=0.1n td='tp/2'

**************************** clock for p1, p1_b, p1d, p1d-b, p2, p2_b, p2d, p2d_b
** r c is used for helping hspice to converge
rp1 p1a p1 20
cp1 p1 0 1f
rp1n p1na p1_b 20
cp1n p1_b 0 1f
rp1d p1da p1d 20
cp1d p1d 0 1f
rp1dn p1dna p1d_b 20
cp1dn p1d_b 0 1f
rp2 p2a p2 20
cp2 p2 0 1f
rp2n p2na p2_b 20
cp2n p2_b 0 1f
rp2d p2da p2d 20
cp2d p2d 0 1f
rp2dn p2dna p2d_b 20
cp2dn p2d_b 0 1f

*************************** power supply
vavdd avdd 0 dc pwra
vagnd agnd 0 dc 0
vdvdd dvdd 0 dc pwra
vdgnd dgnd 0 dc 0


*************************** 2-phase non-overlapping clock sources
*vp1a   p1a   0 pulse ( 0 pwra td tr tf 'tp/2-td1-td2-tr' tp ) 
*vp1na  p1na  0 pulse ( pwra 0 td tr tf 'tp/2-td1-td2-tr' tp ) 
*vp1da  p1da  0 pulse ( 0 pwra 'td' tr tf 'tp/2-td2-tr' tp ) 
*vp1dna p1dna 0 pulse ( pwra 0 'td' tr tf 'tp/2-td2-tr' tp ) 
*vp2a   p2a   0 pulse ( 0 pwra 'tp/2+td' tr tf 'tp/2-td1-td2-tr' tp ) 
*vp2na  p2na  0 pulse ( pwra 0 'tp/2+td' tr tf 'tp/2-td1-td2-tr' tp ) 
*vp2da  p2da  0 pulse ( 0 pwra 'tp/2+td' tr tf 'tp/2-td2-tr' tp ) 
*vp2dna p2dna 0 pulse ( pwra 0 'tp/2+td' tr tf 'tp/2-td2-tr' tp ) 
**
vp1a    p1a    0 pulse(0 pwra td tr tf 'tp/2-td1-tr' tp)
vp1na   p1na   0 pulse(pwra 0 td tr tf 'tp/2-td1-tr' tp)
vp1da   p1da   0 pulse(0 pwra 'td+td2' tr tf 'tp/2-td1-td2-tr' tp)
vp1dna  p1dna  0 pulse(pwra 0 'td+td2' tr tf 'tp/2-td1-td2-tr' tp)
vp2a    p2a   0 pulse(0 pwra 'tp/2+td' tr tf 'tp/2-td1-tf' tp)
vp2na   p2na  0 pulse(pwra 0 'tp/2+td' tr tf 'tp/2-td1-tf' tp)
vp2da   p2da  0 pulse(0 pwra 'tp/2+td+td2' tr tf 'tp/2-td1-td2-tf', tp)
vp2dna  p2dna 0 pulse(pwra 0 'tp/2+td+td2' tr tf 'tp/2-td1-td2-tf', tp)
**
*vp1a    p1    0 pulse(0 pwra td tr tf 'tp/2-td1-tr' tp)
*vp1na   p1_b   0 pulse(pwra 0 td tr tf 'tp/2-td1-tr' tp)
*vp1da   p1d   0 pulse(0 pwra 'td+td2' tr tf 'tp/2-td1-td2-tr' tp)
*vp1dna  p1d_b  0 pulse(pwra 0 'td+td2' tr tf 'tp/2-td1-td2-tr' tp)
*vp2a    p2   0 pulse(0 pwra 'tp/2+td' tr tf 'tp/2-td1-tf' tp)
*vp2na   p2_b  0 pulse(pwra 0 'tp/2+td' tr tf 'tp/2-td1-tf' tp)
*vp2da   p2d  0 pulse(0 pwra 'tp/2+td+td2' tr tf 'tp/2-td1-td2-tf', tp)
*vp2dna  p2d_b 0 pulse(pwra 0 'tp/2+td+td2' tr tf 'tp/2-td1-td2-tf', tp)
**
*vp1a   p1   0 pulse ( 0 pwra td tr tf 'tp/2-td1-td2-tr' tp ) 
*vp1na  p1_b  0 pulse ( pwra 0 td tr tf 'tp/2-td1-td2-tr' tp ) 
*vp1da  p1d  0 pulse ( 0 pwra 'td' tr tf 'tp/2-td2-tr' tp ) 
*vp1dna p1d_b 0 pulse ( pwra 0 'td' tr tf 'tp/2-td2-tr' tp ) 
*vp2a   p2   0 pulse ( 0 pwra 'tp/2+td' tr tf 'tp/2-td1-td2-tr' tp ) 
*vp2na  p2_b  0 pulse ( pwra 0 'tp/2+td' tr tf 'tp/2-td1-td2-tr' tp ) 
*vp2da  p2d  0 pulse ( 0 pwra 'tp/2+td' tr tf 'tp/2-td2-tr' tp ) 
*vp2dna p2d_b 0 pulse ( pwra 0 'tp/2+td' tr tf 'tp/2-td2-tr' tp ) 












****************************** reset is only @phase1, Pulse width = half clock period
**reset on
*vrst   rst   0 pulse(0 pwra 'td' tr tf 'tp/2-td1-td2-tr' 'tp*OSR')
*vrst_b rst_b 0 pulse(pwra 0 'td' tr tf 'tp/2-td1-td2-tr' 'tp*OSR')
**no reset
vrst rst 0 0
vrst_b rst_b 0 pwra
** rst_m is for matlab postprocessing, rst pulse width is full clock
*vrst_m    rst_matlab  0   pulse ( 0 pwra td tr tf 'tp-tf-tf' 'tp*OSR')


***************************** input source
**sine input
evcm1 vcm1 0 vcm 0 1
.param vp_db=-6 vp='pwra/2*(10^(vp_db/20))'
*.param vp_db=-6 vp='pwra/2*0.5/16'
vinp inp vcm1 sin(0 vp fsig 0 0 180)
vinn inn vcm1 sin(0 vp fsig 0 0 0)


***************************** voltage reference
v_refp vrefp 0  pwra
v_refn vrefn 0  0
v_vcm  vcm   0  'pwra/2'

***************************** ckt
*xint2_bhv agnd avdd p1 p1_b p1d p1d_b p2 p2_b p2d p2d_b inn inp iref_1 iref_2 out_int1_n out_int1_p dout dacp dacn cinp cinn opip opin pdn rst rst_b 
*+ vcm vcm vcm acp_cmp  amp_p amp_n d_b cmp_res  INT1_1BIT_FB

***************************** temperature
.temp 27

***************************** analysis
.tran step='tp' stop='1280*tp'

**************************** probing
.probe
+ v(inp) v(inn)
*+ int2in=v(inp,inn) int2out=v(outp,outn)
+ v(p1) v(p2)
+ v(p1d) v(p2d)
+ v(p1_b) v(p2_b)
+ v(p1d_b) v(p2d_b)
+ v(dout)
+ v(out_int1_n) v(out_int1_p)
+ v(dacp) v(dacn)
+ v(cinp) v(cinn)
+ v(opip) v(opin)
+ v(vcm)
+ v(acp_cmp) v(opip_cmp) v(amp_p) v(amp_n) v(d_b) 
+ v(cmp_res) v(dff_m)
+ v(vthp) v(vthn)
*+ v(vp1a) v(vp2a)
*+ v(vp1na) v(vp2na)
*+ v(vp1da) v(vp2da)
*+ v(vp1dna) v(vp2dna)

.end