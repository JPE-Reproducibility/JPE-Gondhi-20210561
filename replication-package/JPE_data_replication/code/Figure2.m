clear all; clc;close all;
tau=1;tau_eta=1;tau_e=1;
deltal=0.55;
deltah=1/deltal;
gamma0=tau_eta/(tau+tau_eta+tau_e);
gammal=deltal*tau_eta/(tau+deltal*tau_eta+tau_e);
gammah=deltah*tau_eta/(tau+deltah*tau_eta+tau_e);
rho=0;
psi_vec=linspace(0.000001,4,700);
gamma_vec=linspace(-3,1,800);

% Save outputs in the replication-package output directory.
this_file = mfilename('fullpath');
code_dir = fileparts(this_file);
outdir = fullfile(code_dir,'..','output','figures');
if ~exist(outdir, 'dir')
    mkdir(outdir);
end
for i=1:length(gamma_vec)
    for j=1:length(psi_vec)
        psi=psi_vec(j);
        gammaf=gamma_vec(i);
        chi=-rho-gammaf-rho*gammaf;
        asym(i,j)=0;
        sym(i,j)=0;DispCGi(i,j)=0;
        chi_cutoff1=(psi*(2-(gammal+gammah)/gamma0) + 1)*gammal/gammah;
        chi_cutoff2=(psi*(2-(gammal+gammah)/gamma0) + 1)*gammah/gammal;  
        gamma=(gamma0*(2*psi+1) - psi*gammal)/(2*psi);
        gamma_opt=max(min(gamma,gammah),gammal);
        chi_cutoff3=(psi*(2-(gammal+gamma_opt)/gamma0) + 1)*gammal/gamma_opt;
        chi_cutoff4=(psi*(2-(gammal+gamma_opt)/gamma0) + 1)*gamma_opt/gammal; 
            if chi<=chi_cutoff4 && chi>=chi_cutoff3
                asym(i,j)=1;
                gamma=(gamma0*(2*psi+1) - psi*gammal)/(2*psi);
                delta=deltah;
                if 2*psi- gamma0*(2*psi+1)+psi*gammal>0
                    delta=(tau+tau_e)*(gamma0*(2*psi+1) -psi*gammal)/((2*psi- gamma0*(2*psi+1)+psi*gammal)*tau_eta);
                end
                gamma_opt=max(min(gamma,gammah),gammal);
                delta_opt=max(min(delta,deltah),deltal);
                delta_opt1=gamma_opt*(tau+tau_e)/((1-gamma_opt)*tau_eta); % this is same as above line    
                B=sqrt((psi*(2-(gammal+gamma_opt)/gamma0)+1)*gammal*gamma_opt/chi);
                B_vec(i,j)=B;
                lambda=(B-gammal)/(gamma_opt-gammal);
                A1=tau_e/(tau+delta_opt*tau_eta+tau_e);B1=delta_opt*tau_eta/(tau+delta_opt*tau_eta+tau_e);
                A2=tau_e/(tau+deltal*tau_eta+tau_e);B2=deltal*tau_eta/(tau+deltal*tau_eta+tau_e);
                A=lambda*A1+(1-lambda)*A2;
                alpha1=A1/(1+rho-rho*A);
                alpha2=A2/(1+rho-rho*A);
                alpha=A/(1+rho-rho*A);
                beta=(1+rho)*B/(1+rho-rho*A);
                beta1=(rho*B + B1)/(1+rho-rho*A);
                beta2=(rho*B + B2)/(1+rho-rho*A);
                CGa(i,j)=((1-alpha-beta)*(alpha+beta)/tau - beta^2/tau_eta)/((alpha+beta)^2/tau + beta^2/tau_eta);
                CG1=((1-alpha1-beta1)*(alpha1+beta1)/tau -alpha1^2/tau_e -beta1^2/tau_eta)/((alpha1+beta1)^2/tau +alpha1^2/tau_e +beta1^2/tau_eta)   ;
                CG2=((1-alpha2-beta2)*(alpha2+beta2)/tau -alpha2^2/tau_e -beta2^2/tau_eta)/((alpha2+beta2)^2/tau +alpha2^2/tau_e +beta2^2/tau_eta);
                CGi(i,j)=lambda*CG1+(1-lambda)*CG2;
                DispCGi(i,j)=sqrt(lambda*(1-lambda)*(CG1-CG2)^2);
            end
            if chi>chi_cutoff4
                sym(i,j)=gammal;
                B_vec(i,j)=gammal;
                A=tau_e/(tau+deltal*tau_eta+tau_e);
                alpha=A/(1+rho-rho*A);
                B=deltal*tau_eta/(tau+deltal*tau_eta+tau_e);
                beta=(1+rho)*B/(1+rho-rho*A);
                CGi(i,j)=((1-alpha-beta)*(alpha+beta)/tau -alpha^2/tau_e -beta^2/tau_eta)/((alpha+beta)^2/tau +alpha^2/tau_e +beta^2/tau_eta);
                CGa(i,j)=((1-alpha-beta)*(alpha+beta)/tau - beta^2/tau_eta)/((alpha+beta)^2/tau + beta^2/tau_eta);                
            end
            if chi<chi_cutoff3
                sym(i,j)=max(min(gammah,gamma0*(2*psi+1-chi)/(2*psi)),gammal);
                B_vec(i,j)=sym(i,j);
                delta=deltah;
                if 2*psi- (1-chi)*tau_eta/(tau+tau_e)>0
                    delta=(2*psi+1-chi)/(2*psi- (1-chi)*tau_eta/(tau+tau_e));
                end
                gamma_opt=max(min(gamma,gammah),gammal);
                delta_opt=max(min(delta,deltah),deltal);
                A=tau_e/(tau+delta_opt*tau_eta+tau_e);
                alpha=A/(1+rho-rho*A);
                B=delta_opt*tau_eta/(tau+delta_opt*tau_eta+tau_e);
                beta=(1+rho)*B/(1+rho-rho*A);
                CGi(i,j)=((1-alpha-beta)*(alpha+beta)/tau -alpha^2/tau_e -beta^2/tau_eta)/((alpha+beta)^2/tau +alpha^2/tau_e +beta^2/tau_eta);
                CGa(i,j)=((1-alpha-beta)*(alpha+beta)/tau - beta^2/tau_eta)/((alpha+beta)^2/tau + beta^2/tau_eta);
            end
        end
    end



