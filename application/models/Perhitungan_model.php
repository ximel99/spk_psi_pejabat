<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Perhitungan_model extends CI_Model {

        public function tampil()
        {
            $query = $this->db->get('penilaian');
            return $query->result();
        }
       
        public function get_kriteria()
        {
            $query = $this->db->get('kriteria');
            return $query->result();
        }
		
        public function get_alternatif()
        {
            $query = $this->db->get('alternatif');
            return $query->result();
        }
		
        public function get_sub_kriteria()
        {
            $query = $this->db->get('sub_kriteria');
            return $query->result();
        }
		
		public function get_hasil()
        {
			$query = $this->db->query("SELECT * FROM hasil ORDER BY nilai DESC;");
            return $query->result();
        }

        public function data_penilaian($id_alternatif,$id_kriteria)
        {
            $query = $this->db->query("SELECT * FROM penilaian WHERE id_alternatif='$id_alternatif' AND id_kriteria='$id_kriteria';");
            return $query->row_array();
        }
		
		public function data_sub_kriteria($id_kriteria)
		{
			$query = $this->db->query("SELECT * FROM sub_kriteria WHERE id_kriteria='$id_kriteria' ORDER BY nilai DESC;");
			return $query->result_array();
		}
		
		public function data_nilai($id_alternatif,$id_kriteria)
		{
			$query = $this->db->query("SELECT * FROM penilaian JOIN sub_kriteria WHERE penilaian.nilai=sub_kriteria.id_sub_kriteria AND penilaian.id_alternatif='$id_alternatif' AND penilaian.id_kriteria='$id_kriteria';");
			return $query->row_array();
		}
		
		//mengambil nilai dari penilaian untuk dihitung
		//1. mengambil nilai masing" kriteria untuk dicari nilai min dan max
		
		public function get_nilai($id_kriteria)
		{
			$query = $this->db->query("SELECT sub_kriteria.nilai FROM `penilaian` JOIN sub_kriteria ON penilaian.nilai=sub_kriteria.id_sub_kriteria WHERE penilaian.id_kriteria='$id_kriteria';");
			return $query->result_array();
		}
		
		public function get_jenis($id_kriteria)
		{
			$query = $this->db->query("SELECT kriteria.jenis FROM `penilaian` JOIN kriteria ON penilaian.id_kriteria=kriteria.id_kriteria WHERE penilaian.id_kriteria='$id_kriteria';");
			return $query->result_array();
		}
		
		public function get_jenis_nilai($id_alternatif,$id_kriteria)
		{
			$query = $this->db->query("SELECT sub_kriteria.nilai,kriteria.jenis FROM `penilaian` 
			JOIN sub_kriteria ON penilaian.nilai=sub_kriteria.id_sub_kriteria
			JOIN kriteria ON penilaian.id_kriteria=kriteria.id_kriteria
			WHERE penilaian.id_alternatif='$id_alternatif'  AND penilaian.id_kriteria='$id_kriteria';");
			return $query->row_array();
		}

		public function get_max_min($id_kriteria)
		{
			$query = $this->db->query("SELECT max(sub_kriteria.nilai) as max, min(sub_kriteria.nilai) as min, sub_kriteria.nilai as nilai, 
			kriteria.jenis FROM `penilaian` 
			JOIN sub_kriteria ON penilaian.nilai=sub_kriteria.id_sub_kriteria 
			JOIN kriteria ON penilaian.id_kriteria=kriteria.id_kriteria 
			WHERE penilaian.id_kriteria='$id_kriteria';");
			return $query->row_array();
		}
		
		public function get_hasil_alternatif($id_alternatif)
		{
			$query = $this->db->query("SELECT * FROM alternatif WHERE id_alternatif='$id_alternatif';");
			return $query->row_array();		
		}
		
		public function insert_nilai_normalisasi($normalisasi = [])
        {
            $result = $this->db->insert('normalisasi', $normalisasi);
            return $result;
        }
		
		public function hapus_normalisasi()
        {
            $query = $this->db->query("TRUNCATE TABLE normalisasi;");
			return $query;
        }
		
		public function get_total_normalisasi($id_kriteria)
		{
			$query = $this->db->query("SELECT SUM(nilai) as total_nilai FROM normalisasi WHERE id_kriteria='$id_kriteria';");
			return $query->row_array();
		}
		
		public function insert_nilai_preferensi($preferensi = [])
        {
            $result = $this->db->insert('preferensi', $preferensi);
            return $result;
        }
		
		public function hapus_preferensi()
        {
            $query = $this->db->query("TRUNCATE TABLE preferensi;");
			return $query;
        }
		
		public function get_total_preferensi($id_kriteria)
		{
			$query = $this->db->query("SELECT SUM(nilai) as total_nilai FROM preferensi WHERE id_kriteria='$id_kriteria';");
			return $query->row_array();
		}
		
		public function insert_nilai_bobot($bobot = [])
        {
            $result = $this->db->insert('bobot', $bobot);
            return $result;
        }
		
		public function hapus_bobot()
        {
            $query = $this->db->query("TRUNCATE TABLE bobot;");
			return $query;
        }
		
		public function get_bobot($id_kriteria)
		{
			$query = $this->db->query("SELECT nilai FROM bobot WHERE id_kriteria='$id_kriteria';");
			return $query->row_array();
		}
		
		public function insert_nilai_hasil($hasil = [])
        {
            $result = $this->db->insert('hasil', $hasil);
            return $result;
        }
		
		public function hapus_hasil()
        {
            $query = $this->db->query("TRUNCATE TABLE hasil;");
			return $query;
        }
		
		public function get_alternatif_row()
        {
            $query = $this->db->get('alternatif');
            return $query->num_rows();
        }
    }
    