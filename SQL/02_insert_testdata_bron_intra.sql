/* 
auteur: Ernest Stec
omschrijving: insert testdata in bron_intra
*/

USE mbo4_exam_database;

INSERT INTO bron_intra (
    type_overloop,
    huidigjaar_input,
    maand,
    toerekenen,
    profit_center,
    segment,
    rekening,
    bedrag,
    productjaar
) VALUES
('INTRA', 2025, 12, 'JA', 100, 1004, 200000, 1000.00, 2025),
('INTRA', 2026, 1, 'JA', 101, 1000, 300010, 2000.00, 2025),
('INTRA', 2025, 12, 'JA', 190, 1500, 160001, 1500.00, 2024);