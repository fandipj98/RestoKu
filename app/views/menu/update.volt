{% extends "layouts/base.volt" %}

{% block content %}
<section class="home-banner-area relative">
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100 p-l-50 p-r-50 p-t-40 p-b-40">
                <form method="POST" action="{{ url("/menu/change") }}" class="login100-form validate-form flex-sb flex-w" enctype="multipart/form-data">
                    <span class="login100-form-title p-b-5">
                        Update Menu
                    <div class="fz-18 alert-danger">{{flashSession.output()}}</div>
                    <div class="fz-18">{{flash.output()}}</div>
                    </span>
                
                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Nama Menu
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Nama menu is required">
                    <input class="input100" type="text" name="nama" value={{ menu.nama_menu }}>
                    <span class="focus-input100"></span>
                </div>

                <input class="input100" type="hidden" name="id" value={{ menu.id_menu }}>
                
                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Harga
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Harga is required">
                    <input class="input100" type="text" name="harga" value={{ menu.harga_menu }}>
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Jenis
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Jenis is required">
                    <input class="input100" type="text" name="jenis" value={{ menu.jenis_menu }}>
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Jumlah persediaan
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Jumlah ketersediaan is required">
                    <input class="input100" type="text" name="tersedia" value={{ menu.tersedia }}>
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Deskripsi
                    </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Deskripsi is required">
                    <input class="input100" type="text" name="deskripsi" value={{ menu.deskripsi_menu }}>
                    <span class="focus-input100"></span>
                </div>

                <div class="p-t-10 p-b-7">
                    <span class="txt1">
                        Sertakan gambar
                    </span>
                </div>
                <div>
                    <input class="input100" type="file" name="file">
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn m-t-30">
                    <button class="login100-form-btn">
                        Update
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</section>
{% endblock %}