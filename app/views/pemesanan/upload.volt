{% extends "layouts/base.volt" %}

{% block content %}

<form accept-charset="UTF-8" class="text-white bg-dark" action="/pemesanan/change" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <input type="hidden" name="id" class="form-control disabled text-white" id="id" value={{ pemesanan.id }}>
    </div>
    <div class="form-group">
        <label for="biaya" class="col-md-4 text-white">Biaya : {{pemesanan.biaya}}</label> 
    </div>
    <div class="form-group">
        <label for="biaya" class="col-md-4 text-white">Waktu Mulai : {{pemesanan.waktu_reservasi}}</label> 
    </div>
    <div class="form-group">
        <label for="biaya" class="col-md-4 text-white">Waktu Selesai : {{pemesanan.waktu_selesai}} </label> 
    </div>
    <hr>
    <div class="form-group col-md-5 mt-3">
        <label class="mr-2 text-white">Upload bukti pembayaran:</label><br>
        <input class="form-control"type="file" name="file" required><br>
        <small class="text-white">Only support jpg file</small>
    </div>
    <hr>
    <button type="submit" class="btn btn-primary text-white">Submit</button>
</form>

{% endblock %}