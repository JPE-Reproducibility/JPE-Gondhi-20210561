# JPE Replication Package Checklist

Use this checklist before sending the package to the JPE Data Editor.

- [ ] Root-level `README.md` is complete and has no unresolved TODO items.
- [ ] Root-level `LICENSE.txt` is final and compatible with all included materials.
- [ ] Folder structure clearly separates `code` and `output` (and `data` if applicable).
- [ ] All scripts use relative paths only.
- [ ] A single master script runs all reproducible analyses end-to-end.
- [ ] All random elements use fixed seeds.
- [ ] All outputs (tables, figures, in-text computational values) are written to `output/`.
- [ ] `output/output_map.csv` (or equivalent) maps each paper exhibit to output file and script.
- [ ] Raw and analysis data are documented with variable definitions or codebooks (or marked not applicable for theory/simulation-only papers).
- [ ] Any proprietary data has a non-proprietary copy (for example, `.csv`) when allowed (or marked not applicable).
- [ ] Data citations are listed in both paper references and README dedicated section (or README explicitly states no external datasets are used).
- [ ] If exemption applies, DAS and omission details are explicitly documented.
- [ ] If computationally heavy, simplified test workflow and expected runtime are documented.
- [ ] Package runs from a clean state on another machine.
- [ ] Submission archive is a single `.zip` file (unless Data Editor agreed otherwise).
