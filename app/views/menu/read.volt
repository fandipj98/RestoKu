{% extends "layouts/base.volt" %}

{% block content %}
<section class="py-2">
    <div class="container">

    {% if  menus|length  > 0 %}

        {% for menu in menus %}

            <div class="row mb-8 py-2">
                <div class="col-md-12">
                    <div class="card shadow py-2">
                        <div class="card-body py-2">
                            <div class="row text-center ">
                                <div class="col-md-2 mr-2">
                                    <img src="{{ url(menu.foto_menu) }}" width="150" height="150">
                                </div>
                                <div class="col-md-6 mr-3">
                                    <form>
                                        <div class="form-group col-md-12 d-flex">
                                            <label class="col-md-6 text-left">Nama</label> : {{menu.nama_menu}}
                                        </div>
                                        <div class="form-group col-md-12 d-flex">
                                            <label class="col-md-6 text-left">Harga</label> : {{menu.harga_menu}}
                                        </div>
                                        <div class="form-group col-md-12 d-flex">
                                            <label class="col-md-6 text-left">Tersedia</label> : {{menu.tersedia}}
                                        </div>
                                        <div class="form-group col-md-12 d-flex">
                                            <label class="col-md-6 text-left">Jenis makanan</label> : {{menu.jenis_menu}}
                                        </div>
                                    </form>
                                </div>
                                <div class="ml-5 col-md-3">
                                <a class="py-2" href={{ url("menu/delete/" ~  menu.id_menu) }}>
                                    <div class="btn btn-lg btn-danger py-2">
                                        Hapus
                                    </div>
                                </a>    
                                <a class="py-2" href={{ url("menu/update/" ~  menu.id_menu) }}>
                                    <div class="btn btn-lg btn-danger py-2">
                                        Update
                                    </div>
                                </a>                                 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        {% endfor %}

    {% else %}
        <div class="text-md-centre"> 
            Tidak ada transaksi reservasi
        </div> 
    {% endif %}
    </div>
</section>
{% endblock %}