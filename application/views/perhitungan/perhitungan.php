<?php $this->load->view('layouts/header_admin'); ?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-calculator"></i> Data Perhitungan</h1>
	
	<a href="<?= base_url('Laporan/cetak_laporan_perhitungan'); ?>" class="btn btn-primary"> <i class="fa fa-print"></i> Cetak Data </a>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Rating Kecocokan Setiap Alternatif Pada Kriteria</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<th width="5%">No</th>
						<th>Alternatif</th>
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<?php 
						$no=1;
						foreach ($alternatif as $keys): ?>
					<tr align="center">
						<td><?= $no; ?></td>
						<td align="left"><?= $keys->nama ?></td>
						<?php foreach ($kriteria as $key): ?>
						<td>
						<?php 
							$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
							echo $data_pencocokan['nilai'];
						?>
						</td>
						<?php endforeach ?>
					</tr>
					<?php
						$no++;
						endforeach
					?>
					<tr align="center">
						<th colspan="2">Nilai Max</th>
						<?php foreach ($kriteria as $key): ?>
						<th>
						<?php 
							$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
							echo $min_max['max'];
						?>
						</th>
						<?php endforeach ?>
					</tr>
					<tr align="center">
						<th colspan="2">Nilai Min</th>
						<?php foreach ($kriteria as $key): ?>
						<th>
						<?php 
							$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
							echo $min_max['min'];
						?>
						</th>
						<?php endforeach ?>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Normalisasi X</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<th width="5%">No</th>
						<th>Alternatif</th>
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<?php
						$no=1;
						foreach ($alternatif as $keys): ?>
					<tr align="center">
						<td><?= $no; ?></td>
						<td align="left"><?= $keys->nama ?></td>
						<?php foreach ($kriteria as $key){ ?>
						<td>
						<?php 
							$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
							$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
							if($min_max['jenis']=='Benefit'){
								echo $p= round($data_pencocokan['nilai']/$min_max['max'],2);
							}else{
								echo $p= round($min_max['min']/$data_pencocokan['nilai'],2);
							}
						?>
						</td>
						<?php } ?>
					</tr>
					<?php
						$no++;
						endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Total Nilai Normalisasi X</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<?php 
						foreach ($kriteria as $key){ ?>
						<td>
						<?php 
							$total_normalisasi=$this->Perhitungan_model->get_total_normalisasi($key->id_kriteria);
							echo $total_normalisasi['total_nilai'];
						?>
						</td>
						<?php
						}
						?>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Nilai Mean</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<?php 
						foreach ($kriteria as $key){ ?>
						<td>
						<?php 
							$alternatif_row = $this->Perhitungan_model->get_alternatif_row();
							$total_normalisasi=$this->Perhitungan_model->get_total_normalisasi($key->id_kriteria);
							$mean = (1/$alternatif_row)*$total_normalisasi['total_nilai'];
							echo $mean;
						?>
						</td>
						<?php
						}
						?>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Nilai Variasi Preferensi</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<th width="5%">No</th>
						<th>Alternatif</th>
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<?php
						$no=1;
						foreach ($alternatif as $keys): ?>
					<tr align="center">
						<td><?= $no; ?></td>
						<td align="left"><?= $keys->nama ?></td>
						<?php foreach ($kriteria as $key){ ?>
						<td>
						<?php 
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
							echo pow(($p-$mean),2);
						?>
						</td>
						<?php } ?>
					</tr>
					<?php
						$no++;
						endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Total Nilai Variasi Preferensi</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<?php 
						foreach ($kriteria as $key){ ?>
						<td>
						<?php 
							$total_preferensi=$this->Perhitungan_model->get_total_preferensi($key->id_kriteria);
							echo $total_preferensi['total_nilai'];
						?>
						</td>
						<?php
						}
						?>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Nilai Dalam Preferensi</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<?php 
						$t_preferensi=0;
						foreach ($kriteria as $key){ ?>
						<td>
						<?php 
							$total_preferensi=$this->Perhitungan_model->get_total_preferensi($key->id_kriteria);
							$d_preferensi = 1-$total_preferensi['total_nilai'];
							echo $d_preferensi;
							$t_preferensi += $d_preferensi;
						?>
						</td>
						<?php
						}
						?>
						<td><?php echo $t_preferensi; ?></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Nilai Bobot Kriteria</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<?php 
						foreach ($kriteria as $key){ ?>
						<td>
						<?php 
							$total_preferensi=$this->Perhitungan_model->get_total_preferensi($key->id_kriteria);
							$d_preferensi = 1-$total_preferensi['total_nilai'];
							echo round($d_preferensi/$t_preferensi,4);
						?>
						</td>
						<?php
						}
						?>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-warning"><i class="fa fa-table"></i> Perkalian Matrik &#216;</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-white">
					<tr align="center">
						<th width="5%">No</th>
						<th>Alternatif</th>
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
						<th>Total Nilai</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$no=1;
						foreach ($alternatif as $keys): ?>
					<tr align="center">
						<td><?= $no; ?></td>
						<td align="left"><?= $keys->nama ?></td>
						<?php 
						$total_nilai = 0;
						foreach ($kriteria as $key){ ?>
						<td>
						<?php 
							$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
							$min_max=$this->Perhitungan_model->get_max_min($key->id_kriteria);
							$bobot=$this->Perhitungan_model->get_bobot($key->id_kriteria);
							if($min_max['jenis']=='Benefit'){
								echo $p= round(($data_pencocokan['nilai']/$min_max['max'])*$bobot['nilai'],4);
							}else{
								echo $p= round(($min_max['min']/$data_pencocokan['nilai'])*$bobot['nilai'],4);
							}
							$total_nilai += $p;
						?>
						</td>
						<?php } ?>
						<td><?= $total_nilai;?></td>
					</tr>
					<?php
						$no++;
						endforeach ?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<?php
$this->load->view('layouts/footer_admin');
?>