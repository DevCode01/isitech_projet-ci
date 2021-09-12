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
                    <a class="nav-link active" aria-current="page" href="#">Accueil</a>
                </li>
                %{--                <li class="nav-item">--}%
                %{--                    <a class="nav-link" href="#">Link</a>--}%
                %{--                </li>--}%
                %{--                <li class="nav-item">--}%
                %{--                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>--}%
                %{--                </li>--}%
            </ul>
            <form class="d-flex">
                <a class="btn btn-danger" href="/user/espacePro" type="submit">Espace Pro</a>
            </form>
        </div>
    </div>
</nav>


<body>
<div class="container" style="padding-top: 140px;">
        <g:form action="searchBarResult" class="myform">
            <input class="form-control nomMagasin" type="text" aria-label="default input example" value="${nomDuMagasin}" style="text-align: left; font-size: 15px"  name="nomDuMagasin"  placeholder="Nom du magasin">
            <input class="form-control codePostal" type="text" aria-label="default input example" value="${codePostal}" style="text-align: left; font-size: 15px" name="codePostal" placeholder="Code postal">
            <button id="submit-values" class="btn btn-small btn-primary" type="submit">
                <i class="icon-ok"></i>
                Search
            </button>
        </g:form>

    <h3 id="lesMagasinsLesPlusVus" style="padding-top: 60px; text-align: center">LES MAGASINS LES PLUS VISITÉS</h3>
    <h5 id="magasinAlimentaire" style="padding-top: 20px; text-align: left">Catégorie alimentaire</h5>

    <div class="text-center" style="padding-top: 50px;">
        <g:each in="${magasinList}" status="j" var="magasinInstance">
            <span style="padding: 20px;">
                <a href="magasin/show/4">
                    <img src="https://www.ipzen.com/app/uploads/2017/10/logo-carrefour.png" width="80" height="80" class="rounded-circle border border-primary"/>
                </a>
            </span>
        </g:each>
    </div>
        <h5 id="magasinNonAlimentaire" style="padding-top: 40px; text-align: left">Catégorie non-alimentaire</h5>
        <div class="text-center" style="padding-top: 50px;">
            <g:each in="${magasinList}" status="j" var="magasinInstance">
                <span style="padding: 20px;">
                    <a href="magasin/show/5">
                        <img src="https://www.ipzen.com/app/uploads/2017/10/logo-carrefour.png" width="80" height="80" class="rounded-circle border border-primary"/>
                    </a>
                </span>
            </g:each>
        </div>
</div>

</body>
<!-- Remove the container if you want to extend the Footer to full width. -->

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


.myform {
    display : flex;
}
</style>
</html>

