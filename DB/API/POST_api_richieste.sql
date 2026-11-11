// -------------------------------------------------------------
// POST /api/richieste
// -------------------------------------------------------------

INSERT INTO RichiestePermesso (DataInizio, DataFine, CategoriaID, Motivazione, Stato, UtenteID)
VALUES ('2026-06-01', '2026-06-05', CategoriaID, 'Motivazione testo', 'In attesa', UtenteID);

--------------------------------------------------------------------------------

SPIEGAZIONE:
INSERT INTO RichiestePermesso: Significa: inserisci un nuovo record (una nuova riga) nella tabella RichiestePermesso.
                               Questa tabella potrebbe contenere tutte le richieste di permesso effettuate dagli utenti di un'applicazione.
Le cose dentro parentesi: Qui stai indicando quali colonne della tabella vuoi valorizzare.
VALUES: Qui inserisci i valori corrispondenti alle colonne indicate precedentemente.
        vediamoli:
        '2026-06-01': il permesso inizia il primo giugno 2026.
        '2026-06-05': il permesso termina il cinque giugno 2026.
        ID_Categoria: è l'identificativo della categoria scelta dall'utente.
        'Motivazione testo': è il testo che spiega il motivo della richiesta.
        'In attesa': la richiesta è stata inserita ma non ancora approvata.
        UtenteIDAutenticato: identifica l'utente che ha effettuato l'accesso all'applicazione.