// -------------------------------------------------------------
// DELETE /api/richieste/{Id}
// -------------------------------------------------------------

DELETE FROM RichiestePermesso
WHERE 
    RichiestaID = IdRichiesta
    AND UtenteID = UtenteIDAutenticato
    AND Stato = 'In attesa';

------------------------------------------------------------------------------
SPIEGAZIONE:
DELETE FROM: elimina una o più righe dalla tabella RichiestePermesso.
    A differenza degli altri comandi:
        INSERT → inserisce una nuova richiesta.
        UPDATE → modifica una richiesta esistente.
        DELETE → elimina una richiesta esistente.
AND: significa "E" e serve per collegare più condizioni in una query.
     (La cosa importante è che tutte le condizioni collegate da AND devono essere vere affinché l'operazione venga eseguita.)
     Per eliminare una richiesta, SQL controlla:
     RichiestaID = IdRichiesta → è la richiesta che voglio eliminare?
     UtenteID = UtenteIDAutenticato → appartiene all'utente che ha effettuato il login?
     Stato = 'In attesa' → è ancora in attesa?
     Tutte e tre devono essere vere.