
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) VALUES
('Jan', 'Kowalski', 'Kraków, ul. Długa 12', 501234567),
('Anna', 'Nowak', 'Warszawa, ul. Polna 4', 502111222),
('Piotr', 'Wiśniewski', 'Gdańsk, ul. Morska 8', 503222333),
('Katarzyna', 'Wójcik', 'Poznań, ul. Jesienna 5', 504333444),
('Tomasz', 'Kamiński', 'Łódź, ul. Krótka 22', 505444555),
('Agnieszka', 'Lewandowska', 'Wrocław, ul. Słoneczna 9', 506555666),
('Michał', 'Zieliński', 'Katowice, ul. Parkowa 10', 507666777),
('Ewa', 'Szymańska', 'Lublin, ul. Wiosenna 3', 508777888),
('Marcin', 'Woźniak', 'Bydgoszcz, ul. Różana 14', 509888999),
('Joanna', 'Dąbrowska', 'Szczecin, ul. Lipowa 1', 500999111);

INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES
('2025-10-01', 8, 1),
('2025-10-01', 7, 2),
('2025-10-02', 8, 3),
('2025-10-02', 6, 4),
('2025-10-03', 8, 5),
('2025-10-03', 9, 6),
('2025-10-04', 8, 7),
('2025-10-04', 7, 8),
('2025-10-05', 8, 9),
('2025-10-05', 8, 10);

INSERT INTO pensja (rodzaj, kwota) VALUES
('Podstawowa', 5200.00),
('Godzinowa', 35.00),
('Premia miesięczna', 800.00),
('Akordowa', 40.00),
('Zarząd', 12000.00),
('Kierownicza', 8500.00),
('Specjalista', 7200.00),
('Asystent', 4000.00),
('Techniczna', 5500.00),
('Praktykant', 2800.00);

INSERT INTO premia (nazwa, kwota) VALUES
('Premia uznaniowa', 500.00),
('Premia świąteczna', 1000.00),
('Premia kwartalna', 1500.00),
('Premia roczna', 2000.00),
('Premia za frekwencję', 400.00),
('Premia sprzedażowa', 1200.00),
('Premia motywacyjna', 700.00),
('Premia za projekt', 900.00),
('Premia jubileuszowa', 2500.00),
('Premia stażowa', 600.00);

INSERT INTO wynagrodzenie (data, id_pracownika, id_godziny, id_pensji, id_premii) VALUES
('2025-10-05', 1, 1, 1, 1),
('2025-10-05', 2, 2, 2, 2),
('2025-10-05', 3, 3, 3, 3),
('2025-10-05', 4, 4, 4, 4),
('2025-10-05', 5, 5, 5, 5),
('2025-10-05', 6, 6, 6, 6),
('2025-10-05', 7, 7, 7, 7),
('2025-10-05', 8, 8, 8, 8),
('2025-10-05', 9, 9, 9, 9),
('2025-10-05', 10, 10, 10, 10);
