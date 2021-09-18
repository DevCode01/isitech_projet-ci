<%@ page import="projet.MagasinController" %>
<!doctype html>
<html lang="fr" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Accueil</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="logo_d2m-removebg.png"/>

    %{--    <asset:stylesheet src="application.css"/>--}%



    <!-- Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.3.1/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.3.1/mapbox-gl.js"></script>
    <style>
    #map { position: absolute; top: 100px; bottom: 0; width: 75%; }
    </style>

</head>


<%--
MENU NAVBAR
--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand"><b>D2M</b></a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbarCollapse" style="">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="../../#">Accueil</a>
                </li>
                %{--                <li class="nav-item">--}%
                %{--                    <a class="nav-link" href="#">Link</a>--}%
                %{--                </li>--}%
                %{--                <li class="nav-item">--}%
                %{--                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--}%
                %{--                </li>--}%
            </ul>
            <form class="d-flex">
                <button class="btn btn-danger" type="submit">Espace Pro</button>
            </form>
        </div>
    </div>
</nav>

<!-- Remove the container if you want to extend the Footer to full width. -->
<body>



<g:if test="${magasinInstance == null}">
    <div class="text-center" style="padding-top: 100px; padding-left: 20px;">
        Oup's, il semblerait qu'il n'y est rien d'intéressant ici .. on fait marche arrière ?
    </div>
</g:if>
<g:else>
    <div class="container">
        <div class="row">
            <div class="col-sm">
                <div class="text-center" style="padding-top: 100px; padding-left: 20px;">
                    <div class="card" style="width: 24rem;">
                        <img class="card-img-top" id="testImage" width="300" height="300" alt="Logo du magasin">
                        <div class="card-body">
                            <h5 class="card-title">${magasinInstance?.nom}</h5>
                            <script>
                                var base64String = btoa(String.fromCharCode.apply(null, new Uint8Array(${fieldValue(bean: magasinInstance, field: "imageMagasin") })));
                                document.getElementById("testImage").setAttribute('src', "data:image/png;base64,"+base64String);
                            </script>
                            <p class="card-text">Jauge totale du magasin : ${magasinInstance?.placeTotale} places</p>
                            <p class="card-text">${fieldValue(bean: magasinInstance, field: "adresse") }, ${fieldValue(bean: magasinInstance.ville, field: "codePostal")} ${fieldValue(bean: magasinInstance.ville, field: "nomVille")}</p>
                            <p class="card-text">De ${fieldValue(bean: magasinInstance, field: "horaireOuverture") } à ${fieldValue(bean: magasinInstance, field: "horaireFermeture")}.
                                <g:if test="${fieldValue(bean: magasinInstance, field: "ouvertLeMidi") == '1'}">
                                    <br><b>Ouvert entre 12 et 14h !</b><br>
                                </g:if>
                                <g:else>
                                    <br><b>Fermé entre 12 et 14h !</b><br>
                                </g:else>
                            </p>
                            <g:link  class="btn btn-primary" action="listeResa" id="${fieldValue(bean: magasinInstance, field: "id")}">
                                ${message(code: 'Je découvre les créneaux disponibles', default: 'Je découvre les créneaux disponibles')}
                            </g:link>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm" style="padding-top: 100px; padding-left: 20px;">
                <div id="map"></div>

                <script src="https://unpkg.com/es6-promise@4.2.4/dist/es6-promise.auto.min.js"></script>
                <script src="https://unpkg.com/@mapbox/mapbox-sdk/umd/mapbox-sdk.min.js"></script>

                <script>
                    // TO MAKE THE MAP APPEAR YOU MUST
                    // ADD YOUR ACCESS TOKEN FROM
                    // https://account.mapbox.com
                    mapboxgl.accessToken = 'pk.eyJ1IjoibWlndWVsMTciLCJhIjoiY2txemJuOXN1MDVoMjJ2bXRvdTd1cHRsMiJ9.KcVg68bMYFYsWYG4TaMELQ';
                    var mapboxClient = mapboxSdk({ accessToken: mapboxgl.accessToken });
                    mapboxClient.geocoding
                        .forwardGeocode({
                            query: '${fieldValue(bean: magasinInstance, field: "adresse") }, ${fieldValue(bean: magasinInstance.ville, field: "codePostal")}, ${fieldValue(bean: magasinInstance.ville, field: "nomVille")}',
                            autocomplete: false,
                            limit: 1
                        })
                        .send()
                        .then(function (response) {
                            if (
                                response &&
                                response.body &&
                                response.body.features &&
                                response.body.features.length
                            ) {
                                var feature = response.body.features[0];

                                var map = new mapboxgl.Map({
                                    container: 'map',
                                    style: 'mapbox://styles/mapbox/streets-v11',
                                    center: feature.center,
                                    zoom: 12
                                });

// Create a marker and add it to the map.
                                new mapboxgl.Marker().setLngLat(feature.center).addTo(map);
                            }
                        });
                </script>
            </div>
        </div>



    </div>
</g:else>



</body>
<!-- Footer -->
<footer class="text-center text-white" style="background-color: #3f51b5">
    <!-- Grid container -->
    <div
            class="text-center p-3"
            style="background-color: rgba(0, 0, 0, 0.2)"
    >
        © 2021 Copyright Tous droits réservés
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->

<style type="text/css">
footer {
    position:fixed;
    left:0px;
    bottom:0px;
    width:100%;
}
</style>
</html>

<!--
SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = 1) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = 1 AND reservation.heureDebut = '12:00:01' AND reservation.dateReservation = '2021-08-10') as placeRestantes

-->