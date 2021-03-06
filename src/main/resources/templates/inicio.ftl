<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Practica 8</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Include Dexie -->
    <script src="https://unpkg.com/dexie@latest/dist/dexie.js"></script>
    <script>
        var db = new Dexie("registro_database");
        db.version(1).stores({
            registros: '++indicador,nombre,sector,nivel,ubicacion,lat,long,relevant'
        });

//        db.delete();
//        db.registros.each((record) => console.log(record + " " + record.nombre));

    </script>

    <!-- Theme CSS -->
    <link href="css/agency.min.css" rel="stylesheet">
    <link href="css/offline-language-english.css" rel="stylesheet">
    <link href="css/offline-theme-chrome-indicator.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="js/offline-min.js"></script>

    <script type="text/javascript" src="js/geolocator.js"></script>
    <script type="text/javascript">

        geolocator.config({
            language: "en",
            google: {
                version: "3",
                key: "AIzaSyBSPrMC0CkYzfZ0dxb7sH0bnxBd5E24WIY"
            }
        });

        window.onload = function () {
            var options = {
                enableHighAccuracy: true,
                timeout: 5000,
                maximumWait: 6000,     // max wait time for desired accuracy
                maximumAge: 0,          // disable cache
                desiredAccuracy: 30,    // meters
                fallbackToIP: true,     // fallback to IP if geolocation fails or rejected
                addressLookup: true,    // requires Google API key if true
                timezone: true,         // requires Google API key if true
                map: "map-canvas",      // interactive map element id (or options object)
                staticMap: true         // map image URL (boolean or options object)
            };
            geolocator.locate(options, function (err, location) {
                if (err) return console.log(err);

                console.log(location);
                console.log(location.coords.latitude);
                console.log(location.coords.longitude);

                $("#ubicacion").val(location.formattedAddress);
                $("#lat").val(location.coords.latitude);
                $("#long").val(location.coords.longitude);
            });
        };

        $(function(){

            var $online = $('.online');

            Offline.on('down', function () {
                $("#enviar").prop('disabled', true);
            });

            Offline.on('up', function () {
                $("#enviar").prop('disabled', false);
            });

        });

    </script>

</head>

<body id="page-top" class="index">

<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top">Inicio</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden">
                    <a href="#page-top"></a>
                </li>
                <li>
                    <a class="page-scroll" href="#services">Nuevo Registro</a>
                </li>
                <li>
                    <a class="page-scroll" href="#datos-locales">Registros locales</a>
                </li>
                <li>
                    <a class="page-scroll" href="/perfil">Registros Servidor</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<!-- Header -->
<div class="cabeza" style="background-image: url('../img/header-bg.jpg')">
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Practica 8</div>
                <div class="intro-heading">2012-0559</div>
                <div class="intro-heading">2013-0204</div>
                <a href="#services" class="page-scroll btn btn-xl">Registrar!</a>
            </div>
        </div>
    </header>
</div>

