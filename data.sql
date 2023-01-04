--from tubes

CREATE DATABASE IF NOT EXISTS life_cycle;

use life_cycle;

CREATE TABLE IF NOT EXISTS tbsatuan(
	KodeSatuan VARCHAR(2) NOT NULL,
	NamaSatuan VARCHAR(40),
	PRIMARY KEY (KodeSatuan)
);

CREATE TABLE IF NOT EXISTS tbjenis(
	KodeJenis VARCHAR(2) NOT NULL,
	NamaJenis VARCHAR(40),
	PRIMARY KEY (KodeJenis)
);

CREATE TABLE IF NOT EXISTS tbsupplier(
	KodeSupplier VARCHAR(4) NOT NULL,
	NamaSupplier VARCHAR(60),
	AlamatSupplier VARCHAR(100),
	KotaSupplier VARCHAR(20),
	TelpSupplier VARCHAR(25),
	FaxSupplier VARCHAR(25),
	PRIMARY KEY (KodeSupplier)
);

CREATE TABLE IF NOT EXISTS tbkonsumen(
	KodeJenis VARCHAR(2) NOT NULL,
	NamaJenis VARCHAR(40),
	PRIMARY KEY (KodeJenis)
);

