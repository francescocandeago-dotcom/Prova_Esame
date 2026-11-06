// -------------------------------------------------------------
// GET /api/richieste/{id}
// -------------------------------------------------------------

SELECT 
    r.RichiestaID, r.DataRichiesta, r.DataInizio, r.DataFine, 
    r.Motivazione, r.Stato, r.DataValutazione, c.CategoriaID, 
    c.Descrizione AS Categoria, u.UtenteID AS RichiedenteID, 
    u.Nome AS NomeRichiedente, u.Cognome AS CognomeRichiedente, 
    v.Nome AS NomeValutatore, v.Cognome AS CognomeValutatore
FROM RichiestePermesso r
JOIN CategoriePermesso c ON r.CategoriaID = c.CategoriaID
JOIN Utenti u ON r.UtenteID = u.UtenteID
LEFT JOIN Utenti v ON r.UtenteValutazioneID = v.UtenteID
WHERE r.RichiestaID = IdRichiesta;

-------------------------------------------------------------------------------

SPIEGAZIONE:
Questa query SQL serve a recuperare tutti i dettagli di una specifica richiesta di permesso, compresi i dati del dipendente che l'ha effettuata e quelli del responsabile che l'ha valutata.

r.DataValutazione: recupera la data e l'ora in cui il responsabile ha valutato la richiesta.
c.CategoriaID: recupera l'identificativo della categoria del permesso.
u.UtenteID AS RichiedenteID: recupera l'ID dell'utente che ha effettuato la richiesta e lo rinomina RichiedenteID.
v.Nome AS NomeValutatore: recupera il nome del responsabile che ha valutato la richiesta.
v.Cognome AS CognomeValutatore: recupera il cognome del responsabile.

LEFT JOIN: permette di recuperare comunque la richiesta anche se non esiste ancora un responsabile che l'ha valutata.
r.UtenteValutazioneID = v.UtenteID: confronta l'ID del responsabile che ha valutato la richiesta con l'ID presente nella tabella Utenti.

Perché viene utilizzato LEFT JOIN invece di JOIN?
Perché una richiesta potrebbe essere ancora in attesa di valutazione.
Ad esempio:
Se la richiesta è ancora in attesa, i campi NomeValutatore e CognomeValutatore saranno NULL.

WHERE: Serve a filtrare i risultati, mostrando solamente la richiesta che ha l'identificativo specificato.
WHERE: imposta una condizione per filtrare i risultati.