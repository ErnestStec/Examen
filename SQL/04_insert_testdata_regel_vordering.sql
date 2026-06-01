USE mbo4_exam_database;

INSERT INTO regel_vordering (
    type_overloop_rule,
    profit_center_rule,
    rekening_rule,
    vordering
) VALUES
('INTRA', '100', 'Eind. met 00', 'NEE'),
('INTRA', '101', 'Eind. met 10', 'JA'),
('INTRA', '190', 'Eind. met 01', 'JA');