-- a
SELECT P.ID_Prenotazione, U.Nome, U.Cognome, C.Nome AS Categoria, Ce.Nome AS Centro, P.Data_Prenotazione, P.Stato
FROM Prenotazione P
JOIN Categoria C ON P.ID_Categoria = C.ID_Categoria
JOIN Utente U ON P.ID_Utente = U.ID_Utente
JOIN Centro Ce ON P.ID_Centro = Ce.ID_Centro
WHERE C.Nome = 'NomeCategoria';

--b
SELECT DISTINCT C.Nome AS Categoria
FROM Risorsa R
JOIN Categoria C ON R.ID_Categoria = C.ID_Categoria
JOIN Centro Ce ON R.ID_Centro = Ce.ID_Centro
WHERE Ce.Nome = 'NomeCentro';

--c
SELECT R.ID_Risorsa, R.Numero_inventario, C.Nome AS Categoria, Ce.Nome AS Centro, P.Data_Prestito
FROM Prestito P
JOIN Risorsa R ON P.ID_Risorsa = R.ID_Risorsa
JOIN Categoria C ON R.ID_Categoria = C.ID_Categoria
JOIN Centro Ce ON R.ID_Centro = Ce.ID_Centro
WHERE P.Stato = 'Attivo' AND DATEDIFF(CURDATE(), P.Data_Prestito) > 180
ORDER BY Ce.Nome ASC, C.Nome ASC;

--d
SELECT C.Nome AS Categoria, COUNT(P.ID_Prestito) AS Numero_Prestiti
FROM Prestito P
JOIN Risorsa R ON P.ID_Risorsa = R.ID_Risorsa
JOIN Categoria C ON R.ID_Categoria = C.ID_Categoria
GROUP BY C.Nome
ORDER BY Numero_Prestiti DESC
LIMIT 1;
