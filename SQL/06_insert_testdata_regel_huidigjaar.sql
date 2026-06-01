USE mbo4_exam_database;

INSERT INTO regel_huidigjaar (
    geldig_van,
    geldig_tot,
    segment_rule,
    productjaar_rule,
    maand_rule,
    huidigjaar_result
) VALUES
('2023-01-01', '2099-12-31', '1004', 'Is initieel', '[1..12]', 2025),
('2023-01-01', '2099-12-31', '1000', 'Is initieel', '[1..12]', 2026),
('2023-01-01', '2099-12-31', '1500', 'Is initieel', '[1..12]', 2025);