# Data and Code for: Strategic Wishful Thinking: Implications for Forecasts

Authors: Snehal Banerjee, Jesse Davis, Naveen Gondhi  
Affiliations:  
- Snehal Banerjee — University of California, San Diego  
- Jesse Davis — University of North Carolina at Chapel Hill  
- Naveen Gondhi — INSEAD  
Paper date: April 27, 2026  
Journal: *Journal of Political Economy* (accepted)  
Corresponding author: Naveen Gondhi

## Statement of Rights

- I certify that the author(s) of the manuscript have legitimate access to and permission to use the data used in this manuscript.
- I certify that the author(s) of the manuscript have documented permission to redistribute/publish the data contained within this replication package. Appropriate permissions are documented in the `LICENSE.txt` file (if applicable).

## Data Availability Statement (DAS)

This package is prepared for JPE pre-publication reproducibility checks.

This manuscript is a theoretical paper with numerical simulations only.

- No external or proprietary datasets are used.
- No raw data are required to reproduce the results.
- All paper and appendix figures are generated from simulation code in `code/`.

Restrictions and exemptions:

- No exemption is currently documented in this package.
- Since no dataset is used, no data-sharing exemption is required for this package.

## Package Contents

- `README.md`: single source of documentation required by JPE.
- `LICENSE.txt`: package use and redistribution terms.
- `code/`: scripts/programs to reproduce all exhibits via numerical simulation.
- `output/`: generated outputs for tables, figures, and logs.
- `data/` folder is intentionally omitted in the final package because no datasets are used.

## Computational Requirements

Replication package was prepared and tested on the following machine:

- Operating system: Microsoft Windows 10 Enterprise, 64-bit (version 10.0.19045)
- CPU: Intel(R) Core(TM) i7-6700T CPU @ 2.80GHz (4 physical cores, 8 logical processors)
- RAM: 34,247,561,216 bytes installed (about 34.25 GB, approximately 31.9 GiB usable)
- Storage requirement: at least 200 MB of free disk space for scripts, generated figures, and logs
- MATLAB executable: `C:\Program Files\MATLAB\R2026a\bin\matlab.exe`
- MATLAB release used for checks: R2026a
- Required MATLAB toolboxes: none beyond standard MATLAB numerical and plotting functionality
- GPU requirement: none
- Expected runtime:
  - Full run from source code to all outputs: approximately 2-10 minutes on the machine listed above
  - Quick/test run (if provided): not applicable

## Reproducibility Instructions

The package should run with minimal human intervention and produce all reproducible exhibits in the paper and appendices.

1. Install software dependencies listed in this README.
2. From MATLAB, run `code/run_all.m`.
3. Verify that all outputs are generated in `output/figures/`.
4. Cross-check outputs against `output/output_map.csv`.

Random seed for reproducibility:

- A fixed MATLAB random seed is set in `code/run_all.m` before any figure script is executed.
- The exact command is `rng(20260525, 'twister')`.
- To replicate the journal-checked output exactly, do not change this value.
- If a different seed is needed for robustness checks, change the value in `code/run_all.m` and rerun all scripts.

Important:

- Use relative paths in scripts.
- Random seed is set in `code/run_all.m` using `rng(20260525, 'twister')`.
- Ensure output files are written to disk (not only shown in console).
- Remove stale outputs before final replication test.

## Output Location and Exhibit Mapping

Final package must include a complete one-to-one mapping:

- paper/appendix exhibit identifier
- generated file path in `output/`
- script that creates it

Output map file: `output/output_map.csv`

## Data Citations

No external datasets are used in this study.

## Omissions, Exceptions, and Check Scope

Use this section to disclose any approved omissions and the exact reason (legal/licensing/exemption).

If checks are partial because of computational burden, document:

- what subset is checked,
- what is not checked,
- why,
- and where the simplified test code is located.

## Ethics and Pre-registration (If Applicable)

- Not applicable: this paper does not involve human-subject data collection or experimental participants.

## PII Verification

- This package contains no participant-level or confidential personal data.
- The only personal identifiers are author names already present in the manuscript metadata.
- No personal file-system paths, user account names, phone numbers, or private contact information are included in the replication scripts and output files.

## Final Submission Notes for JPE Dataverse

- Do not include confidential data in the public deposit.
- Upload the same checked folder structure approved by the Data Editor.
- Ensure metadata and data citations are complete before "Submit for Review."
