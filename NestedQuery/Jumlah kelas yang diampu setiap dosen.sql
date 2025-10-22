SELECT l.lecturer_id, l.first_name, l.last_name,
       (SELECT COUNT(*) FROM class c WHERE c.lecturer_id = l.lecturer_id) AS jumlah_kelas
FROM lecturer l;
