SELECT p.imie, p.nazwisko, g.liczba_godzin - 160
FROM pracownicy p
INNER JOIN godziny g ON g.id_pracownika = p.id_pracownika
WHERE g.liczba_godzin > 160;
