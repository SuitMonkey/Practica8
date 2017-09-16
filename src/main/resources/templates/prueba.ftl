<!DOCTYPE html>
<html>
<head>
    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>
</head>
<body>
<h3>My Google Maps Demo</h3>
<div id="map"></div>
<script>
    function initMap() {
        var uluru = {lat: 19.7757886, lng: -70.6855836};
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 8,
            center: uluru
        });
        var marker = new google.maps.Marker({
            position: uluru,
            map: map
        });
    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBSPrMC0CkYzfZ0dxb7sH0bnxBd5E24WIY&callback=initMap">
</script>
</body>
</html>