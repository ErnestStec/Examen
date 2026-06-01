USE mbo4_exam_database;

INSERT INTO regel_resultaat (
    geldig_van,
    geldig_tot,
    type_overloop_rule,
    rekening_status_rule,
    vordering_rule,
    middel_rule,
    grondslag_rule,
    resultaatrek,
    component,
    plus_rekening_1,
    plus_rekening_2
) VALUES
('2023-01-01', '2099-12-31', 'INTRA', 'Is initieel', 'NEE', 'Ontvangst', 'Aanslag', '800000', '10', '120000', '139000'),
('2023-01-01', '2099-12-31', 'INTRA', 'Is initieel', 'JA', 'Ontvangst', 'Aangifte', '800010', '10', '120000', '139010'),
('2023-01-01', '2099-12-31', 'INTRA', 'Is initieel', 'JA', 'Ontvangst', 'Algemeen', '800100', '10', '0', '0');