<!-- Services Section -->
<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Nuevo Registro</h2>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-3">

            </div>
            <div class="col-md-6">
                <form method="post" <#--action="/"-->>
                    <div class="form-group row">
                        <label for="example-search-input" class="col-2 col-form-label">Nombre</label>
                        <div class="col-10">
                            <input class="form-control" type="text" id="nombre" name="Nombre" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="example-email-input" class="col-2 col-form-label">Sector</label>
                        <div class="col-10">
                            <input class="form-control" type="text" id="sector" name="Sector" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="example-search-input" class="col-2 col-form-label">Nivel Escolar</label>
                        <div class="col-10">
                            <select name="Nivel" id="nivel" class="form-control">
                                <option>B&#225;sico</option>
                                <option>Medio</option>
                                <option>Universitario</option>
                                <option>Postgrado</option>
                                <option>Doctorado</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="example-url-input" class="col-2 col-form-label">Ubicaci&#243;n</label>
                        <div class="col-10">
                            <input class="form-control" type="text" id="ubicacion" name="ubicacion" readonly>
                            <input id="lat" hidden>
                            <input id="long" hidden>
                        </div>
                    </div>
                    <div class="form-group row">
                        <button type="button" id="registrar" class="btn btn-warning">Agregar!</button>
                    </div>

                    <script>
                        var conteo = 1;
                        $( window ).on( "load", function() {
                             conteo = 1;
//                            db.registros.clear();
                            db.registros.each(function (results) {
                                if(results.relevant) {
                                    var markup = "<tr><td>" + results.indicador + "</td><td>" + results.nombre + "</td><td>" + results.sector + "</td>" +
                                            "<td>" + results.nivel + "</td><td>" + results.ubicacion + "</td><td>" +
                                            '<button type="button" id="borrar" onclick = "borrarregistro(' + results.indicador + ')" class="btn btn-warning">Borrar!</button>'
                                            + "</td><td>" +
                                            '<button type="button" id="modificar" onclick = "modidificarRegistro(' + results.indicador + ')"  class="btn btn-warning">Modificar!</button>'
                                            + "</td></tr>";
                                    $("table tbody").append(markup);

                                }

                                conteo = results.indicador + 1;
                                alert(conteo);
                                alert(results.indicador);
                            });
                        });
                        
                        $("#registrar").click(function (e) {

                            if($("#nombre").val() != "" && $("#sector").val() != ""){
                                db.registros.add({
                                    nombre: $("#nombre").val(),
                                    sector: $("#sector").val(),
                                    nivel : $("#nivel").val(),
                                    ubicacion: $("#ubicacion").val(),
                                    lat: $("#lat").val(),
                                    long: $("#long").val(),
                                    relevant: true
                                });

                                var markup = "<tr><td>" + conteo + "</td><td>" +$("#nombre").val() + "</td><td>" + $("#sector").val()+ "</td>" +
                                        "<td>" + $("#nivel").val() + "</td><td>" + $("#ubicacion").val() + "</td><td>"  +
                                        '<button type="button" id="borrar" onclick = "borrarregistro('+ conteo +')" class="btn btn-warning">Borrar!</button>'
                                        + "</td><td>" +
                                        '<button type="button" id="modificar" onclick = "modidificarRegistro('+ conteo +')"  class="btn btn-warning">Modificar!</button>'
                                        + "</td></tr>";
                                $("table tbody").append(markup);
                                conteo++;
                                $("#nombre").val("");
                                $("#sector").val("");
                                $("#nivel").val("");
//                                location.reload();
                            }else {
                                alert("Todos los campos deben de estar completos")
                            }
                        });

                        function modidificarRegistro(id) {
                            console.log(id);
                            var nombre = prompt("Nombre:");
                            var sector = prompt("Sector:");
                            var nivel = prompt("Nivel: basico, medio, univer., postgrado, doctorado");

                            db.registros.update(id, {nombre: nombre, sector: sector, nivel: nivel}).then(function (updated) {
                                if (updated)
                                    console.log ("Exitos en modificacion");
                                else
                                    console.log ("Error con la modificacion");
                            });
                            $("table tr").remove();
                            conteo = 1;
                            db.registros.each(function (results) {
                                if(results.relevant) {
                                    var markup = "<tr><td>" + conteo + "</td><td>" + results.nombre + "</td><td>" + results.sector + "</td>" +
                                            "<td>" + results.nivel + "</td><td>" + results.ubicacion + "</td><td>" +
                                            '<button type="button" id="borrar" onclick = "borrarregistro(' + conteo + ')" class="btn btn-warning">Borrar!</button>'
                                            + "</td><td>" +
                                            '<button type="button" id="modificar" onclick = "modidificarRegistro(' + conteo + ')"  class="btn btn-warning">Modificar!</button>'
                                            + "</td></tr>";
                                    $("table tbody").append(markup);
                                }
                            });
                            //location.reload();

                        }

                        function borrarregistro(id) {
                            console.log(id);
//                            db.registros.where(":id").equals(id).delete();
                            db.registros.update(id, {relevant: false}).then(function (updated) {
                                if (updated)
                                    console.log ("Exitos en modificacion");
                                else
                                    console.log ("Error con la modificacion");
                            });
                            $("table tr").remove();
                            db.registros.each(function (results) {
                                if(results.relevant) {
                                    var markup = "<tr><td>" + results.indicador + "</td><td>" + results.nombre + "</td><td>" + results.sector + "</td>" +
                                            "<td>" + results.nivel + "</td><td>" + results.ubicacion + "</td><td>" +
                                            '<button type="button" id="borrar" onclick = "borrarregistro(' + results.indicador + ')" class="btn btn-warning">Borrar!</button>'
                                            + "</td><td>" +
                                            '<button type="button" id="modificar" onclick = "modidificarRegistro(' + results.indicador + ')"  class="btn btn-warning">Modificar!</button>'
                                            + "</td></tr>";
                                    $("table tbody").append(markup);
                                }
                            });
                        }
                    </script>

                </form>
                <div id="map-canvas" style="width:600px;height:400px" hidden></div>
            </div>
            <div class="col-md-3">

            </div>
        </div>
    </div>
