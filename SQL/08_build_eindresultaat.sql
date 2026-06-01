/* 
auteur: Ernest Stec
omschrijving: build eindresultaat
*/

USE mbo4_exam_database;

TRUNCATE TABLE eindresultaat;

INSERT INTO eindresultaat (
    bron_id,
    type_overloop,
    huidigjaar,
    maand,
    toerekenen,
    profit_center,
    segment,
    rekening,
    bedrag,
    productjaar,
    vordering,
    middel,
    grondslag,
    resultaatrek,
    component,
    plus_rekening_1,
    plus_rekening_2
)
SELECT
    b.id,
    b.type_overloop,
    rh.huidigjaar_result AS huidigjaar,
    b.maand,
    b.toerekenen,
    b.profit_center,
    b.segment,
    b.rekening,
    b.bedrag,
    b.productjaar,
    COALESCE(rv_exact.vordering, rv_star.vordering) AS vordering,
    rs.middel,
    rs.grondslag,
    rr.resultaatrek,
    rr.component,
    rr.plus_rekening_1,
    rr.plus_rekening_2
FROM bron_intra b
LEFT JOIN regel_segment rs
    ON CAST(b.segment AS CHAR) COLLATE utf8mb4_general_ci = rs.segment_rule COLLATE utf8mb4_general_ci
LEFT JOIN regel_vordering rv_exact
    ON b.type_overloop COLLATE utf8mb4_general_ci = rv_exact.type_overloop_rule COLLATE utf8mb4_general_ci
   AND CAST(b.profit_center AS CHAR) COLLATE utf8mb4_general_ci = rv_exact.profit_center_rule COLLATE utf8mb4_general_ci
   AND (
        (RIGHT(CAST(b.rekening AS CHAR), 2) = '00' AND rv_exact.rekening_rule COLLATE utf8mb4_general_ci = 'Eind. met 00')
        OR
        (RIGHT(CAST(b.rekening AS CHAR), 2) = '01' AND rv_exact.rekening_rule COLLATE utf8mb4_general_ci = 'Eind. met 01')
        OR
        (RIGHT(CAST(b.rekening AS CHAR), 2) = '10' AND rv_exact.rekening_rule COLLATE utf8mb4_general_ci = 'Eind. met 10')
   )
LEFT JOIN regel_vordering rv_star
    ON b.type_overloop COLLATE utf8mb4_general_ci = rv_star.type_overloop_rule COLLATE utf8mb4_general_ci
   AND CAST(b.profit_center AS CHAR) COLLATE utf8mb4_general_ci = rv_star.profit_center_rule COLLATE utf8mb4_general_ci
   AND rv_star.rekening_rule COLLATE utf8mb4_general_ci = 'Eind. met *'
LEFT JOIN regel_resultaat rr
    ON b.type_overloop COLLATE utf8mb4_general_ci = rr.type_overloop_rule COLLATE utf8mb4_general_ci
   AND rr.rekening_status_rule COLLATE utf8mb4_general_ci = 'Is initieel'
   AND COALESCE(rv_exact.vordering, rv_star.vordering) COLLATE utf8mb4_general_ci = rr.vordering_rule COLLATE utf8mb4_general_ci
   AND rs.middel COLLATE utf8mb4_general_ci = rr.middel_rule COLLATE utf8mb4_general_ci
   AND rs.grondslag COLLATE utf8mb4_general_ci = rr.grondslag_rule COLLATE utf8mb4_general_ci
LEFT JOIN regel_huidigjaar rh
    ON CAST(b.segment AS CHAR) COLLATE utf8mb4_general_ci = rh.segment_rule COLLATE utf8mb4_general_ci
   AND rh.productjaar_rule COLLATE utf8mb4_general_ci = 'Is initieel'
   AND rh.maand_rule COLLATE utf8mb4_general_ci = '[1..12]';

UPDATE eindresultaat e
LEFT JOIN regel_financieel_feit rff
    ON e.type_overloop COLLATE utf8mb4_general_ci = rff.type_overloop_rule COLLATE utf8mb4_general_ci
   AND e.toerekenen COLLATE utf8mb4_general_ci = rff.toerekening_rule COLLATE utf8mb4_general_ci
   AND rff.beljr_gewijzigd_rule COLLATE utf8mb4_general_ci = 'JA'
SET e.financieel_feit = rff.financieel_feit;