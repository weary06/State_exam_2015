SELECT R.ID_Risorsa, R.Numero_inventario, C.Nome AS Categoria, Ce.Nome AS Centro, R.Stato
FROM Risorsa R
JOIN Categoria C ON R.ID_Categoria = C.ID_Categoria
JOIN Centro Ce ON R.ID_Centro = Ce.ID_Centro
WHERE R.ID_Risorsa NOT IN (
    SELECT DISTINCT P.ID_Risorsa
    FROM Prestito P
    WHERE P.Stato = 'Attivo'
);
