// -------------------------------------------------------------
// GET /api/richieste
// Visualizzazione richieste (Dipendenti: solo proprie; Responsabili: tutte)
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
    u.Cognome AS CognomeRichiedente
FROM RichiestePermesso r
JOIN CategoriePermesso c ON r.CategoriaID = c.CategoriaID
JOIN Utenti u ON r.UtenteID = u.UtenteID
ORDER BY r.DataRichiesta DESC;

------------------------------------------------------------------------------------

SPIEGAZIONE:
Questa query SQL serve a recuperare tutte le richieste di permesso dal database, mostrando anche la categoria del permesso e i dati dell'utente che ha effettuato la richiesta.

SELECT: indica quali informazioni vogliamo recuperare.
r.RichiestaID: recupera l'identificativo della richiesta.
r.DataRichiesta: recupera la data in cui è stata effettuata la richiesta.
r.DataInizio: recupera la data di inizio del permesso.
r.DataFine: recupera la data di fine del permesso.
r.Motivazione: recupera il motivo della richiesta.
r.Stato: recupera lo stato della richiesta (In attesa, Approvato o Rifiutato).
c.Descrizione AS Categoria: recupera la descrizione della categoria del permesso e la rinomina Categoria.
u.Nome AS NomeRichiedente: recupera il nome dell'utente e lo rinomina NomeRichiedente.
u.Cognome AS CognomeRichiedente: recupera il cognome dell'utente e lo rinomina CognomeRichiedente.

Collegamento tra le tabelle:
FROM RichiestePermesso r: indica la tabella principale da cui recuperare i dati. r è un'abbreviazione di RichiestePermesso.
JOIN CategoriePermesso c ON r.CategoriaID = c.CategoriaID: collega la tabella delle richieste con quella delle categorie, utilizzando CategoriaID.
JOIN Utenti u ON r.UtenteID = u.UtenteID: collega la tabella delle richieste con quella degli utenti, utilizzando UtenteID.

Le lettere r, c e u sono delle abbreviazioni (alias) dei nomi delle tabelle.
Servono per scrivere meno codice e rendere la query più semplice da leggere.
Nel tuo caso:
r = RichiestePermesso
c = CategoriePermesso
u = Utenti

FROM indica da quale tabella vogliamo recuperare i dati.
Significa che la tabella principale da cui partiamo è RichiestePermesso, abbreviata con r.

JOIN serve a collegare due o più tabelle per recuperare informazioni da tutte.
Collega la tabella RichiestePermesso con la tabella CategoriePermesso.
Il secondo JOIN Collega la tabella RichiestePermesso con la tabella Utenti.

ON serve a specificare quale colonna deve essere utilizzata per collegare le due tabelle.

ORDER BY serve a ordinare i risultati ottenuti dalla query.

DESC indica che l'ordinamento deve essere decrescente.
Quindi:
Prima vengono mostrate le richieste più recenti.
Dopo vengono mostrate quelle più vecchie.

r.CategoriaID = c.CategoriaID
Serve a collegare:
r.CategoriaID: l'ID della categoria presente nella tabella RichiestePermesso.
c.CategoriaID: l'ID della categoria presente nella tabella CategoriePermesso.

2. r.UtenteID = u.UtenteID
Serve a collegare:
r.UtenteID: l'ID dell'utente presente nella tabella RichiestePermesso.
u.UtenteID: l'ID dell'utente presente nella tabella Utenti.