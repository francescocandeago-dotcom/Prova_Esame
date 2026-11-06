-- DDL: Creazione Tabelle
CREATE TABLE CategoriePermesso (
    CategoriaID SERIAL PRIMARY KEY,
    Descrizione VARCHAR(100) NOT NULL
);

1. CREATE TABLE CategoriePermesso
Crea una tabella nel database con il nome CategoriePermesso.

2. CategoriaID SERIAL PRIMARY KEY
Crea una colonna chiamata CategoriaID.

SERIAL: genera automaticamente un numero progressivo per ogni nuovo record (1, 2, 3...).

PRIMARY KEY: identifica in modo univoco ogni riga della tabella. Non può contenere valori duplicati o NULL.

3. Descrizione VARCHAR(100) NOT NULL
Crea una colonna chiamata Descrizione.

VARCHAR(100): può contenere testo fino a 100 caratteri.

NOT NULL: obbliga a inserire una descrizione. Non può essere lasciata vuota con un valore NULL.

-------------------------------------------------------------------------

-- Tabella Utenti
CREATE TABLE Utenti (
    UtenteID SERIAL PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Ruolo VARCHAR(20) CHECK (Ruolo IN ('Dipendente', 'Responsabile')) NOT NULL
);

UtenteID: identificativo univoco generato automaticamente per ogni utente.
Nome: nome dell'utente, obbligatorio e massimo 50 caratteri.
Cognome: cognome dell'utente, obbligatorio e massimo 50 caratteri.
Email: indirizzo email dell'utente, obbligatorio e non duplicabile.(UNIQUE serve a impedire che due utenti abbiano lo stesso indirizzo email.)
Password: password dell'utente, obbligatoria e con un massimo di 255 caratteri.
Ruolo: indica se l'utente è un Dipendente oppure un Responsabile. Il vincolo CHECK impedisce di inserire ruoli diversi da questi due.
       IN serve a controllare che il valore inserito appartenga a un elenco di valori consentiti. Significa che nella colonna Ruolo si possono inserire solamente due valori:
       Dipendente
       Responsabile

-------------------------------------------------------------------------

-- Richieste Permesso
CREATE TABLE RichiestePermesso (
    RichiestaID SERIAL PRIMARY KEY,
    DataRichiesta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DataInizio DATE NOT NULL,
    DataFine DATE NOT NULL,
    CategoriaID INT REFERENCES CategoriePermesso(CategoriaID),
    Motivazione TEXT,
    Stato VARCHAR(20) DEFAULT 'In attesa' CHECK (Stato IN ('In attesa', 'Approvato', 'Rifiutato')),
    UtenteID INT REFERENCES Utenti(UtenteID) ON DELETE CASCADE,
    DataValutazione TIMESTAMP NULL,
    UtenteValutazioneID INT REFERENCES Utenti(UtenteID) NULL,
    CONSTRAINT check_date CHECK (DataFine >= DataInizio)
);

RichiestaID: identificativo univoco generato automaticamente per ogni richiesta.
DataRichiesta: registra automaticamente la data e l'ora in cui viene inserita la richiesta, grazie a DEFAULT CURRENT_TIMESTAMP. 
               (TIMESTAMP serve a memorizzare una data e un'ora precise all'interno del database.)