</section>
<section id="datos-locales">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Registros</h2>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-3">

            </div>
            <div class="col-md-6">

                <div class="form-group row">
                    <table id="tablaLocal" class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Sector</th>
                                <th>Nivel Escolar</th>
                                <th>Ubicacion</th>
                                <th>Borrar</th>
                                <th>Modificar</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <br>
                    <hr>
                    <button type="button" id="enviar" class="btn btn-warning">Enviar!</button>
                </div>
            </div>
            <div class="col-md-3">

            </div>
        </div>
    </div>
    <script>
        $("#enviar").click(function (e) {

        db.registros.each(function (results) {
//            console.log(results);
//            console.log("nombre="+results.nombre+"&sector="+results.sector+"&nivel="+results.nivel+"&ubicacion="+results.ubicacion);
            if(results.relevant) {
                $.ajax({
                    url: "/insertpostgres",
                    cache: false,
                    type: "POST",
                    data: "nombre=" + results.nombre + "&sector=" + results.sector + "&nivel=" + results.nivel + "&ubicacion=" + results.ubicacion +
                    "&lat=" + results.lat + "&long=" + results.long,
                    success: function (html) {
                        console.log("ok");
                    }
                });
            }
            db.registros.update(results.indicador, {relevant: false}).then(function (updated) {
                if (updated)
                    console.log ("Exitos en modificacion");
                else
                    console.log ("Error con la modificacion");
            });
        });

//        db.registros.clear();

        location.reload();

    });
    </script>
</section>



<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <span class="copyright">Copyright &copy; Francis 20120559 - Jesus Henriquez 20130204</span>
            </div>
        </div>
    </div>
</footer>

<!-- Portfolio Modals -->
<!-- Use the modals below to showcase details about your portfolio projects! -->

<!-- Portfolio Modal 1 -->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>Project Name</h2>
                            <p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
                            <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt="">
                            <p>Use this area to describe your project. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!</p>
                            <p>
                                <strong>Want these icons in this portfolio item sample?</strong>You can download 60 of them for free, courtesy of <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>, or you can purchase the 1500 icon set <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.</p>
                            <ul class="list-inline">
                                <li>Date: July 2014</li>
                                <li>Client: Round Icons</li>
                                <li>Category: Graphic Design</li>
                            </ul>
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js" integrity="sha384-mE6eXfrb8jxl0rzJDBRanYqgBxtJ6Unn4/1F7q4xRRyIw7Vdg9jP4ycT7x1iVsgb" crossorigin="anonymous"></script>

<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="js/agency.min.js"></script>

</body>

</html>
