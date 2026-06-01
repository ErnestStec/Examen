/* 
auteur: Ernest Stec
omschrijving: insert testdata in regel_segment
*/

USE mbo4_exam_database;

INSERT INTO regel_segment (
    segment_rule,
    segment_omschrijving,
    middel,
    grondslag,
    grondslag_omschrijving
) VALUES
('1004', 'Test segment 1004', 'Ontvangst', 'Aanslag', 'Aanslag test'),
('1000', 'Test segment 1000', 'Ontvangst', 'Aangifte', 'Aangifte test'),
('1500', 'Test segment 1500', 'Ontvangst', 'Algemeen', 'Algemeen test');