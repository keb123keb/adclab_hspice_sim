%% post-processing for all corners clear;% addpath ('~/Matlab_Files/Matlab_Toolbox/schreier/delsig');% addpath ('~/Matlab_Files/Matlab_Toolbox/[Malcovati] SDtoolbox/SDtoolbox');% addpath ('~/Matlab_Files/Matlab_Toolbox/[Michael Perrott] Design Tools/HSPICE_Toolbox/HspiceToolbox');addpath ('D:\Matlab_Files\Matlab_Toolbox\schreier\delsig');addpath ('D:\Matlab_Files\Matlab_Toolbox\[Malcovati] SDtoolbox\SDtoolbox');%% Load data from HSPICE simulation .tr0 files% x=loadsig('idc2_swin.tr0'); adc_5lev=evalsig(x,'adc_5lev'); mod_out=adc_5lev*1.8;% t_spice=evalsig(x,'TIME'); vcm=evalsig(x,'v_vcm'); vcm=vcm(1); % adcin=evalsig(x,'adcin'); adcinp=evalsig(x,'v_adcinp'); adcinn=evalsig(x,'v_adcinn'); % int1=evalsig(x,'int1'); int1p=evalsig(x,'int1p'); int1n=evalsig(x,'int1n');% int2=evalsig(x,'int2');  int2p=evalsig(x,'int2p'); int2n=evalsig(x,'int2n');% rst=evalsig(x,'rst_matlab');  %rst=evalsig(x,'rst'); %% parameters definitionvcm=0.9; vfs=vcm*2; vref=vfs/2; vfs_diff=1.8*2;  vref_diff=vfs_diff/2;fB=50e3; fnyq=fB*2;  OSR=128; fclk=fnyq*OSR; tclk=1/fclk;fsig=23e3; t_sig=1/fsig;  Ntransient=0;%tclk=t_spice(2)-t_spice(1);  fclk=1/tclk;%t_index=round(t_spice/tclk); t=t_index*tclk; t_sim=tclk*(length(t_index)-1);n_cycle=23; n_nyq=round(n_cycle*t_sig*fnyq); M=OSR;%% load datadata=load ('data_all_corner');  %data=data_all_corner; rst=data(:,2);  %mod_out=data(:,3); % tr0=data(:,3), tr1=data(:,4)t_index=[1:length(rst)]'; t=t_index/fclk; t_sim=1/fclk*(length(t_index)-1);%% Open Simulinkfor i=1:length(data(1,:))-2    mod_out(:,i)=data(:,2+i); tr(i,1)=i-1;end    options=simset('RelTol', 1e-3, 'MaxStep', tclk);open('idc2ff_digital.mdl');  sim ('idc2ff_digital', t_sim, options);%% FFT @ Nyquist Ratefbin_sig=fsig/fnyq; w=hann_pv(n_nyq); fbin_L=1; fbin_H=n_nyq*fB/fnyq;for m=1:length(idc(1,:))y2=idc(end-n_nyq+1:end,m);[snr_idc2(m),ptot_idc2(:,m)] = calcSNR(y2',fbin_sig,fbin_L,fbin_H,w,n_nyq);ptot_idc2(m)=ptot_idc2(m)+4.75;figure (2); %index=1; %clf;plot(linspace(0,fnyq/2,n_nyq/2), ptot_idc2 (1:n_nyq/2,m),'r'); hold on;%text_handle = text(floor(1e1),-60, sprintf('SNR = %4.1fdB',snr_idc2(m)));xlabel('Frequency [Hz]'); ylabel('Magnitude [dB]'); title('all-corner simulations for input switch sizing'); axis([0 fnyq/2 -140 0]); legend('IADC2');%title ([ 'IDC2 ;  V_P= ',num2str(adcin_dB),'dB;  ','Freq=',num2str(fsig/1e0),'Hz;  ' ,'CLK=',num2str(fclk/1e0,'%4.0f'),'Hz; ' ]);str=num2str(tr);s40=sprintf('hspice .tr%d ; SNR=%2.2f',tr(m),snr_idc2(m));   disp(s40); %s41=sprintf('IADC2; SNR=%2.2f',snr_idc2(m) );   disp(s41);end%% Histograms of the integrator outputs% int1p=data(:,4);  int2p=data(:,5);% nbins=length(int1p);% [bin1,xx1]=histo((int1p-vref)/1, length(int1p) );  [bin2,xx2]=histo((int2p-vref)/1, length(int2p) );% %[bin3,xx3]=histo((int3p-vref)/vref, length(int3p) );  [bin4,xx4]=histo((adderp-vref)/vref, length(adderp) );% figure(8); clf;% subplot(2,1,1), plot(xx1, bin1); xlim([-1 1]); ylim([0 50/2]);% grid on; title('1st Integrator output; normalized to vref'); xlabel('Vint1/VREF'); ylabel('Occurrences'); % subplot(2,1,2), plot(xx2, bin2); xlim([-1 1]); ylim([0 50/2]);% grid on; title('2nd Integrator output; normalized to vref'); xlabel('Vint2/VREF'); ylabel('Occurrences');%% FFT using snr_calc% [ snr_idc, freq_bin, s_dBFS_idc ] = snr_calc ( idc, n_nyq, n_cycle );% [ snr_in,  freq_bin, s_dBFS_in ] = snr_calc ( adcin_nyq, n_nyq, n_cycle );% figure (3);  % freq=fnyq*freq_bin;% plot(freq, s_dBFS_idc,'b.-', 'linewidth',1); hold on;% plot(freq, s_dBFS_in,'r.-', 'linewidth',1); hold on;% axis([0 fnyq/2 -80 10]);  xlabel('Frequency [Hz]');  ylabel('DFT Magnitude (dBFS)');% % title(['Incremental ADC;  V_P= ',num2str(max(adcin_dB)),'dBFS;  ','Freq=',num2str(fsig/1e3),'Hz;  ' ,'CLK=',num2str(fclk/1e3),'Hz'] );% text_handle = text(floor(1000),-40, sprintf('SNR = %4.1fdB @ OSR=%4.0f',snr_idc,OSR));% s50=sprintf('w/ snr_calc;   SNR_IDC=%2.2f',snr_idc);     disp(s50);%% END %%%%%%%