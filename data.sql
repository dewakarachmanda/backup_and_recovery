CREATE TABLE IF NOT EXISTS tbsatuan(
	KodeSatuan VARCHAR(2) NOT NULL,
	NamaSatuan VARCHAR(40),
	PRIMARY KEY (KodeSatuan)
);

CREATE TABLE IF NOT EXISTS tbmerk(
	KodeMerk VARCHAR(2) NOT NULL,
	NamaMerk VARCHAR(40),
	PRIMARY KEY (KodeMerk)
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
	KodeKonsumen VARCHAR(4) NOT NULL,
	NamaKonsumen VARCHAR(40),
	AlamatKonsumen VARCHAR(100),
	kotaKonsumen VARCHAR(20),
	telpKonsumen VARCHAR(25),
	PRIMARY KEY (KodeKonsumen)
);


CREATE TABLE IF NOT EXISTS tbjualmaster(
	FakturJual VARCHAR(4) NOT NULL,
	TanggalJual date,
	KodeKonsumen VARCHAR(4) NOT NULL,
	subtotal double,
	diskon double,
	PRIMARY KEY (FakturJual),
	FOREIGN KEY (KodeKonsumen) REFERENCES tbkonsumen(KodeKonsumen)
);

CREATE TABLE IF NOT EXISTS tbbelimaster(
	FakturBeli VARCHAR(4) NOT NULL,
	tanggalbeli date,
	KodeSupplier VARCHAR(4) NOT NULL,
	subtotal double,
	PRIMARY KEY (FakturBeli),
	FOREIGN KEY (KodeSupplier) REFERENCES tbsupplier(KodeSupplier)
);

CREATE TABLE IF NOT EXISTS tbbarang(
	KodeBarang VARCHAR(5) NOT NULL,
	KodeJenis VARCHAR(2) NOT NULL,
	KodeMerk VARCHAR(2) NOT NULL,
	NamaBarang VARCHAR(70),
	KodeSatuan VARCHAR(2),
	HargaJual double,
	HargaBeli double,
	Banyak int,
	KodeSupplier VARCHAR(4) NOT NULL,
	PRIMARY KEY (KodeBarang),
	FOREIGN KEY (KodeJenis) REFERENCES tbjenis(KodeJenis),
	FOREIGN KEY (KodeMerk) REFERENCES tbmerk(KodeMerk),
	FOREIGN KEY (KodeSupplier)REFERENCES tbsupplier(KodeSupplier)
);

CREATE TABLE IF NOT EXISTS tbbelidetail(
	FakturBeli VARCHAR(6) NOT NULL,
	KodeBarang VARCHAR(5) NOT NULL,
	banyakbeli int,
	hargabeli double,
	FOREIGN KEY (FakturBeli) REFERENCES tbbelimaster(FakturBeli),
	FOREIGN KEY (KodeBarang) REFERENCES tbbarang(KodeBarang)
);


CREATE TABLE IF NOT EXISTS tbjualdetail(
	FakturJual VARCHAR(6) NOT NULL,
	KodeBarang VARCHAR(5) NOT NULL,
	BanyakJual int,
	HargaJual double,
	FOREIGN KEY (FakturJual) REFERENCES tbjualmaster(FakturJual),
	FOREIGN KEY (KodeBarang) REFERENCES tbbarang(KodeBarang)
);
