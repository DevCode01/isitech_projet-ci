<%--
  Created by IntelliJ IDEA.
  User: merygbeguet
  Date: 17/04/2021
  Time: 13:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>LISTE DES MAGASINS</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin="" />
    <style type="text/css">
    #map{ /* la carte DOIT avoir une hauteur sinon elle n'apparaît pas */
        height:400px;
    }
    </style>

    %{--    <asset:stylesheet src="application.css"/>--}%
    s

    <!-- Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

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
                    <a class="nav-link active" aria-current="page" href="../">Accueil</a>
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

<body>
<div class="container" style="padding-top: 80px;"> </div>
<br><br>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<!-- Fichiers Javascript -->
<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>
<script type="text/javascript">
    var listLatitudeLongitudeVilles = [];
    function chercher(adresseVille, nomMagasin){
        if(adresseVille != ""){
            $.ajax({
                url: "c", // URL de Nominatim
                type: 'get', // Requête de type GET
                data: "q="+adresseVille+"&format=json&addressdetails=1&limit=1&polygon_svg=1" // Données envoyées (q -> adresse complète, format -> format attendu pour la réponse, limit -> nombre de réponses attendu, polygon_svg -> fournit les données de polygone de la réponse en svg)
            }).done(function (response) {
                if(response != ""){
                    userlat = response[0]['lat'];
                    userlon = response[0]['lon'];
                    //alert("Latitude " + userlat);
                    //alert("Longitude " + userlon);
                    var tdDetail = { "Paris" : { "lat" : userlat, "lon" : userlon, "nomMagasin" : nomMagasin}};
                    listLatitudeLongitudeVilles.push(tdDetail);
                    console.log("Je push");
                    console.log(listLatitudeLongitudeVilles);
                }
            }).fail(function (error) {
                //alert(error);
            });
        }
    }
</script>
<div class="card-columns">
    <g:each in="${magasinList}" status="j" var="magasinInstance">
        <div class="card mb-4">
                <img class="card-img-top" width="200" height="200" src="http://kdimageslogo.com/221-large_default/-logo-carrefour.jpg" alt="Enseigne magasin">
                <div class="card-body">
                    <h4 class="card-title">${fieldValue(bean: magasinInstance, field: "nom") }</h4>
                    <p class="card-text">${fieldValue(bean: magasinInstance, field: "adresse") }</p>
                    <p class="card-text">${magasinList.idVille ? fieldValue(bean: magasinInstance.ville, field: "nomVille") : ""}</p>
                    <p class="card-text">${magasinList.idVille ? fieldValue(bean: magasinInstance.ville, field: "codePostal") : ""}</p>
                    <p class="card-text">${magasinList.idCategorie ? fieldValue(bean: magasinInstance.categorie, field: "typeCategorie") : ""}</p>
                    <p class="card-text">${magasinInstance.id}</p>
                    <g:link action="show" id="${fieldValue(bean: magasinInstance, field: "id")}">
                        ${message(code: 'default.button.edit.label', default: 'Visiter le magasin')}
                    </g:link>
                </div>
                <div class="card-footer">
                    <small class="text-muted">D2MPROJET</small>
                </div>
            </div>
        <script type="text/javascript">
            var ville = "${fieldValue(bean: magasinInstance, field: "adresse") } ${magasinList.idVille ? fieldValue(bean: magasinInstance.ville, field: "codePostal") : ""}";
            var nomDuMagasin = "${fieldValue(bean: magasinInstance, field: "nom") }";
            chercher(ville, nomDuMagasin);
        </script>
    </g:each>
</div>


