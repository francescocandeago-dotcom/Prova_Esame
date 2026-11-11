// -------------------------------------------------------------
// PUT /api/richieste/{id}/rifiuta
// -------------------------------------------------------------

UPDATE RichiestePermesso
SET 
    Stato = 'Rifiutato',
    DataValutazione = CURRENT_TIMESTAMP,
    UtenteValutazioneID = UtenteIDResponsabile
WHERE 
    RichiestaID = IdRichiesta
    AND Stato = 'In attesa';

-----------------------------------------------------------------------------------

SPIEGAZIONE:
UPDATE: Indica che vogliamo modificare i dati presenti nella tabella RichiestePermesso.
SET: Qui specifichiamo quali valori devono essere aggiornati.
     Stato = 'Rifiutato'
     Modifica lo stato della richiesta, impostandolo a Rifiutato.
     Quindi la richiesta non viene accettata dal responsabile.

     DataValutazione = CURRENT_TIMESTAMP
     Registra la data e l'ora in cui il responsabile ha rifiutato la richiesta.
     CURRENT_TIMESTAMP restituisce automaticamente la data e l'ora correnti.
     
     UtenteValutazioneID = UtenteIDResponsabile
     Registra l'identificativo del responsabile che ha effettuato il rifiuto.
WHERE: Questa parte stabilisce quali richieste possono essere modificate.
       Prima condizione:
       RichiestaID = IdRichiesta
       Individua la richiesta specifica che il responsabile vuole rifiutare.
       Ad esempio, se IdRichiesta = 12, verrà individuata la richiesta numero 12.

       Seconda condizione:
       AND Stato = 'In attesa'
       Controlla che la richiesta sia ancora in attesa.
       Questo significa che non possiamo rifiutare una richiesta che è già stata approvata o rifiutata.

Ricorda: con AND entrambe le condizioni devono essere vere.