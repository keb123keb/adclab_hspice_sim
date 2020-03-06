* IADC behavior simulation
* 
****************************** simulation options
.option runlvl=3
* set delmax=tstep/50
.options method=gear lvltim=2 vntol=1e-6 reltol=1e-6 rmin=1e-15 
+ delmax=0.5n
+ post probe INTERP 
+ post probe
*+ post

*********************************** netlist & macro models
** circuit netlist
.inc 'top_iadc_bhv.cdl'
** macro models
.inc '../ece627_bhv_ckt.cir'
** TSMC 0.18u process model files
*inc

*********************************** define parameter
.param pwra=1.8 pwrd=1.8
+ fb=50e3  osr=128
+ fclk='2*fb*osr'  tp='1/fclk'  fsig=23e3
+ td1='0.013*tp' td2='0.013*tp' tr=0.1n tf=0.1n 
+ td='0.5*tp'
*+ td='173n/3+tp/2'

*********************************** power supply
vavdd  avdd  0 dc pwra
vagnd  agnd  0 dc 0
vdvdd  dvdd  0 dc pwra
vdgnd  dgnd  0 dc 0

** control & power down signal
*vpdn pdn 0 dc pwra

************************************ 2-phase non-overlapping clock sources
vp1a   p1a   0 pulse ( 0 pwra td tr tf 'tp/2-td1-td2-tr' tp ) 
vp1na  p1na  0 pulse ( pwra 0 td tr tf 'tp/2-td1-td2-tr' tp ) 
vp1da  p1da  0 pulse ( 0 pwra 'td' tr tf 'tp/2-td2-tr' tp ) 
vp1dna p1dna 0 pulse ( pwra 0 'td' tr tf 'tp/2-td2-tr' tp ) 
vp2a   p2a   0 pulse ( 0 pwra 'tp/2+td' tr tf 'tp/2-td1-td2-tr' tp ) 
vp2na  p2na  0 pulse ( pwra 0 'tp/2+td' tr tf 'tp/2-td1-td2-tr' tp ) 
vp2da  p2da  0 pulse ( 0 pwra 'tp/2+td' tr tf 'tp/2-td2-tr' tp ) 
vp2dna p2dna 0 pulse ( pwra 0 'tp/2+td' tr tf 'tp/2-td2-tr' tp ) 

** clock for p1, p1_b, p1d, p1d_b,  p2, p2_b, p2d, p2d_b
**  all r and c are to help hspice converge.
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

******************************* input signal source
** input sine 
evcm1 vcm1 0 vcm 0 1
.param vp_db=-6  vp='pwra/2*0.5'
*vp='pwra/2*(10^(vp_db/20))'
vinp adcinp vcm1 sin ( 0 vp fsig 0 0 0 )
vinn adcinn vcm1 sin ( 0 vp fsig 0 0 180 )

** voltage reference vrefp, vcm, vrefn
*rvcm1 vrefp vcm 2000k
*rvcm2 vcm vrefn 2000k
*cvcm  vcm 0 10.1u
*rvcmg1 vcm vcmg1 200
*rvcmg2 vcm vcmg2 200

*rvr    avdd vrefp 10
v_refp  vrefp 0  pwra
v_refn  vrefn 0   0
v_vcm   vcm   0  'pwra/2'
*cvr    vrefp vrefn 10.1u

* temperature
.temp 60 

*********************************** analysis
.tran step=tp stop='38410*tp'
*.tran step=tp stop='16400*tp'

******************************** operating point & initial conditions
.op
.IC 
+ v(xint1.opip)='pwra/2'  v(xint1.opin)='pwra/2'  
+ v(xint2.opip)='pwra/2'  v(xint2.opin)='pwra/2' 
+ v(int1p)='pwra/2' v(int1n)='pwra/2' 
+ v(int2p)='pwra/2' v(int2n)='pwra/2' 
+ v(d<3>)=0 v(d<2>)=0 v(d<1>)='pwra' v(d<0>)='pwra'

************************************* probing
.probe
+ v(adcinp) v(adcinn)  adcin=v(adcinp,adcinn) 
+ int1_opip=v(xint1.opip) int1_opin=v(xint1.opin) 
+ int2_opip=v(xint2.opip) int2_opin=v(xint2.opin)
+ int1p=v(int1p) int1n=v(int1n)  int1=v(int1p,int1n)
+ int2p=v(int2p) int2n=v(int2n)  int2=v(int2p,int2n)
+ d3=v(d<3>) d2=v(d<2>) d1=v(d<1>) d0=v(d<0>)
+ adc_5lev=par(' ( v(d<3>)+v(d<2>)+v(d<1>)+v(d<0>)) / (4*v(vcm)) -1 ')
+ v(p1) v(p2)
*+ v(p1d) v(p2d)
**.print tran y1=par('sgn(v(y1)-1)') y2=par('sgn(v(y2)-1)')
**.probe tran  y1=par('sgn(v(y1)-1)')  y2=par('sgn(v(y2)-1)')

.end