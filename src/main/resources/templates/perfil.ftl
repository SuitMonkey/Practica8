<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Agency - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Theme CSS -->
    <link href="css/agency.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha384-0s5Pv64cNZJieYFkXYOTId2HMA2Lfb6q2nAcx2n0RTLUnCAoTTsS0nKEO27XyKcY" crossorigin="anonymous"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js" integrity="sha384-ZoaMbDF+4LeFxg6WdScQ9nnR1QC2MIRxA1O9KWEXQwns1G8UNyIEZIQidzb0T1fo" crossorigin="anonymous"></script>
    <![endif]-->

    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>

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
            <a class="navbar-brand page-scroll" href="/">Inicio</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden">
                    <a href="#page-top"></a>
                </li>
                <li>
                    <a class="page-scroll" href="#services">Registros Servidor</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->

    </div>
    <!-- /.container-fluid -->
</nav>

<div class="cabeza" style="background-image: url('../img/header-bg.jpg')">
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Practica 8</div>
                <div class="intro-heading">2012-0559</div>
                <div class="intro-heading">2013-0204</div>
                <a href="#services" class="page-scroll btn btn-xl">Registros Servidor</a>
            </div>
        </div>
    </header>
</div>

<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Registros Servidor</h2>
            </div>
        </div>
        <div class="row text-center">
            <div class="col-md-1">

            </div>
            <div class="col-md-10">
                <table id="tablaLocal" class="table">
                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Sector</th>
                        <th>Nivel Escolar</th>
                        <th>Ubicacion</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list registros as re>
                    <tr>
                        <#if (re.getNombre())??>
                            <td>${re.getNombre()}</td>
                        <#else>
                            <td></td>
                        </#if>

                        <#if (re.getSector())??>
                            <td>${re.getSector()}</td>
                        <#else>
                            <td></td>
                        </#if>

                        <#if (re.getNivel())??>
                            <td>${re.getNivel()}</td>
                        <#else>
                            <td></td>
                        </#if>

                        <#if (re.getLocation())??>
                            <td>${re.getLocation()}</td>
                        <#else>
                            <td></td>
                        </#if>
                    </tr>

                    </#list>
                    </tbody>
                </table>

                <br>
                <div id="map"></div>
                <script>
                    var map;
                    function initMap() {
                        map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 8,
                            center: new google.maps.LatLng(19.0000000,-70.6667000)
                        });

                    <#list registros as re>
                        var latLng = new google.maps.LatLng(${re.getLatitud()},${re.getLongitud()});
                        var marker = new google.maps.Marker({
                            position: latLng,
                            map: map
                        });
                    </#list>
                    }

                </script>
                <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSPrMC0CkYzfZ0dxb7sH0bnxBd5E24WIY&callback=initMap">
                </script>
            </div>
            <div class="col-md-1">

            </div>
        </div>
    </div>
</section>


<section id="mapeo">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-1">

            </div>
            <div class="col-md-10">



            </div>
            <div class="col-md-1">

            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <span class="copyright">Copyright &copy; Francis 20120559  - Jesus Henriquez 20130204</span>
            </div>
        </div>
    </div>
</footer>


<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

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
