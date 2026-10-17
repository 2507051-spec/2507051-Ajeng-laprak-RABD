select current_user();
update nilai_akademik
set nilai_akhir = 90.00
where id_nilai =3;

select * from nilai_akademik;

insert into nilai_akademik 
(id_nilai, nim, kode_mk, nilai_tugas, nilai_uts, nilai_uas, nilai_akhir)
values ('5', '2024002', 'IF102', '80.00', '82.00', '85.00', '83.00');

select * from nilai_akademik;

