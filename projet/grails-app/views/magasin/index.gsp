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
                <div class="card-body">
                    <p class="card-text">${magasinInstance.id}</p>
                    <h4 class="card-title">${fieldValue(bean: magasinInstance, field: "nom") }</h4>
                    <g:textField value="${fieldValue(bean: magasinInstance, field: "nom") }" name="nom"></g:textField>
                    <br>
                    <g:textField value="${fieldValue(bean: magasinInstance, field: "adresse") }" name="adresse"></g:textField>
                    <br>
                    <p class="card-text">${magasinList.idVille ? fieldValue(bean: magasinInstance.ville, field: "nomVille") : ""}</p>
                    <p class="card-text">${magasinList.idVille ? fieldValue(bean: magasinInstance.ville, field: "codePostal") : ""}</p>
                    <g:textField value="${magasinList.idCategorie ? fieldValue(bean: magasinInstance.categorie, field: "typeCategorie") : ""}" name="categorie"></g:textField>
                    <br>
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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
</script>
<div class="loader"></div>
<!-- Fichiers Javascript -->
<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>
</body>
</html>