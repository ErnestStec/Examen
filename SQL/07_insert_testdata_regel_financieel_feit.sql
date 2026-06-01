/* 
auteur: Ernest Stec
omschrijving: insert testdata in regel_financieel_feit
*/

USE mbo4_exam_database;

INSERT INTO regel_financieel_feit (
    geldig_van,
    geldig_tot,
    type_overloop_rule,
    toerekening_rule,
    beljr_gewijzigd_rule,
    financieel_feit
) VALUES
('2025-01-01', '2030-12-31', 'INTRA', 'JA', 'JA', '13111');