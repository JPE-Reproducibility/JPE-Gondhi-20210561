clear; clc; close all;

% Master script for full reproduction of all figures in the paper.
this_file = mfilename('fullpath');
code_dir = fileparts(this_file);

run(fullfile(code_dir, 'Figure1.m'));
run(fullfile(code_dir, 'Figure2.m'));

disp('All figure scripts completed successfully.');
