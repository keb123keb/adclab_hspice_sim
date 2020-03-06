* IDC_mod simulation
* for modulator simulation only 
.option runlvl=0
* simulation option
.options method=gear lvltim=2 vntol=1e-6 reltol=1e-6 rmin=1e-15 
+ delmax=1n 
*+ post probe INTERP 
+ post probe


**** netlist
.inc 'SA_DAC_v2_z2_Cp.cir'
*.inc '../../et710/ece627_bhv_ckt.cir'
.inc './ece627_bhv_ckt.cir'

* define parameter
.param pwra=1.0 pwrd=1.0 rskew=1 
+fclk=0.9e6  tp='1/fclk'  OSR=256 fsig=13e3
*+fclk=1.1e6  tp='1/fclk'  fsig=13e3
+ td1=5n td2=5n tr=1n tf=1n 
+ td='td1+tr+tf+5n'

.param k=0.1 kin=0.05 kout=0.1
* power supply
vavdd  avdd  0 dc pwra
vagnd  agnd  0 dc 0
vdvdd dvdd 0 dc pwrd
vdgnd dgnd 0 dc 0
vdsub dsub 0 dc 0

vclk  clk 0 pulse ( 0 pwra 'td' tr tf 'tp/2-td1-td2-tr' tp ) 
vclkp  clkp 0 pulse ( 0 pwra 'td-5*tr' tr tf 'tp/2-td1-td2+10*tr' tp ) 
vsamp   psamp  0   pulse (0 pwra  td tr tf 'tp' 'tp*9')
*vsamp   psamp  0   pulse (0 pwra  td tr tf 'tp' 'tp*11')

Vd      d      0   PWL   ('1*tp' 1 '2*tp-tr' 1 '2*tp' 0 '3*tp' 0 '4*tp' 0 '5*tp' 0 '6*tp' 0 '7*tp' 0 '8*tp' 0 '9*tp' 0)
* signal source
evcm1 vcm1 0 vcm 0 1
.param lsb='pwra/2^8'
.param vp_db=-3  vp='pwra/2*(10^(vp_db/20))'  vdc='51*lsb'
*vinp vinp vcm1  'vdc'
*vinn vinn vcm1  '-1*vdc'
*vinp vinp vcm1 sin(0 vp fsig 0 0 0)
*vinn vinn vcm1 sin(0 vp fsig 0 0 180)

v_refp  vrefp 0  pwra
v_refn  vrefn 0   0
v_vcm   vcm   0  'pwra/2'

* temperature
.temp 60 

* analysis
*.tran step='9*tp' stop='900*tp'
.tran  step='tp/8' stop='24*tp'

.op

**** probing
.probe *vin=v(vinp,vinn)   
+v(psamp) v(clk) v(pdac) v(pdac_b) v(pdacb) v(pdacb_b)
+v(OUTP) v(OUTN) v(dacp) v(dacn) v(dac_p) v(dac_n) v(dac2_p) v(dac2_n) v(pdet1) v(pdet2) v(pdet1_b) v(pdet2_b) v(d) v(ps_gnd_n) v(ps_gnd_p)
+ d_out=par(' (v(d_7)*128+v(d_6)*64+v(d_5)*32+v(d_4)*16+v(d_3)*8+v(d_2)*4+v(d_1)*2+v(d_0)) / 256 ')
+ v(cmp_diff) v(cmp_inp) v(cmp_inn) v(vinn) v(vinp) v(ip) v(in) v(inp) v(inn)

+ v(d_0)  v(d_1) v(d_2) v(d_3) v(d_4) v(d_5) v(d_6) v(d_7)


.end
