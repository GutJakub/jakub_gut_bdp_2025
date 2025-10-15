-- Tabela pracownicy
CREATE TABLE pracownicy (
  id_pracownika SERIAL PRIMARY KEY,
  imie VARCHAR(50),
  nazwisko VARCHAR(100),
  adres VARCHAR(200),
  telefon INTEGER
);
COMMENT ON TABLE pracownicy IS 'Tabela przechowuje podstawowe dane o pracownikach firmy.';

-- Tabela godziny
CREATE TABLE godziny (
  id_godziny SERIAL PRIMARY KEY,
  data DATE,
  liczba_godzin INTEGER,
  id_pracownika INTEGER REFERENCES pracownicy(id_pracownika) ON DELETE CASCADE
);
COMMENT ON TABLE godziny IS 'Tabela godziny przechowuje przepracowane godziny w danym dniu i przez danego pracownika.';

-- Tabela pensja
CREATE TABLE pensja (
  id_pensji SERIAL PRIMARY KEY,
  rodzaj VARCHAR(100),
  kwota NUMERIC(12,2) CHECK (kwota >= 0)
);
COMMENT ON TABLE pensja IS 'Tabela pensja przechowuje dane o rodzaju oraz kwocie pensji.';

-- Tabela premia
CREATE TABLE premia (
  id_premii SERIAL PRIMARY KEY,
  nazwa VARCHAR(100),
  kwota NUMERIC(12,2) CHECK (kwota >= 0)
);
COMMENT ON TABLE premia IS 'Tabela premia przechowuje dane o nazwie i kwocie premii';

-- Tabela wynagrodzenie
CREATE TABLE wynagrodzenie (
  id_wynagrodzenia SERIAL PRIMARY KEY,
  data DATE,
  id_pracownika INTEGER REFERENCES pracownicy(id_pracownika) ON DELETE RESTRICT,
  id_godziny INTEGER REFERENCES godziny(id_godziny) ON DELETE SET NULL,
  id_pensji INTEGER REFERENCES pensja(id_pensji) ON DELETE SET NULL,
  id_premii INTEGER REFERENCES premia(id_premii) ON DELETE SET NULL
);
COMMENT ON TABLE wynagrodzenia IS 'Tabel wynagrodzenia łączy dane o pracownikach ich godzinach, pensjach oraz premiach.';


  
  
