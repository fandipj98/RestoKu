CREATE DATABASE restoku;

CREATE TABLE Users (
	id_user int IDENTITY,
	email varchar(100) NOT NULL,
	firstName varchar(100) NOT NULL,
	lastName varchar(255),
	no_telp varchar(30) NOT NULL,
	pass varchar(255) NOT NULL,
	status tinyint NOT NULL,
	
	CONSTRAINT PK_Users PRIMARY KEY (id_user),
	CONSTRAINT UQ_Users UNIQUE (email)
);

CREATE TABLE Menu (
	id_menu int IDENTITY,
	nama_menu varchar(255) NOT NULL,
	jenis_menu varchar(255) NOT NULL,
	harga_menu int NOT NULL,
	tersedia int NOT NULL,
	deskripsi_menu text,
	foto_menu varchar(255),

	CONSTRAINT PK_Menu PRIMARY KEY (id_menu)
);

CREATE TABLE Keranjang (
	id_keranjang int IDENTITY,
	id_user int NOT NULL,
	id_menu int NOT NULL,
	jumlah_item int NOT NULL,
	harga_sementara int NOT NULL,
	status_keranjang tinyint NOT NULL,

	CONSTRAINT PK_Keranjang PRIMARY KEY (id_keranjang),
	CONSTRAINT FK_Keranjang_Users FOREIGN KEY (id_user) REFERENCES Users(id_user),
	CONSTRAINT FK_Keranjang_Menu FOREIGN KEY (id_menu) REFERENCES Menu(id_menu)
);

CREATE TABLE Pesanan (
	id_pesanan int IDENTITY,
	id_user int NOT NULL,
	harga_subtotal int NOT NULL,
	ongkos_kirim int NOT NULL,
	harga_total int NOT NULL,
	alamat_kirim varchar(255) NOT NULL,
	keterangan varchar(255),
	bukti_bayar varchar(255) NOT NULL,
	sudah_dibayar tinyint NOT NULL,
	status_pengiriman tinyint NOT NULL,

	CONSTRAINT PK_Pesanan PRIMARY KEY (id_pesanan),
	CONSTRAINT FK_Pesanan_Users FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

CREATE TABLE Meja(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    kapasitas INT NOT NULL,
    harga INT NOT NULL
);

CREATE TABLE Pemesanan(
    id int NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_user int NOT NULL,
    id_meja int NOT NULL,
    tanggal_pemesanan DATETIME NOT NULL,
    waktu_reservasi DATETIME NOT NULL,
    waktu_selesai DATETIME NOT NULL,
    biaya INT NOT NULL,
    lunas TINYINT NOT NULL,
    bukti_pembayaran VARCHAR(50) NOT NULL,

    CONSTRAINT FK_Pemesanan_Users FOREIGN KEY (id_user) REFERENCES Users(id_user),
    CONSTRAINT FK_Pemesanan_Meja FOREIGN KEY (id_meja) REFERENCES Meja(id),
);

INSERT INTO Menu (nama_menu, jenis_menu, harga_menu, tersedia, deskripsi_menu, foto_menu)
VALUES ('Salad', 'Appetizer', '15000', '2', 'Makanan pembuka yang terdiri dari campuran sayur-sayuran, buah-buahan, dan bahan-bahan makanan siap santap', 'img/menu/salad.jpg' );
INSERT INTO Menu (nama_menu, jenis_menu, harga_menu, tersedia, deskripsi_menu, foto_menu)
VALUES ('Nasi Goreng', 'Main Course', '25000', '10', 'Makanan utama berupa nasi yang digoreng dan diaduk dalam minyak goreng atau margarin, biasanya ditambah kecap manis, bawang merah, bawang putih, asam jawa, lada dan bumbu-bumbu lainnya, seperti telur, ayam, dan kerupuk.', 'img/menu/nasi-goreng.jpg' );
INSERT INTO Menu (nama_menu, jenis_menu, harga_menu, tersedia, deskripsi_menu, foto_menu)
VALUES ('Mie Goreng', 'Main Course', '24000', '3', 'Makanan utama yang populer dan digemari di Indonesia, Malaysia, dan Singapura. Mi goreng terbuat dari mi kuning yang digoreng dengan sedikit minyak goreng, dan ditambahkan bawang putih, bawang merah, udang serta daging ayam atau daging sapi, irisan bakso, cabai, sayuran, tomat, telur ayam, dan acar.', 'img/menu/mie-goreng.jpg' );
INSERT INTO Menu (nama_menu, jenis_menu, harga_menu, tersedia, deskripsi_menu, foto_menu)
VALUES ('Pisang Goreng', 'Dessert', '12000', '2', 'Makanan penutup yang banyak ditemukan di Indonesia, Singapura dan Malaysia. Makanan ini dibuat dari buah pisang, sesudah di kupas kulitnya dipotong-potong sesuai keinginan kemudian di lumuri bersama adonan kental terbuat dari campuran tepung, sedikit garam dan gula selanjutnya digoreng dalam minyak goreng.', 'img/menu/pisang-goreng.jpg' );
INSERT INTO Menu (nama_menu, jenis_menu, harga_menu, tersedia, deskripsi_menu, foto_menu)
VALUES ('Es Teh', 'Drink', '5000', '5', 'Minuman teh yang didinginkan dengan es batu. Es teh sering kali ditambahkan rasa seperti melati, dan buah-buahan seperti limun, ceri, dan arbei, atau susu.', 'img/menu/es-teh.jpg' );
INSERT INTO Menu (nama_menu, jenis_menu, harga_menu, tersedia, deskripsi_menu, foto_menu)
VALUES ('Es Jeruk', 'Drink', '10000', '5', 'Minuman sari buah yang diperoleh dengan memeras atau menekan isi buah jeruk. Diminum di banyak tempat di dunia.', 'img/menu/es-jeruk.jpg' );

INSERT INTO Users (email, firstName, lastName, no_telp, pass, status)
VALUES ('tes@gmail.com', 'Tes', 'Ting', '08123456789', '123', '0')

UPDATE Menu SET tersedia=2 WHERE id_menu=1;

DELETE FROM Users  WHERE id_user=9;

DELETE FROM Pesanan  WHERE id_pesanan=1; 

DROP TABLE Keranjang;
DROP TABLE Pesanan;
DROP TABLE Users;
DROP TABLE Menu;