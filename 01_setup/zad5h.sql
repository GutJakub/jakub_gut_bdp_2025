SELECT g.id_pracownika
FROM pracownicy g
INNER JOIN wynagrodzenie w ON w.id_pracownika = g.id_pracownika
WHERE g.liczba_godzin > 160 AND w.id_premii IS NULL
