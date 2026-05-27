clear all; clc;close all;
tau=1;
tau_e=1;
tau_eta=1;
deltah=4;deltal=1/deltah;
gamma0=tau_eta/(tau+tau_e+tau_eta);
gammal=deltal*tau_eta/(tau+deltah*tau_e+deltal*tau_eta);
gammah=deltah*tau_eta/(tau+deltah*tau_e+deltah*tau_eta);
psi=0;
chi=1;
gammaopt=gammah;
Bopt=sqrt((psi*(2-(gammal+gammaopt)/gamma0)+1)*gammal*gammaopt/chi);
lambda=(Bopt-gammal)/(gammah-gammal);
delta_eta_vec=linspace(deltal,deltah,1000);

% Save outputs in the replication-package output directory.
this_file = mfilename('fullpath');
if isempty(this_file)
    code_dir = pwd;
else
    code_dir = fileparts(this_file);
end
outdir = fullfile(code_dir,'..','output','figures');
if ~exist(outdir, 'dir')
    mkdir(outdir);
end

for i=1:length(delta_eta_vec)
    delta_eta=delta_eta_vec(i);
    gamma_i=delta_eta*tau_eta/(tau+deltah*tau_e+delta_eta*tau_eta);
    B=gammal;
    TUl(i)=(1-gamma_i)*(-1+chi*B^2/gamma_i) - psi*((1-gamma_i)^2 + gamma_i^2 * (1-gamma0)/gamma0);
    B=gammah;
    TUh(i)=(1-gamma_i)*(-1+chi*B^2/gamma_i) - psi*((1-gamma_i)^2 + gamma_i^2 * (1-gamma0)/gamma0);
    B=Bopt;
    TU(i)=(1-gamma_i)*(-1+chi*B^2/gamma_i) - psi*((1-gamma_i)^2 + gamma_i^2 * (1-gamma0)/gamma0);
end
figure(1)
plot(delta_eta_vec,TUl,'r','LineWidth',2)
xlim([0 4]);
xticks(0:0.5:4);
ylim([-0.95 -0.55]);
set(gca,'FontSize',13,'LineWidth',1.0,'Box','on');
xlabel('\delta_{\eta,i}: player i choice','FontSize',20)
set(gcf,'Color','w','Units','inches','Position',[1 1 5 4]);
exportgraphics(gcf, fullfile(outdir,'figure1_panel_a_B_equals_Bbar.pdf'), ...
    'ContentType','vector');



figure(2)
plot(delta_eta_vec,TUh,'r','LineWidth',2)
xlim([0 4]);
xticks(0:0.5:4);
ylim([-0.5 3.0]);
set(gca,'FontSize',13,'LineWidth',1.0,'Box','on');
xlabel('\delta_{\eta,i}: player i choice','FontSize', 20)
set(gcf,'Color','w','Units','inches','Position',[1 1 5 4]);
exportgraphics(gcf, fullfile(outdir,'figure1_panel_b_B_equals_Bunderline.pdf'), ...
    'ContentType','vector');

figure(3)
plot(delta_eta_vec,TU,'r','LineWidth',2)
xlim([0 4]);
xticks(0:0.5:4);
ylim([-0.75 -0.50]);
set(gca,'FontSize',13,'LineWidth',1.0,'Box','on');
xlabel('\delta_{\eta,i}: player i choice','FontSize', 20)
set(gcf,'Color','w','Units','inches','Position',[1 1 5 4]);
exportgraphics(gcf, fullfile(outdir,'figure1_panel_c_mixed_equilibrium.pdf'), ...
    'ContentType','vector');
