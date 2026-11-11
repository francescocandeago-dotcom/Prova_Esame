// -------------------------------------------------------------
// GET /api/categorie
// -------------------------------------------------------------

SELECT 
    CategoriaID, 
    Descrizione 
FROM CategoriePermesso
ORDER BY Descrizione ASC;

------------------------------------------------------------------------------

SPIEGAZIONE:
SELECT: specifichiamo quali colonne vogliamo ottenere come risultato.
        In questo caso selezioniamo:
        CategoriaID: l'identificativo univoco della categoria.
        Descrizione: il nome o la descrizione della categoria.
FROM: Indica che i dati devono essere recuperati dalla tabella CategoriePermesso.

Questa parte serve a ordinare i risultati.
ORDER BY: indica che vogliamo ordinare i dati.
Descrizione: indica la colonna sulla quale effettuare l'ordinamento.
ASC: significa ordine crescente, quindi alfabetico dalla A alla Z.