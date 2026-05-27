clear; clc; close all;

% Master script for full reproduction of all figures in the paper.
% Fixed random seed for deterministic simulation output.
rng(20260525, 'twister');

this_file = mfilename('fullpath');
if isempty(this_file)
    code_dir = pwd;
else
    code_dir = fileparts(this_file);
end

orig_dir = pwd;
cleanup_obj = onCleanup(@() cd(orig_dir));
cd(code_dir);

run(fullfile(code_dir, 'Figure1.m'));
run(fullfile(code_dir, 'Figure2.m'));

disp('All figure scripts completed successfully.');
