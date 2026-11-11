// -------------------------------------------------------------
// PUT /api/richieste/{Id}
// modifica richiesta da parte del dipendente (solo se propria e da approvare)
// -------------------------------------------------------------

UPDATE RichiestePermesso
SET 
    DataInizio = '2026-06-10',
    DataFine = '2026-06-12',
    CategoriaID = CategoriaID,
    Motivazione = 'Nuova motivazione aggiornata'
WHERE 
    RichiestaID = RichiestaID
    AND UtenteID = UtenteID
    AND Stato = 'In attesa';

--------------------------------------------------------------------------------

SPIEGAZIONE: 
UPDATE: Significa che vuoi modificare un record già presente nella tabella RichiestePermesso.
        A differenza di INSERT, che inserisce una nuova riga, UPDATE modifica una riga esistente.
SET: Con SET specifichi quali colonne vuoi aggiornare e quali saranno i loro nuovi valori.
Attenzione: CategoriaIDNuova è un segnaposto, quindi deve essere sostituito con il nuovo identificativo della categoria.
WHERE: quali richieste modificare, Il WHERE stabilisce quali record possono essere modificati.

Prima condizione:
RichiestaID = IdRichiesta
Modifica soltanto la richiesta con l'identificativo specificato.
Ad esempio, se IdRichiesta = 25, verrà selezionata la richiesta numero 25.
Seconda condizione:
UtenteID = UtenteIDAutenticato
Verifica che la richiesta appartenga all'utente che ha effettuato il login.
Questo è importante per impedire a un utente di modificare le richieste di un altro utente.
Terza condizione:
Stato = 'In attesa'
Permette di modificare la richiesta soltanto se è ancora in attesa.
Ad esempio, se la richiesta è già stata approvata o rifiutata, non verrà modificata.