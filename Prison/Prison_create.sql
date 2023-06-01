SET DATEFORMAT ymd;

CREATE TABLE Program_rehabilitacja(

    id_rehabilitacja INT IDENTITY(1,1) PRIMARY KEY,

    nazwa VARCHAR(50) NOT NULL,

    opis VARCHAR(100),

    czas_trwania INT

);

CREATE TABLE Program_pracowniczy(

    id_praca INT IDENTITY(1,1) PRIMARY KEY,

    nazwa VARCHAR(50),

    opis VARCHAR(100)

);

CREATE TABLE Wiezienie (

    id_placowka INT IDENTITY(1,1) PRIMARY KEY,

    nazwa VARCHAR(50),

    dyrektor VARCHAR(50)
);

CREATE TABLE Wiezien (

  id_wiezien INT IDENTITY(1,1) PRIMARY KEY,

  imie VARCHAR(255) NOT NULL,

  nazwisko VARCHAR(255) NOT NULL,

  data_urodzenia DATE NOT NULL,

  wiek_przyjecia INT check(wiek_przyjecia>18),

  narodowosc VARCHAR(255) NOT NULL,
 
  id_rehabilitacja INT, 
  FOREIGN KEY (id_rehabilitacja) REFERENCES Program_rehabilitacja(id_rehabilitacja),

  id_praca INT,
  FOREIGN KEY (id_praca) REFERENCES Program_pracowniczy(id_praca),

  id_placowka INT,
  FOREIGN KEY (id_placowka) REFERENCES Wiezienie(id_placowka),

);


CREATE TABLE Wizytacja (

  id_wizyta INT IDENTITY(1,1) PRIMARY KEY,

  data_godzina DATETIME NOT NULL,

  id_wiezien INT,
  FOREIGN KEY (id_wiezien) REFERENCES Wiezien(id_wiezien),

  powod_wizyta VARCHAR(255)

);

CREATE TABLE Wyrok (

    id_wyrok INT IDENTITY(1,1) PRIMARY KEY,

    data_wydania DATE,

    czas_trwania INT check(czas_trwania>0),

    popelnione_przestepstwo VARCHAR(100),

	id_wiezien INT,
    FOREIGN KEY (id_wiezien) REFERENCES Wiezien(id_wiezien)

);

CREATE TABLE Dziennik_bezpieczenstwa (

    id_incydent INT IDENTITY(1,1) PRIMARY KEY,

    data_godzina DATETIME,

    opis VARCHAR(100),

	id_wiezien INT,
    FOREIGN KEY (id_wiezien) REFERENCES Wiezien(id_wiezien)

);

CREATE TABLE Dokumentacja_medyczna (

    id_medyczne INT IDENTITY(1,1) PRIMARY KEY,

    stan_zdrowia VARCHAR(50),

    przepisane_leki VARCHAR(100),

    id_wiezien INT,
    FOREIGN KEY (id_wiezien) REFERENCES Wiezien(id_wiezien)

);

CREATE TABLE Adresy (

    id_adres INT IDENTITY(1,1) PRIMARY KEY,

    kraj VARCHAR(50),

    miasto VARCHAR(50),

    kod_pocztowy VARCHAR(10),

    ulica VARCHAR(50),

    numer_budynku INT,

    numer_mieszkania INT

);

CREATE TABLE Odwiedzajacy (

    id_odwiedzajacy INT IDENTITY(1,1) PRIMARY KEY,

    imię VARCHAR(255) NOT NULL,

    nazwisko VARCHAR(255) NOT NULL,

    relacja_z_wiezniem VARCHAR(50),

	id_adres INT, 
  	FOREIGN KEY (id_adres) REFERENCES Adresy(id_adres),

	id_wizyta INT, 
  	FOREIGN KEY (id_wizyta) REFERENCES Wizytacja(id_wizyta),

);
