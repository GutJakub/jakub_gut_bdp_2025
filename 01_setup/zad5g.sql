SELECT p.imie, p.nazwisko
FROM pracownicy p
INNER JOIN wynagrodzenie w ON w.id_pracownika = p.id_pracownika
INNER JOIN pensja pe ON pe.id_pensji = w.id_pensji
WHERE pe.kwota >=1500 AND pe.kwota <= 3000
