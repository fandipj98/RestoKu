{% extends "layouts/base.volt" %}

{% block content %}

<div class="container text-white bg-dark">
    <h2>Tambah meja untuk reservasi</h2>
    <form action="/meja/save" method="post">
        <div class="form-group">
            <label for="kapasitas">Kapasitas:</label>
            <input type="number" class="form-control" id="kapasitas" placeholder="Masukkan kapasitas" name="kapasitas">
        </div>
        <div class="form-group">
            <label for="harga">Harga:</label>
            <input type="number" class="form-control" id="harga" placeholder="Masukkan harga reservasi setiap satu jam" name="harga">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{% endblock %}