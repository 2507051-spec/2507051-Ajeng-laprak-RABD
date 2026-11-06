CREATE DATABASE praktikum_produk;

use praktikum_produk;

CREATE TABLE `produk` (
  `ID_Produk` char(3) NOT NULL PRIMARY KEY,
  `Nama_Produk` varchar(50) DEFAULT NULL,
  `Kategori` varchar(30) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  `Harga` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `produk` (`ID_Produk`, `Nama_Produk`, `Kategori`, `Stok`, `Harga`) VALUES
('P01', 'Laptop', 'Elektronik', 10, '7500000.00'),
('P02', 'Mouse', 'Aksesori', 25, '150000.00'),
('P03', 'Keyboard', 'Aksesori', 20, '250000.00'),
('P04', 'Printer', 'Elektronik', 8, '1800000.00'),
('P05', 'Speaker', 'Audio', 15, '350000.00'),
('P06', 'Monitor', 'Elektronik', 12, '2200000.00'),
('P07', 'Webcam', 'Aksesori', 18, '400000.00');

select * from produk;

DELIMITER // 
CREATE PROCEDURE sp1() 
BEGIN 
	select * from produk;
end//
DELIMITER ;

call sp1();
 
DELIMITER //
CREATE PROCEDURE sp2( 
ID_Produk CHAR(3), 
Nama_Produk VARCHAR(50), 
Kategori VARCHAR(30), 
Stok INT, 
Harga DECIMAL(12,2) 
)
begin
	INSERT INTO Produk
(ID_Produk, Nama_Produk, Kategori, Stok, Harga)

VALUES 
(ID_Produk, Nama_Produk, Kategori, Stok, Harga); 

select * from produk;

end//

DELIMITER ;

show procedure status  where db = 'praktikum_produk';

call sp2('P08', 'Tablet', 'Elektronik', 14, 3200000);

DELIMITER //

CREATE PROCEDURE sp3(
    p_id VARCHAR(50),
    p_hargalama DECIMAL(12,2),
    p_hargabaru DECIMAL(12,2)
)
BEGIN
    
    UPDATE Produk
    SET Harga = p_hargabaru
    WHERE ID_Produk = p_id COLLATE utf8mb4_general_ci AND Harga = p_hargalama;

    
    SELECT Nama_Produk, Harga
    FROM Produk
    WHERE ID_Produk = p_id COLLATE utf8mb4_general_ci;
end//

DELIMITER ;

call sp3('P01', 7500000.00, 12500.00);
