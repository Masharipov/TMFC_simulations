function event_related_results_FIR(stat_path,exp_folder,q_level,ground_truth)

% ========================================================================
% Ruslan Masharipov, July, 2024
% email: ruslan.s.masharipov@gmail.com
% ========================================================================

load([stat_path filesep exp_folder filesep 'group_stat' filesep 'sPPI_and_gPPI_with_Deconv_FIR.mat']);
load([stat_path filesep exp_folder filesep 'group_stat' filesep 'sPPI_and_gPPI_without_Deconv_FIR.mat']);
load([stat_path filesep exp_folder filesep 'group_stat' filesep 'cPPI_with_Deconv_FIR.mat']);
load([stat_path filesep exp_folder filesep 'group_stat' filesep 'cPPI_without_Deconv_FIR.mat']);
load([stat_path filesep exp_folder filesep 'group_stat' filesep 'BSC_LSA_FIR.mat']);
load([stat_path filesep exp_folder filesep 'group_stat' filesep 'BSC_LSS_FIR.mat']);
load([stat_path filesep exp_folder filesep 'group_stat' filesep 'BSC_FRR_FIR.mat']);
load([stat_path filesep exp_folder filesep 'group_stat' filesep 'TSFC_BGFC.mat']);

%% sPPI with Deconv
[sPPI_WD_TaskA_vs_TaskB_asymm_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(sPPI_WD_TaskA_vs_TaskB_asymm,q_level);
[sPPI_WD_TaskA_vs_TaskB_symm_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(sPPI_WD_TaskA_vs_TaskB_symm,q_level);
gm_sPPI_WD_TaskIndep_asymm = mean(sPPI_WD_TaskIndep_asymm,3);
gm_sPPI_WD_TaskIndep_symm  = mean(sPPI_WD_TaskIndep_symm,3);
gm_sPPI_WD_TaskA_vs_TaskB_asymm = mean(sPPI_WD_TaskA_vs_TaskB_asymm,3);
gm_sPPI_WD_TaskA_vs_TaskB_symm = mean(sPPI_WD_TaskA_vs_TaskB_symm,3);
gm_sPPI_WD_TaskIndep_asymm(1:1+size(sPPI_WD_TaskIndep_asymm,1):end) = 1;
gm_sPPI_WD_TaskIndep_symm(1:1+size(sPPI_WD_TaskIndep_symm,1):end) = 1;
gm_sPPI_WD_TaskA_vs_TaskB_asymm(1:1+size(gm_sPPI_WD_TaskA_vs_TaskB_asymm,1):end) = 0;
gm_sPPI_WD_TaskA_vs_TaskB_symm(1:1+size(gm_sPPI_WD_TaskA_vs_TaskB_symm,1):end) = 0;
sPPI_WD_TaskA_vs_TaskB_asymm_FDR(1:1+size(sPPI_WD_TaskA_vs_TaskB_asymm_FDR,1):end) = 0;
sPPI_WD_TaskA_vs_TaskB_symm_FDR(1:1+size(sPPI_WD_TaskA_vs_TaskB_symm_FDR,1):end) = 0;

figure
try
    sgtitle('sPPI with Deconvolution (After FIR task regression)')
catch
    suptitle('sPPI with Deconvolution (After FIR task regression)')
end
subplot(231); imagesc(gm_sPPI_WD_TaskIndep_asymm);       title('TaskIndep asymm');      axis square; caxis(max_ax(gm_sPPI_WD_TaskIndep_asymm,1));          
subplot(232); imagesc(gm_sPPI_WD_TaskA_vs_TaskB_asymm);  title('Task AvsB asymm');      axis square; caxis(max_ax(gm_sPPI_WD_TaskA_vs_TaskB_asymm,1)); 
subplot(233); imagesc(sPPI_WD_TaskA_vs_TaskB_asymm_FDR); title('Task AvsB asymm FDR');  axis square; 
subplot(234); imagesc(gm_sPPI_WD_TaskIndep_symm);        title('TaskIndep symm');       axis square; caxis(max_ax(gm_sPPI_WD_TaskIndep_symm,1));           
subplot(235); imagesc(gm_sPPI_WD_TaskA_vs_TaskB_symm);   title('Task AvsB symm');       axis square; caxis(max_ax(gm_sPPI_WD_TaskA_vs_TaskB_symm,1));  
subplot(236); imagesc(sPPI_WD_TaskA_vs_TaskB_symm_FDR);  title('Task AvsB symm FDR');   axis square; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue')
colormap(subplot(233),'parula') 
colormap(subplot(236),'parula') 

fprintf(['sPPI with deconvolution assymetry :: r = ' num2str(check_symmetry(mean(sPPI_WD_TaskA_vs_TaskB_asymm,3))) ' \n']);

%% gPPI with Deconv
[gPPI_WD_TaskA_vs_TaskB_asymm_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(gPPI_WD_TaskA_vs_TaskB_asymm,q_level);
[gPPI_WD_TaskA_vs_TaskB_symm_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(gPPI_WD_TaskA_vs_TaskB_symm,q_level);
gm_gPPI_WD_TaskIndep_asymm = mean(gPPI_WD_TaskIndep_asymm,3);
gm_gPPI_WD_TaskIndep_symm  = mean(gPPI_WD_TaskIndep_symm,3);
gm_gPPI_WD_TaskA_vs_TaskB_asymm = mean(gPPI_WD_TaskA_vs_TaskB_asymm,3);
gm_gPPI_WD_TaskA_vs_TaskB_symm = mean(gPPI_WD_TaskA_vs_TaskB_symm,3);
gm_gPPI_WD_TaskIndep_asymm(1:1+size(gPPI_WD_TaskIndep_asymm,1):end) = 1;
gm_gPPI_WD_TaskIndep_symm(1:1+size(gPPI_WD_TaskIndep_symm,1):end) = 1;
gm_gPPI_WD_TaskA_vs_TaskB_asymm(1:1+size(gm_gPPI_WD_TaskA_vs_TaskB_asymm,1):end) = 0;
gm_gPPI_WD_TaskA_vs_TaskB_symm(1:1+size(gm_gPPI_WD_TaskA_vs_TaskB_symm,1):end) = 0;
gPPI_WD_TaskA_vs_TaskB_asymm_FDR(1:1+size(gPPI_WD_TaskA_vs_TaskB_asymm_FDR,1):end) = 0;
gPPI_WD_TaskA_vs_TaskB_symm_FDR(1:1+size(gPPI_WD_TaskA_vs_TaskB_symm_FDR,1):end) = 0;

figure
try
    sgtitle('gPPI with Deconvolution (After FIR task regression)')
catch
    suptitle('gPPI with Deconvolution (After FIR task regression)')
end
subplot(251); imagesc(gm_gPPI_WD_TaskIndep_asymm);         title('TaskIndep asymm');      axis square; caxis(max_ax(gm_gPPI_WD_TaskIndep_asymm,1));
subplot(252); imagesc(mean(gPPI_WD_TaskA_asymm,3));        title('Task A asymm');         axis square; caxis(max_ax(mean(gPPI_WD_TaskA_asymm,3),1));
subplot(253); imagesc(mean(gPPI_WD_TaskB_asymm,3));        title('Task B asymm');         axis square; caxis(max_ax(mean(gPPI_WD_TaskB_asymm,3),1));
subplot(254); imagesc(gm_gPPI_WD_TaskA_vs_TaskB_asymm);    title('Task AvsB asymm');      axis square; caxis(max_ax(gm_gPPI_WD_TaskA_vs_TaskB_asymm,1));
subplot(255); imagesc(gPPI_WD_TaskA_vs_TaskB_asymm_FDR);   title('Task AvsB asymm FDR');  axis square;
subplot(256); imagesc(gm_gPPI_WD_TaskIndep_symm);          title('TaskIndep symm');       axis square; caxis(max_ax(gm_gPPI_WD_TaskIndep_symm,1));
subplot(257); imagesc(mean(gPPI_WD_TaskA_symm,3));         title('Task A symm');          axis square; caxis(max_ax(mean(gPPI_WD_TaskA_symm,3),1));
subplot(258); imagesc(mean(gPPI_WD_TaskB_symm,3));         title('Task B symm');          axis square; caxis(max_ax(mean(gPPI_WD_TaskB_symm,3),1));
subplot(259); imagesc(gm_gPPI_WD_TaskA_vs_TaskB_symm);     title('Task AvsB symm');       axis square; caxis(max_ax(gm_gPPI_WD_TaskA_vs_TaskB_symm,1));
subplot(2,5,10); imagesc(gPPI_WD_TaskA_vs_TaskB_symm_FDR); title('Task AvsB symm FDR');   axis square;
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue')
colormap(subplot(255),'parula') 
colormap(subplot(2,5,10),'parula') 

fprintf(['gPPI with deconvolution assymetry :: r = ' num2str(check_symmetry(gm_gPPI_WD_TaskA_vs_TaskB_asymm)) ' \n']);

%% sPPI without Deconv
[sPPI_WoD_TaskA_vs_TaskB_asymm_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(sPPI_WoD_TaskA_vs_TaskB_asymm,q_level);
[sPPI_WoD_TaskA_vs_TaskB_symm_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(sPPI_WoD_TaskA_vs_TaskB_symm,q_level);
gm_sPPI_WoD_TaskIndep_asymm = mean(sPPI_WoD_TaskIndep_asymm,3);
gm_sPPI_WoD_TaskIndep_symm  = mean(sPPI_WoD_TaskIndep_symm,3);
gm_sPPI_WoD_TaskA_vs_TaskB_asymm = mean(sPPI_WoD_TaskA_vs_TaskB_asymm,3);
gm_sPPI_WoD_TaskA_vs_TaskB_symm = mean(sPPI_WoD_TaskA_vs_TaskB_symm,3);
gm_sPPI_WoD_TaskIndep_asymm(1:1+size(sPPI_WoD_TaskIndep_asymm,1):end) = 1;
gm_sPPI_WoD_TaskIndep_symm(1:1+size(sPPI_WoD_TaskIndep_symm,1):end) = 1;
gm_sPPI_WoD_TaskA_vs_TaskB_asymm(1:1+size(gm_sPPI_WoD_TaskA_vs_TaskB_asymm,1):end) = 0;
gm_sPPI_WoD_TaskA_vs_TaskB_symm(1:1+size(gm_sPPI_WoD_TaskA_vs_TaskB_symm,1):end) = 0;
sPPI_WoD_TaskA_vs_TaskB_asymm_FDR(1:1+size(sPPI_WoD_TaskA_vs_TaskB_asymm_FDR,1):end) = 0;
sPPI_WoD_TaskA_vs_TaskB_symm_FDR(1:1+size(sPPI_WoD_TaskA_vs_TaskB_symm_FDR,1):end) = 0;

figure
try
    sgtitle('sPPI without Deconvolution (After FIR task regression)')
catch
    suptitle('sPPI without Deconvolution (After FIR task regression)')
end
subplot(231); imagesc(gm_sPPI_WoD_TaskIndep_asymm);       title('TaskIndep asymm');      axis square; caxis(max_ax(gm_sPPI_WoD_TaskIndep_asymm,1));          
subplot(232); imagesc(gm_sPPI_WoD_TaskA_vs_TaskB_asymm);  title('Task AvsB asymm');      axis square; caxis(max_ax(gm_sPPI_WoD_TaskA_vs_TaskB_asymm,1)); 
subplot(233); imagesc(sPPI_WoD_TaskA_vs_TaskB_asymm_FDR); title('Task AvsB asymm FDR');  axis square; 
subplot(234); imagesc(gm_sPPI_WoD_TaskIndep_symm);        title('TaskIndep symm');       axis square; caxis(max_ax(gm_sPPI_WoD_TaskIndep_symm,1));           
subplot(235); imagesc(gm_sPPI_WoD_TaskA_vs_TaskB_symm);   title('Task AvsB symm');       axis square; caxis(max_ax(gm_sPPI_WoD_TaskA_vs_TaskB_symm,1));  
subplot(236); imagesc(sPPI_WoD_TaskA_vs_TaskB_symm_FDR);  title('Task AvsB symm FDR');   axis square; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue')
colormap(subplot(233),'parula') 
colormap(subplot(236),'parula') 

fprintf(['sPPI without deconvolution assymetry :: r = ' num2str(check_symmetry(mean(sPPI_WoD_TaskA_vs_TaskB_asymm,3))) ' \n']);

%% gPPI without Deconv
[gPPI_WoD_TaskA_vs_TaskB_asymm_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(gPPI_WoD_TaskA_vs_TaskB_asymm,q_level);
[gPPI_WoD_TaskA_vs_TaskB_symm_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(gPPI_WoD_TaskA_vs_TaskB_symm,q_level);
gm_gPPI_WoD_TaskIndep_asymm = mean(gPPI_WoD_TaskIndep_asymm,3);
gm_gPPI_WoD_TaskIndep_symm  = mean(gPPI_WoD_TaskIndep_symm,3);
gm_gPPI_WoD_TaskA_vs_TaskB_asymm = mean(gPPI_WoD_TaskA_vs_TaskB_asymm,3);
gm_gPPI_WoD_TaskA_vs_TaskB_symm = mean(gPPI_WoD_TaskA_vs_TaskB_symm,3);
gm_gPPI_WoD_TaskIndep_asymm(1:1+size(gPPI_WoD_TaskIndep_asymm,1):end) = 1;
gm_gPPI_WoD_TaskIndep_symm(1:1+size(gPPI_WoD_TaskIndep_symm,1):end) = 1;
gm_gPPI_WoD_TaskA_vs_TaskB_asymm(1:1+size(gm_gPPI_WoD_TaskA_vs_TaskB_asymm,1):end) = 0;
gm_gPPI_WoD_TaskA_vs_TaskB_symm(1:1+size(gm_gPPI_WoD_TaskA_vs_TaskB_symm,1):end) = 0;
gPPI_WoD_TaskA_vs_TaskB_asymm_FDR(1:1+size(gPPI_WoD_TaskA_vs_TaskB_asymm_FDR,1):end) = 0;
gPPI_WoD_TaskA_vs_TaskB_symm_FDR(1:1+size(gPPI_WoD_TaskA_vs_TaskB_symm_FDR,1):end) = 0;

figure
try
    sgtitle('gPPI without Deconvolution (After FIR task regression)')
catch
    suptitle('gPPI without Deconvolution (After FIR task regression)')
end
subplot(251); imagesc(gm_gPPI_WoD_TaskIndep_asymm);         title('TaskIndep asymm');      axis square; caxis(max_ax(gm_gPPI_WoD_TaskIndep_asymm,1));
subplot(252); imagesc(mean(gPPI_WoD_TaskA_asymm,3));        title('Task A asymm');         axis square; caxis(max_ax(mean(gPPI_WoD_TaskA_asymm,3),1));
subplot(253); imagesc(mean(gPPI_WoD_TaskB_asymm,3));        title('Task B asymm');         axis square; caxis(max_ax(mean(gPPI_WoD_TaskB_asymm,3),1));
subplot(254); imagesc(gm_gPPI_WoD_TaskA_vs_TaskB_asymm);    title('Task AvsB asymm');      axis square; caxis(max_ax(gm_gPPI_WoD_TaskA_vs_TaskB_asymm,1));
subplot(255); imagesc(gPPI_WoD_TaskA_vs_TaskB_asymm_FDR);   title('Task AvsB asymm FDR');  axis square;
subplot(256); imagesc(gm_gPPI_WoD_TaskIndep_symm);          title('TaskIndep symm');       axis square; caxis(max_ax(gm_gPPI_WoD_TaskIndep_symm,1));
subplot(257); imagesc(mean(gPPI_WoD_TaskA_symm,3));         title('Task A symm');          axis square; caxis(max_ax(mean(gPPI_WoD_TaskA_symm,3),1));
subplot(258); imagesc(mean(gPPI_WoD_TaskB_symm,3));         title('Task B symm');          axis square; caxis(max_ax(mean(gPPI_WoD_TaskB_symm,3),1));
subplot(259); imagesc(gm_gPPI_WoD_TaskA_vs_TaskB_symm);     title('Task AvsB symm');       axis square; caxis(max_ax(gm_gPPI_WoD_TaskA_vs_TaskB_symm,1));
subplot(2,5,10); imagesc(gPPI_WoD_TaskA_vs_TaskB_symm_FDR); title('Task AvsB symm FDR');   axis square;
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue')
colormap(subplot(255),'parula') 
colormap(subplot(2,5,10),'parula') 

fprintf(['gPPI without deconvolution assymetry :: r = ' num2str(check_symmetry(gm_gPPI_WoD_TaskA_vs_TaskB_asymm)) ' \n']);

%% cPPI with deconv and without deconv
[cPPI_WD_TaskA_vs_TaskB_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(cPPI_WD_TaskA_vs_TaskB,q_level);
[cPPI_WoD_TaskA_vs_TaskB_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(cPPI_WoD_TaskA_vs_TaskB,q_level);
gm_cPPI_WD_TaskA_vs_TaskB = mean(cPPI_WD_TaskA_vs_TaskB,3);
gm_cPPI_WoD_TaskA_vs_TaskB = mean(cPPI_WoD_TaskA_vs_TaskB,3);
gm_cPPI_WD_TaskA_vs_TaskB(1:1+size(gm_cPPI_WD_TaskA_vs_TaskB,1):end) = 1;
gm_cPPI_WoD_TaskA_vs_TaskB(1:1+size(gm_cPPI_WoD_TaskA_vs_TaskB,1):end) = 1;

figure
try
    sgtitle('cPPI (After FIR task regression)')
catch
    suptitle('cPPI (After FIR task regression)')
end
subplot(221); imagesc(gm_cPPI_WD_TaskA_vs_TaskB);   title('cPPI WD Task AvsB');       axis square; caxis(max_ax(gm_cPPI_WD_TaskA_vs_TaskB,1));
subplot(223); imagesc(gm_cPPI_WoD_TaskA_vs_TaskB);  title('cPPI WoD Task AvsB');      axis square; caxis(max_ax(gm_cPPI_WoD_TaskA_vs_TaskB,1));
subplot(222); imagesc(cPPI_WD_TaskA_vs_TaskB_FDR);  title('cPPI WD Task AvsB FDR');   axis square; 
subplot(224); imagesc(cPPI_WoD_TaskA_vs_TaskB_FDR); title('cPPI WoD Task AvsB FDR');  axis square; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue') 
colormap(subplot(222),'parula') 
colormap(subplot(224),'parula') 

%% BSC-LSA
[BSC_LSA_TaskA_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_LSA_TaskA_group,q_level);
[BSC_LSA_TaskB_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_LSA_TaskB_group,q_level);
[BSC_LSA_TaskA_vs_TaskB_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_LSA_TaskA_vs_TaskB_group,q_level);
gm_BSC_LSA_TaskA_vs_TaskB = mean(BSC_LSA_TaskA_vs_TaskB_group,3);
gm_BSC_LSA_TaskA_vs_TaskB(1:1+size(gm_BSC_LSA_TaskA_vs_TaskB,1):end) = 0;
BSC_LSA_TaskA_vs_TaskB_group_FDR(1:1+size(BSC_LSA_TaskA_vs_TaskB_group_FDR,1):end) = 0;

figure
try
    sgtitle('Beta-series correlations: LSA approach (After FIR task regression)')
catch
    suptitle('Beta-series correlations: LSA approach (After FIR task regression)')
end
subplot(231); imagesc(mean(BSC_LSA_TaskA_group,3)); title('LSA Task A');      axis square; caxis(max_ax(mean(BSC_LSA_TaskA_group,3),1));
subplot(232); imagesc(mean(BSC_LSA_TaskB_group,3)); title('LSA Task B');      axis square; caxis(max_ax(mean(BSC_LSA_TaskB_group,3),1));
subplot(233); imagesc(gm_BSC_LSA_TaskA_vs_TaskB);   title('LSA Task AvsB');   axis square; caxis(max_ax(gm_BSC_LSA_TaskA_vs_TaskB,1));
subplot(234); imagesc(BSC_LSA_TaskA_group_FDR);     title('LSA Task A FDR');  axis square; 
subplot(235); imagesc(BSC_LSA_TaskB_group_FDR);     title('LSA Task B FDR');  axis square; 
subplot(236); imagesc(BSC_LSA_TaskA_vs_TaskB_group_FDR); title('LSA Task AvsB FDR');  axis square; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue')
colormap(subplot(234),'parula') 
colormap(subplot(235),'parula') 
colormap(subplot(236),'parula') 

%% BSC-LSS
[BSC_LSS_TaskA_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_LSS_TaskA_group,q_level);
[BSC_LSS_TaskB_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_LSS_TaskB_group,q_level);
[BSC_LSS_TaskA_vs_TaskB_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_LSS_TaskA_vs_TaskB_group,q_level);
gm_BSC_LSS_TaskA_vs_TaskB = mean(BSC_LSS_TaskA_vs_TaskB_group,3);
gm_BSC_LSS_TaskA_vs_TaskB(1:1+size(gm_BSC_LSS_TaskA_vs_TaskB,1):end) = 0;
BSC_LSS_TaskA_vs_TaskB_group_FDR(1:1+size(BSC_LSS_TaskA_vs_TaskB_group_FDR,1):end) = 0;

figure
try
    sgtitle('Beta-series correlations: LSS approach (After FIR task regression)')
catch
    suptitle('Beta-series correlations: LSS approach (After FIR task regression)')
end
subplot(231); imagesc(mean(BSC_LSS_TaskA_group,3)); title('LSS TaskA');       axis square; caxis(max_ax(mean(BSC_LSS_TaskA_group,3),1));
subplot(232); imagesc(mean(BSC_LSS_TaskB_group,3)); title('LSS TaskB');       axis square; caxis(max_ax(mean(BSC_LSS_TaskB_group,3),1));
subplot(233); imagesc(gm_BSC_LSS_TaskA_vs_TaskB);   title('LSS TaskAvsB');    axis square; caxis(max_ax(gm_BSC_LSS_TaskA_vs_TaskB,1));
subplot(234); imagesc(BSC_LSS_TaskA_group_FDR);     title('LSS Task A FDR');  axis square; 
subplot(235); imagesc(BSC_LSS_TaskB_group_FDR);     title('LSS Task B FDR');  axis square; 
subplot(236); imagesc(BSC_LSS_TaskA_vs_TaskB_group_FDR); title('LSS Task AvsB FDR');  axis square; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue')
colormap(subplot(234),'parula') 
colormap(subplot(235),'parula') 
colormap(subplot(236),'parula')

%% BSC-FRR
[BSC_FRR_TaskA_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_FRR_TaskA_group,q_level);
[BSC_FRR_TaskB_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_FRR_TaskB_group,q_level);
[BSC_FRR_TaskA_vs_TaskB_group_FDR Nsig_FDR pval tval matrix_uncorr001 Nsig_uncorr001] = network_onesample_ttest(BSC_FRR_TaskA_vs_TaskB_group,q_level);
gm_BSC_FRR_TaskA_vs_TaskB = mean(BSC_FRR_TaskA_vs_TaskB_group,3);
gm_BSC_FRR_TaskA_vs_TaskB(1:1+size(gm_BSC_FRR_TaskA_vs_TaskB,1):end) = 0;
BSC_FRR_TaskA_vs_TaskB_group_FDR(1:1+size(BSC_FRR_TaskA_vs_TaskB_group_FDR,1):end) = 0;

figure
try
    sgtitle('Beta-series correlations: FRR approach (After FIR task regression)')
catch
    suptitle('Beta-series correlations: FRR approach (After FIR task regression)')
end
subplot(231); imagesc(mean(BSC_FRR_TaskA_group,3)); title('FRR TaskA');       axis square; caxis(max_ax(mean(BSC_FRR_TaskA_group,3),1));
subplot(232); imagesc(mean(BSC_FRR_TaskB_group,3)); title('FRR TaskB');       axis square; caxis(max_ax(mean(BSC_FRR_TaskB_group,3),1));
subplot(233); imagesc(gm_BSC_FRR_TaskA_vs_TaskB);   title('FRR TaskAvsB');    axis square; caxis(max_ax(gm_BSC_FRR_TaskA_vs_TaskB,1));
subplot(234); imagesc(BSC_FRR_TaskA_group_FDR);     title('FRR Task A FDR');  axis square; 
subplot(235); imagesc(BSC_FRR_TaskB_group_FDR);     title('FRR Task B FDR');  axis square; 
subplot(236); imagesc(BSC_FRR_TaskA_vs_TaskB_group_FDR); title('FRR Task AvsB FDR');  axis square; 
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue')
colormap(subplot(234),'parula') 
colormap(subplot(235),'parula') 
colormap(subplot(236),'parula') 

%% TSFC and BGFC
figure
subplot(121); imagesc(mean(TSFC_group,3)); title('TSFC');  axis square; caxis(max_ax(mean(TSFC_group,3),1));
subplot(122); imagesc(mean(BGFC_group,3)); title('BGFC');  axis square; caxis(max_ax(mean(BGFC_group,3),1));
set(findall(gcf,'-property','FontSize'),'FontSize',12)
colormap('redblue') 

%% Sensitivity and Specificity
T = ground_truth;
TMFC_FDR_results(:,:,1) = sPPI_WD_TaskA_vs_TaskB_symm_FDR;
TMFC_FDR_results(:,:,2) = sPPI_WD_TaskA_vs_TaskB_asymm_FDR;
TMFC_FDR_results(:,:,3) = gPPI_WD_TaskA_vs_TaskB_symm_FDR;
TMFC_FDR_results(:,:,4) = gPPI_WD_TaskA_vs_TaskB_asymm_FDR;
TMFC_FDR_results(:,:,5) = sPPI_WoD_TaskA_vs_TaskB_symm_FDR;
TMFC_FDR_results(:,:,6) = sPPI_WoD_TaskA_vs_TaskB_asymm_FDR;
TMFC_FDR_results(:,:,7) = gPPI_WoD_TaskA_vs_TaskB_symm_FDR;
TMFC_FDR_results(:,:,8) = gPPI_WoD_TaskA_vs_TaskB_asymm_FDR;
TMFC_FDR_results(:,:,9) = cPPI_WD_TaskA_vs_TaskB_FDR;
TMFC_FDR_results(:,:,10) = cPPI_WoD_TaskA_vs_TaskB_FDR;
TMFC_FDR_results(:,:,11) = BSC_LSA_TaskA_vs_TaskB_group_FDR;
TMFC_FDR_results(:,:,12) = BSC_LSS_TaskA_vs_TaskB_group_FDR;
TMFC_FDR_results(:,:,13) = BSC_FRR_TaskA_vs_TaskB_group_FDR;

for i=1:13
    P = TMFC_FDR_results(:,:,i);
    P(1:1+size(P,1):end) = 0;
    FP = sum(sum((1-T).*P));
    FN = sum(sum(T.*(1-P)));
    TP = sum(sum(T.*P));
    TN = sum(sum((1-T).*(1-P)));
    TPR(i) = TP./(TP+FN);
    TNR(i) = TN./(TN+FP);
    PPV(i) = TP./(TP+FP);
    NPV(i) = TN./(TN+FN);
    FDR(i) = 1-PPV(i);
    clear P FP FN TP TN
end

save([stat_path filesep exp_folder filesep 'group_stat' filesep 'all_results_FIR_[q_level_' num2str(q_level) '].mat'],'TPR','TNR','PPV','NPV','FDR')

