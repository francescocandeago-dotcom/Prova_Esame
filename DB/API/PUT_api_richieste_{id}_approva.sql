// -------------------------------------------------------------
// PUT /api/richieste/{id}/approva
// -------------------------------------------------------------

UPDATE RichiestePermesso
SET 
    Stato = 'Approvato',
    DataValutazione = CURRENT_TIMESTAMP,
    UtenteValutazioneID = UtenteIDResponsabile
WHERE 
    RichiestaID = IdRichiesta
    AND Stato = 'In attesa';

---------------------------------------------------------------------------

SPIEGAZIONE:
UPDATE: indica che vogliamo aggiornare una o più righe di una tabella.
SET: indica quali colonne devono essere aggiornate e quali valori devono assumere.
     Modifica il campo Stato, assegnandogli il valore 'Approvato'.
     Registra la data e l'ora in cui viene effettuata la valutazione. (CURRENT_TIMESTAMP è una funzione SQL che restituisce la data e l'ora correnti del sistema.)
     Registra l'identificativo dell'utente responsabile che ha effettuato la valutazione.
        In pratica, il campo UtenteValutazioneID viene valorizzato con il valore contenuto nella variabile UtenteIDResponsabile.
WHERE: stabilisce quali righe devono essere aggiornate.
       Prima condizione:
       RichiestaID = IdRichiesta
       Individua la richiesta specifica che vogliamo approvare.

       Seconda condizione:
       AND Stato = 'In attesa'
       Controlla che la richiesta sia ancora in attesa di valutazione.
       Questo è un controllo importante perché impedisce di approvare nuovamente una richiesta che è già stata approvata o rifiutata.
AND: serve a stabilire che tutte le condizioni presenti nella WHERE devono essere vere contemporaneamente.