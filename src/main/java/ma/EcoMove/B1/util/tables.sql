CREATE DATABASE EcoMove;

CREATE TABLE partenaires (
                             id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                             nomCompagnie VARCHAR(255) NOT NULL,
                             contactCommercial VARCHAR(255),
                             typeTransport VARCHAR(50) CHECK (typeTransport IN ('avion', 'train', 'bus')),
                             zoneGeographique TEXT,
                             conditionsSpeciales TEXT,
                             statutPartenaire VARCHAR(50) CHECK (statutPartenaire IN ('actif', 'inactif', 'suspendu')),
                             dateCreation DATE
);

CREATE TABLE contrats (
                          id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                          partenaire_id UUID REFERENCES partenaires(id) ON DELETE CASCADE,
                          dateDebut DATE,
                          dateFin DATE,
                          tarifSpecial DECIMAL,
                          conditionsAccord TEXT,
                          renouvelable BOOLEAN,
                          statutContrat VARCHAR(50) CHECK (statutContrat IN ('encours', 'termine', 'suspendu'))
);

CREATE TABLE promotions (
                            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                            nomOffre VARCHAR(255),
                            description TEXT,
                            dateDebut DATE,
                            dateFin DATE,
                            typeReduction VARCHAR(50) CHECK (typeReduction IN ('pourcentage', 'montantfixe')),
                            valeurReduction DECIMAL,
                            conditions TEXT,
                            statutOffre VARCHAR(50) CHECK (statutOffre IN ('active', 'expiree', 'suspendue')),
                            contrat_id UUID REFERENCES contrats(id) ON DELETE CASCADE
);

CREATE TABLE billets (
                         id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                         typeTransport VARCHAR(50) CHECK (typeTransport IN ('avion', 'train', 'bus')),
                         prixAchat DECIMAL,
                         prixVente DECIMAL,
                         dateVente TIMESTAMP,
                         statutBillet VARCHAR(50) CHECK (statutBillet IN ('vendu', 'annule', 'enattente')),
                         contrat_id UUID REFERENCES contrats(id) ON DELETE CASCADE,
                         depart VARCHAR(50) ,
                         destination VARCHAR(50),
                         dateDepart date,
                         dateArrive date



);

CREATE TABLE clients (
                         id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                         nom VARCHAR(255) NOT NULL,
                         prenom VARCHAR(255) NOT NULL,
                         email VARCHAR(255) UNIQUE NOT NULL,
                         telephone VARCHAR(20),
                         dateInscription DATE DEFAULT CURRENT_DATE
);

CREATE TABLE reservations (
                              id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                              client_id UUID REFERENCES clients(id) ON DELETE CASCADE,
                              dateReservation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                              statutReservation VARCHAR(50) CHECK (statutReservation IN ('confirmee', 'annulee', 'enattente')),
                              prix DECIMAL,
);

CREATE TABLE reservation_billets (
                                     reservation_id UUID REFERENCES reservations(id) ON DELETE CASCADE,
                                     billet_id UUID REFERENCES billets(id) ON DELETE CASCADE,
                                     PRIMARY KEY (reservation_id, billet_id)
);

CREATE TABLE favoris
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    depart        VARCHAR(50),
    destination   VARCHAR(50),
    dateDepart    date,
    client_id UUID REFERENCES clients(id) ON DELETE CASCADE,
    typeTransport VARCHAR(50) CHECK (typeTransport IN ('avion', 'train', 'bus'))

);
