<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Perhitungan extends CI_Controller {
    
        public function __construct()
        {
            parent::__construct();
            $this->load->library('pagination');
            $this->load->library('form_validation');
            $this->load->model('Perhitungan_model');
        }

        public function index()
        {
			if ($this->session->userdata('id_user_level') != "1") {
            ?>
				<script type="text/javascript">
                    alert('Anda tidak berhak mengakses halaman ini!');
                    window.location='<?php echo base_url("Login/home"); ?>'
                </script>
            <?php
			}
			
			$this->Perhitungan_model->hapus_normalisasi();
			$this->Perhitungan_model->hapus_preferensi();
			$this->Perhitungan_model->hapus_bobot();
			$this->Perhitungan_model->hapus_hasil();
			
			$kriteria = $this->Perhitungan_model->get_kriteria();
            $alternatif = $this->Perhitungan_model->get_alternatif();
			
			// Insert Nilai Normalisasi
			foreach ($alternatif as $keys){
				$p = array();
				foreach ($kriteria as $key){
					$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
					$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
					if($min_max['jenis']=='Benefit'){
						$p= round($data_pencocokan['nilai']/$min_max['max'],2);
					}else{
						$p= round($min_max['min']/$data_pencocokan['nilai'],2);
					}
					$normalisasi = [
						'id_kriteria' => $key->id_kriteria,
						'nilai' => $p
					];
					$this->Perhitungan_model->insert_nilai_normalisasi($normalisasi);
				}						
			}
			
			// Insert Nilai Preferensi
			foreach ($alternatif as $keys){
				foreach ($kriteria as $key){
					$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
					$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
					
					$alternatif_row = $this->Perhitungan_model->get_alternatif_row();
					$total_normalisasi=$this->Perhitungan_model->get_total_normalisasi($key->id_kriteria);
					$mean = (1/$alternatif_row)*$total_normalisasi['total_nilai'];
					
					if($min_max['jenis']=='Benefit'){
						$p= round($data_pencocokan['nilai']/$min_max['max'],2);
					}else{
						$p= round($min_max['min']/$data_pencocokan['nilai'],2);
					}
					$n_preferensi=pow(($p-$mean),2);
							
					$preferensi = [
						'id_kriteria' => $key->id_kriteria,
						'nilai' => $n_preferensi
					];
					$this->Perhitungan_model->insert_nilai_preferensi($preferensi);
				}						
			}
			
			// Insert Nilai Bobot Kriteria
			$t_preferensi = 0;
			foreach ($kriteria as $key){
				$total_preferensi=$this->Perhitungan_model->get_total_preferensi($key->id_kriteria);
				$d_preferensi = 1-$total_preferensi['total_nilai'];
				$t_preferensi += $d_preferensi;
			}
			$tot_preferensi = $t_preferensi;
			
			foreach ($kriteria as $key){
				$total_preferensi=$this->Perhitungan_model->get_total_preferensi($key->id_kriteria);
				$d_preferensi = 1-$total_preferensi['total_nilai'];
				$n_bobot = round($d_preferensi/$tot_preferensi,4);
				$bobot = [
					'id_kriteria' => $key->id_kriteria,
					'nilai' => $n_bobot
				];
				$this->Perhitungan_model->insert_nilai_bobot($bobot);
			}
			
			// Insert Nilai Hasil
			foreach ($alternatif as $keys){
				$total_nilai = 0;
				foreach ($kriteria as $key){
					$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
					$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
					$bobot=$this->Perhitungan_model->get_bobot($key->id_kriteria);
					if($min_max['jenis']=='Benefit'){
						$p= round(($data_pencocokan['nilai']/$min_max['max'])*$bobot['nilai'],4);
					}else{
						$p= round(($min_max['min']/$data_pencocokan['nilai'])*$bobot['nilai'],4);
					}
					$total_nilai += $p;
				}
				$hasil = [
					'id_alternatif' => $keys->id_alternatif,
					'nilai' => $total_nilai
				];
				$this->Perhitungan_model->insert_nilai_hasil($hasil);
			}
			
			$data = [
                'page' => "Perhitungan",
				'list' => $this->Perhitungan_model->tampil(),
                'kriteria'=> $this->Perhitungan_model->get_kriteria(),
                'alternatif'=> $this->Perhitungan_model->get_alternatif(),
                'sub_kriteria'=> $this->Perhitungan_model->get_sub_kriteria(),
                'perhitungan' => $this->Perhitungan_model->tampil()
            ];
			
            $this->load->view('Perhitungan/perhitungan', $data);
        }
		
		public function hasil()
        {
			$data = [
                'page' => "Hasil",
				'hasil'=> $this->Perhitungan_model->get_hasil()
            ];
			
            $this->load->view('Perhitungan/hasil', $data);
        }
    
    }
    
    