// -------------------------------------------------------------
// GET /api/richieste/da-approvare
// -------------------------------------------------------------

SELECT 
    r.RichiestaID,
    r.DataRichiesta,
    r.DataInizio,
    r.DataFine,
    r.Motivazione,
    r.Stato,
    c.Descrizione AS Categoria,
    u.Nome AS NomeRichiedente,
    u.Cognome AS CognomeRichiedente,
    u.Email AS EmailRichiedente
FROM RichiestePermesso r
JOIN CategoriePermesso c ON r.CategoriaID = c.CategoriaID
JOIN Utenti u ON r.UtenteID = u.UtenteID
WHERE r.Stato = 'In attesa'
ORDER BY r.DataRichiesta ASC;

-------------------------------------------------------------------------------

SPIEGAZIONE:
Le colonne provengono da tre tabelle diverse:
Tabella RichiestePermesso (r):
Tabella CategoriePermesso (c):
Tabella Utenti (u):

AS permette di assegnare un nome alternativo a una colonna nel risultato.

FROM: Indica che la tabella principale da cui recuperiamo i dati è RichiestePermesso.

JOIN: Collega la tabella RichiestePermesso alla tabella CategoriePermesso.

ORDER BY: indica che vogliamo ordinare i risultati.
r.DataRichiesta: indica la colonna da utilizzare per l'ordinamento.
ASC: significa ordine crescente.