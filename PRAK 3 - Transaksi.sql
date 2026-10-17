create database praktikum_transaksi;
use praktikum_transaksi;

create table rekening (
id int primary key,
nama varchar(50) not null,
saldo decimal(12,2) not null,
constraint chk_saldo_nonnegatif check (saldo >= 0)
)ENGINE=InnoDB; 

INSERT INTO rekening (id, nama, saldo) VALUES 
(1, 'Budi', 500000.00),
(2, 'Siti', 250000.00); 

select * from rekening;

-- Script 1: transaksi dengan commit

START TRANSACTION; 

UPDATE rekening SET saldo = saldo - 100000 
WHERE id = 1; 

UPDATE rekening SET saldo = saldo + 100000
WHERE id = 2; 

select * from rekening;

COMMIT; 

-- Script 2: membatalkan transaksi dengan rollback

select * from rekening;

START TRANSACTION; 

UPDATE rekening 
SET saldo = saldo - 50000
WHERE id = 2; 

select * from rekening;

rollback;

select * from rekening;

-- Script 3: savepoint untuk pembatalan sebagian

START TRANSACTION; 

UPDATE rekening 
SET saldo = saldo - 50000
WHERE id = 1; 

UPDATE rekening 
SET saldo = saldo + 50000
WHERE id = 2; 

savepoint setelah_transfer;

UPDATE rekening 
SET saldo = saldo - 10000
WHERE id = 1; 

rollback to savepoint setelah_transfer;

commit;

select * from rekening;

-- script 4: lepaskan savepoint dengan release savepoint

start transaction;

update rekening 
set saldo = saldo - 10000
where id = 1;

savepoint sp_pemeriksaan;

update rekening 
set saldo = saldo + 10000
where id = 2;

release savepoint sp_pemeriksaan;

commit;

select * from rekening;

-- script 5: savepoint bertingkat dan skenario pemulihan 

start transaction;

-- operasi awal

update rekening set saldo = saldo - 20000 where id = 1;
savepoint sp_awal;

-- operasi tahap dua
update rekening set saldo = saldo + 20000 where id = 2;
savepoint sp_kedua;

-- operasi tambahan
update rekening set saldo = saldo - 5000 where id = 2;
where id = 1;

-- batalkan hanya operasi setelah sp_kedua 
rollback to savepoint sp_kedua;

-- hapus penanda yang tidak diperlukan release savepoint sp_kedua;

commit;

select * from rekening;