f1 = figure('Color','w','Units','inches','Position',[1 1 5 4]);
imagesc([min(psi_vec) max(psi_vec)], [max(gamma_vec) min(gamma_vec)], asym);
cmap = [1 1 1; 0.7 0.7 0.7];
colormap(cmap);
xlabel('\psi','FontSize',20);
ylabel('\gamma','FontSize',20);
ytnew = get(gca, 'YTick');
ytlbl = linspace(max(gamma_vec), min(gamma_vec), numel(ytnew));
set(gca, 'YTick', ytnew, 'YTickLabel', ytlbl);
set(gca, 'FontSize', 13, 'LineWidth', 1.0, 'Box', 'on');
exportgraphics(f1, fullfile(outdir,'figure2_panel_a_region_disagreement.pdf'), ...
    'ContentType', 'vector');

f2 = figure('Color','w','Units','inches','Position',[1 1 5 4]);
contourf(psi_vec, gamma_vec, CGa, [ -0.04 0 0.1 0.18 0.3 0.43 ], 'ShowText', 'on');
colorbar;
xlabel('\psi','FontSize',20);
ylabel('\gamma','FontSize',20);
set(gca, 'FontSize', 13, 'LineWidth', 1.0, 'Box', 'on');
exportgraphics(f2, fullfile(outdir,'figure2_panel_b_cga_contour.pdf'), ...
    'ContentType', 'vector');

f3 = figure('Color','w','Units','inches','Position',[1 1 5 4]);
contourf(psi_vec, gamma_vec, CGi, [ -0.13 -0.08 -0.04 0 0.03 0.06 ], 'ShowText', 'on');
colorbar;
xlabel('\psi','FontSize',20);
ylabel('\gamma','FontSize',20);
set(gca, 'FontSize', 13, 'LineWidth', 1.0, 'Box', 'on');
exportgraphics(f3, fullfile(outdir,'figure2_panel_c_cgi_contour.pdf'), ...
    'ContentType', 'vector');