<g:form enctype="multipart/form-data" controller="magasin" action="create">
    <fieldset class="form">
        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'nom', 'error')}">
            <label for="nom">
                <g:message code="nom.label" default="nom du magasin" />
            </label>
            <g:textField name="nom" value="${magasinInstance?.nom}"/>
        </div>
        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'adresse', 'error')}">
            <label for="adresse">
                <g:message code="adresse.label" default="adresse" />
            </label>
            <g:textField name="adresse" value="${magasinInstance?.adresse}"/>
        </div>
        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'placeTotale', 'error')}">
            <label for="placeTotale">
                <g:message code="placeTotale.label" default="placeTotale" />
            </label>
            <g:textField name="placeTotale" value="${magasinInstance?.placeTotale}"/>
        </div>

        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'horaireOuverture', 'error')}">
            <label for="horaireOuverture">
                <g:message code="horaireOuverture.label" default="horaireOuverture" />
            </label>
            <g:textField name="horaireOuverture" value="${magasinInstance?.horaireOuverture}"/>
        </div>

        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'horaireFermeture', 'error')}">
            <label for="horaireFermeture">
                <g:message code="horaireFermeture.label" default="horaireFermeture" />
            </label>
            <g:textField name="horaireFermeture" value="${magasinInstance?.horaireFermeture}"/>
        </div>

        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'ouvertLeMidi', 'error')}">
            <label for="ouvertLeMidi">
                <g:message code="ouvertLeMidi.label" default="ouvertLeMidi" />
            </label>
            <g:textField name="ouvertLeMidi" value="${magasinInstance?.ouvertLeMidi}"/>
        </div>

        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'idVille', 'error')}">
            <label for="idVille">
                <g:message code="codePostal.label" default="codePostal et ville" />
            </label>
            <g:select name="idVille" from="${projet.Ville.list(sort: 'nomVille')}" optionKey="id" value="${magasinInstance? magasinInstance.ville_id : ''}" noSelection="['':'Choisir un code postal']" class="mySelect" />
        </div>

        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'idCategorie', 'error')}">
            <label for="idCategorie">
                <g:message code="categorie.label" default="Categorie" />
            </label>
            <g:select name="idCategorie" from="${projet.Categorie.list()}" optionKey="id" value="${magasinInstance? magasinInstance.categorie_id : ''}" noSelection="['':'Choisir une categorie']" class="mySelect" />
        </div>

        <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'imageMagasin', 'error')}">
            <label for="imageMagasin">
                <g:message code="imageMagasin.label"  default="imageMagasin" />
            </label>
            <input type="file" name="imageMagasin" value="${magasinInstance? magasinInstance.imageMagasin : ''}" name="fic" size=50 />
        </div>


    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="Ajouter" class="create" />
    </fieldset>
</g:form>


<style type="text/css">
    body {padding: 0}
</style>

<div id="map">
    <!-- Ici s'affichera la carte -->
</div>

<style>
.loader {
    border: 16px solid #f3f3f3;
    border-radius: 50%;
    border-top: 16px solid #3498db;
    width: 120px;
    height: 120px;
    -webkit-animation: spin 2s linear infinite; /* Safari */
    animation: spin 2s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
    0% { -webkit-transform: rotate(0deg); }
    100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<div class="loader"></div>
<!-- Fichiers Javascript -->
<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>
<script type="text/javascript">

    function loadSpinner(ouiOuNon) {
        if (ouiOuNon == true) {
            $(".loader").show();
        }else {
            $(".loader").hide();
        }
    }

    // On initialise la latitude et la longitude de Paris (centre de la carte)
    var lat = 48.852969;
    var lon = 2.349903;
    var macarte = null;
    // Nous initialisons une liste de marqueurs
    var villes = {
        "Paris": { "lat": 48.852969, "lon": 2.349903 },
        "Brest": { "lat": 48.383, "lon": -4.500 },
        "Quimper": { "lat": 48.000, "lon": -4.100 },
        "Bayonne": { "lat": 43.500, "lon": -1.467 }
    };
    // Fonction d'initialisation de la carte
    function initMap() {
        console.log('Propre List');
        console.log(listLatitudeLongitudeVilles);

        //alert("Création map");
        // Créer l'objet "macarte" et l'insèrer dans l'élément HTML qui a l'ID "map"
        macarte = L.map('map').setView([lat, lon], 6);
        // Leaflet ne récupère pas les cartes (tiles) sur un serveur par défaut. Nous devons lui préciser où nous souhaitons les récupérer. Ici, openstreetmap.fr
        L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
            // Il est toujours bien de laisser le lien vers la source des données
            attribution: 'données © OpenStreetMap/ODbL - rendu OSM France',
            minZoom: 1,
            maxZoom: 20
        }).addTo(macarte);
        // Nous parcourons la liste des villes
        for (ville in villes) {
            for (let i = 0; i < listLatitudeLongitudeVilles.length; i++) {
                console.log(listLatitudeLongitudeVilles[i][ville].lat);
                var marker = L.marker([listLatitudeLongitudeVilles[i][ville].lat, listLatitudeLongitudeVilles[i][ville].lon]).addTo(macarte);
                marker.bindPopup(listLatitudeLongitudeVilles[i][ville].nomMagasin);

            }
        }

    }
    loadSpinner(true);
    setTimeout(() => { loadSpinner(false),console.log("Chargement map!"); }, 6000);
    setTimeout(() => { initMap(); }, 6000);
</script>
</body>
</html>