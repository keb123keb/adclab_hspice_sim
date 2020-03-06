* IDC_mod simulation
* for modulator simulation only 
.option runlvl=0
* simulation option
.options method=gear lvltim=2 vntol=1e-6 reltol=1e-6 rmin=1e-15 
+ delmax=1n 
+ post=2 probe INTERP 
*+ post probe


**** netlist
.inc '8bit_v2_split_cap_cbu.cir'
.inc '../../et710/ece627_bhv_ckt.cir'

* define parameter
.param pwra=1.0 pwrd=1.0 rskew=1 
+ fclk=9e6  tp='1/fclk'
+ td1=0.5n td2=0.5n tr=0.1n tf=0.1n 
+ td='td1+tr+tf+5n'
+ k='1' kp1='(1+1+2+3+4)*0.5' kp2='(1+1+2+3)*0.5'
+ B='8' 
+ fsig = '494e3+3.1415926535'
+ fs   = 'fclk/(B+1)'
+ ts   = '1/fs'
+ np=100 t_sim='np*ts*(2**B)'

* power supply
vavdd  avdd  0 dc pwra

vagnd  agnd  0 dc 0
vdvdd dvdd 0 dc pwrd
vdgnd dgnd 0 dc 0
vdsub dsub 0 dc 0

*vclk  clk 0 pulse ( 0 pwra td tr tf 'tp/2-td1-td2-tr' tp ) 
vclk  clk 0 pulse ( 0 pwra 'td-tr' tr tf 'tp/2-td1-td2-tr' tp ) 
*vsamp   psamp 0   pulse (0 pwra  'td-tr' tr tf 'tp/2-td1-td2-tr' 'tp*9')
vsamp   psamp 0   pulse (0 pwra  td tr tf 'tp/2-td1-td2-tr' 'tp*9')
** psamp also acts as reset.  psamp is 1nsec earlier than clk for asynchrous reset

* signal source
evcm1 vcm1 0 vcm 0 1
*.param lsb='pwra/2^8'
.param vp='pwra/2' 
*vinp vinp vcm1  'vdc'
*vinn vinn vcm1  '-1*vdc'
vinp vinp vcm1 sin(0 vp fsig 0 0 0)
vinn vinn vcm1 sin(0 vp fsig 0 0 180)

v_refp  vrefp 0  pwra
v_refn  vrefn 0   0
v_vcm   vcm   0  'pwra/2'

* temperature
.temp 60 

* analysis
.tran step='ts' stop='10*ts'
*.tran  step='tp/8' stop='20*tp'

.op

**** probing
.probe v(d_0) 


.end