DataInizio: indica la data di inizio del permesso. È obbligatoria (NOT NULL). (DATE serve a memorizzare solamente una data, senza registrare l'orario.)
DataFine: indica la data di fine del permesso. È obbligatoria (NOT NULL).
CategoriaID: identifica la categoria del permesso e fa riferimento alla colonna CategoriaID della tabella CategoriePermesso, tramite REFERENCES.
             Questa istruzione crea una chiave esterna (FOREIGN KEY).
             Significa che CategoriaID deve corrispondere a una categoria realmente esistente nella tabella CategoriePermesso.
             INT serve a memorizzare un numero intero, cioè un numero senza virgola.
Motivazione: contiene il motivo per cui viene richiesto il permesso. Utilizza TEXT perché può contenere un testo di lunghezza variabile.
Stato: indica lo stato della richiesta. Di default è impostato su 'In attesa'. Il vincolo CHECK permette solamente tre valori: 'In attesa', 'Approvato' e 'Rifiutato'.
       DEFAULT Serve quando viene creata una nuova richiesta, lo stato viene impostato automaticamente su In attesa, se non viene specificato diversamente.
UtenteID: identifica l'utente che ha effettuato la richiesta e fa riferimento alla tabella Utenti.
          ON DELETE CASCADE significa che, se viene eliminato l'utente, vengono eliminate automaticamente anche le sue richieste.
DataValutazione: registra la data e l'ora in cui il responsabile valuta la richiesta. NULL significa che può rimanere vuota.
UtenteValutazioneID: identifica l'utente (generalmente il responsabile) che ha valutato la richiesta e fa riferimento alla tabella Utenti. Può essere NULL se la richiesta non è ancora stata valutata.
L'ultima riga serve a controllare che la data di fine del permesso sia uguale o successiva alla data di inizio.
    CONSTRAINT: indica che stiamo definendo un vincolo.
    check_date: è il nome che viene assegnato al vincolo. Può essere scelto liberamente.
    CHECK: impone una condizione che deve essere rispettata.
    DataFine >= DataInizio: controlla che la data di fine non sia precedente a quella di inizio.
        Esempio: DataInizio: 10/11/2026 – DataFine: 12/11/2026 → Valido.
                 DataInizio: 12/11/2026 – DataFine: 10/11/2026 → Non valido.

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- SEED DATI REALISTICI
INSERT INTO CategoriePermesso (Descrizione) VALUES 
('Ferie'), ('Visita Medica'), ('Permesso Personale'), ('Maternità/Paternità');

INSERT INTO CategoriePermesso: indica nella tabella CategoriePermesso dove inserire i dati.
(Descrizione): specifica la colonna in cui inserire i valori.
VALUES: indica i valori da inserire.
('Ferie'), ('Visita Medica'), ('Permesso Personale'), ('Maternità/Paternità')

--------------------------------------------

-- Password di test per tutti: "password123"
INSERT INTO Utenti (Nome, Cognome, Email, Password, Ruolo) VALUES
('Mario', 'Rossi', 'mario.rossi@azienda.it', '$2b$10$wT8n...hash_di_password123', 'Dipendente'),
('Giulia', 'Bianchi', 'giulia.bianchi@azienda.it', '$2b$10$wT8n...hash_di_password123', 'Dipendente'),
('Roberto', 'Bossi', 'roberto.bossi@azienda.it', '$2b$10$wT8n...hash_di_password123', 'Responsabile');

INSERT INTO Utenti: indica che i dati devono essere inseriti nella tabella Utenti.
(Nome, Cognome, Email, Password, Ruolo): specifica le colonne in cui inserire i dati.
VALUES: indica i valori da inserire.
Le tre righe successive rappresentano i tre utenti:

--------------------------------------------

INSERT INTO RichiestePermesso (DataInizio, DataFine, CategoriaID, Motivazione, Stato, UtenteID, DataValutazione, UtenteValutazioneID) VALUES
('2026-06-01', '2026-06-05', 1, 'Ferie estive anticipate', 'Approvato', 1, CURRENT_TIMESTAMP, 3),
('2026-06-10', '2026-06-10', 2, 'Visita dentistica', 'In attesa', 1, NULL, NULL),
('2026-06-15', '2026-06-18', 3, 'Trasloco casa nuova', 'In attesa', 2, NULL, NULL);

INSERT INTO RichiestePermesso: indica che i dati devono essere inseriti nella tabella RichiestePermesso.
(DataInizio, DataFine, CategoriaID, Motivazione, Stato, UtenteID, DataValutazione, UtenteValutazioneID): specifica le colonne in cui inserire i dati.
VALUES: indica i valori da inserire.