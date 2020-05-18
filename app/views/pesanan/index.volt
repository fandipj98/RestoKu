{% extends "layouts/base.volt" %}

{% block content %}
    <!--================ Start banner Area =================-->
	<section class="banner-area relative">
		<div class="container">
			<div class="row height align-items-center justify-content-center">
				<div class="banner-content col-lg-5">
					<h1>Pesanan</h1>
					<hr>
					<div class="breadcrmb">
						<p>
							<a href="{{ url("/") }}">Home</a>
							<span class="lnr lnr-arrow-right"></span>
							<a href="{{ url("pesanan") }}">Pesanan</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!--================ End banner Area =================-->
    {% if flag == 1 %}
    <div class="section-top-border">
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
                    <div class="visit">ID</div>
                    <div class="visit">Email User</div>
                    <div class="visit">Rincian Harga</div>
					<div class="visit">Alamat Pengantaran</div>
					<div class="visit">Keterangan Tambahan</div>
					<div class="visit">Status Pembayaran</div>
					<div class="visit">Status Pengiriman</div>
					<div class="visit">Bukti Bayar</div>
					{% if session.get('auth')['status'] == 0 %}
                        <div class="visit"></div>
					{% endif %}
				</div>
				{% for pesanan in pesanans %}
				<div class="table-row">
                    <div class="visit">{{ pesanan.id_pesanan }}</div>
                    <div class="visit">{{ pesanan.users.email }}</div>
                    <div class="visit">Harga Subtotal: Rp. {{ pesanan.harga_subtotal }}
						<div>Ongkos Kirim: Rp. {{ pesanan.ongkos_kirim }}</div>
						<div>Harga Total: Rp. {{ pesanan.harga_total }}</div>
					</div>
                    
                    <div class="visit">{{ pesanan.alamat_kirim }}</div>
                    <div class="visit">{{ pesanan.keterangan }}</div>
					{#<div class="visit"><img src="{{ pesanan.bukti_bayar }}" alt="flag" width="100" height="100"></div>#}
					
					<div class="visit">
                        {% if pesanan.sudah_dibayar == 1 %}
                            Lunas
                        {% else %}
                            Belum Lunas
                        {% endif %}
                    </div>
                    <div class="visit">
                        {% if pesanan.status_pengiriman == 1 %}
                            Sudah Sampai Tujuan
                        {% else %}
                            Sedang Diproses
                        {% endif %}
                    </div>
					<div class="visit">
					<div class="btn btn-primary"  data-toggle="modal" data-target="#imgModal{{ pesanan.id_pesanan }}">
						Bukti Bayar
					</div>
					<!-- Modal -->
					
					<div class="modal fade" id="imgModal{{ pesanan.id_pesanan }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Bukti Bayar {{ pesanan.id_pesanan }}</h5>
							<button type="btn btn-primary" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<img src={{ url(pesanan.bukti_bayar)}} width="400px">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
						</div>
					</div>
					</div>
					</div>
					{% if session.get('auth')['status'] == 0 %}
                        <div class="visit">
							{% if pesanan.sudah_dibayar == 0 %}
								<form method="POST" action="{{ url("pesanan/validasi") }}">
									<input name="id_pesanan" value="{{ pesanan.id_pesanan }}" hidden>
									<button type="submit" class="primary-btn">Validasi</button>
								</form>
							{% else %}
								<div class="btn btn-success disabled">
									Terverifikasi
								</div>
							{% endif %}
						</div>
					{% endif %}
				</div>
				{% endfor %}
			</div>
		</div>
	</div>

	{% else %}

	<!-- Start pesanan kosong -->
	<section class="sample-text-area">
		<div class="container text-center">
			<h1 class="text-heading">Wah, kamu belum melakukan pesanan</h1>
			<p class="sample-text fz-18">
				<b>
					Daripada dilihatin aja, ayo buruan pesan makanan sekarang!
				</b>
			</p>
		</div>
	</section>
	<!-- End pesanan kosong -->

	{% endif %}

{% endblock %}