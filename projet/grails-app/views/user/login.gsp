<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Accueil</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="logo_d2m-removebg.png"/>
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
                    <a class="nav-link active" aria-current="page" href="../../#">Accueil</a>
                </li>
            </ul>
            <form class="d-flex">
                <a class="btn btn-danger" href="/user/espacePro" type="submit">Espace Pro</a>
            </form>
        </div>
    </div>
</nav>


    <g:if test="${getLogin.size() == 0}">
        <div class="text-center" style="padding-top: 100px; padding-left: 20px;">
            Oup's, il semblerait qu'il n'y est rien d'intéressant ici .. on fait marche arrière ?
        </div>
    </g:if>
    <g:else>
        <div style="margin: 0 auto;width:600px;padding-top: 100px;">
            <g:form enctype="multipart/form-data" controller="magasin" action="create">
                <fieldset class="form">
                    <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'nom', 'error')}">
                        <label for="nom">
                            <g:message code="nom.label" default="Nom du magasin" />
                        </label>
                        <g:textField name="nom" value="${magasinInstance?.nom}"/>
                    </div>
                    <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'adresse', 'error')}">
                        <label for="adresse">
                            <g:message code="adresse.label" default="Adresse" />
                        </label>
                        <g:textField name="adresse" value="${magasinInstance?.adresse}"/>
                    </div>
                    <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'placeTotale', 'error')}">
                        <label for="placeTotale">
                            <g:message code="placeTotale.label" default="Superficie du commerce" />
                        </label>
                        <input type="text" id="superficie" name="placeTotale" value="${magasinInstance?.placeTotale}"/>
                    </div>

                    <div onclick="testFonction()" class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'horaireOuverture', 'error')}">
                        <label for="horaireOuverture">
                            <g:message code="horaireOuverture.label" default="Horaire d'ouverture" />
                        </label>
                        <g:textField name="horaireOuverture" value="${magasinInstance?.horaireOuverture}"/>
                    </div>

                    <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'horaireFermeture', 'error')}">
                        <label for="horaireFermeture">
                            <g:message code="horaireFermeture.label" default="Horaire de fermeture" />
                        </label>
                        <g:textField name="horaireFermeture" value="${magasinInstance?.horaireFermeture}"/>
                    </div>

                    <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'ouvertLeMidi', 'error')}">
                        <label for="ouvertLeMidi">
                            <g:message code="ouvertLeMidi.label" default="Ouvert le midi" />
                        </label>
                        <select name="ouvertLeMidi" id="ouvertLeMidi">
                            <option value="${1}">Oui</option>
                            <option value="${0}">Non</option>
                        </select>
                    </div>

                    <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'idVille', 'error')}">
                        <label for="idVille">
                            <g:message code="codePostal.label" default="Code postal et ville" />
                        </label>
                        <g:select name="idVille" from="${projet.Ville.list(sort: 'nomVille')}" optionKey="id" value="${magasinInstance? magasinInstance.ville_id : ''}" noSelection="['':'Choisir un code postal']" class="mySelect" />
                    </div>

                    <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'Catégorie', 'error')}">
                        <label for="idCategorie">
                            <g:message code="categorie.label" default="Categorie" />
                        </label>
                        <g:select name="idCategorie" from="${projet.Categorie.list()}" optionKey="id" value="${magasinInstance? magasinInstance.categorie_id : ''}" noSelection="['':'Choisir une categorie']" class="mySelect" />
                    </div>

                    <div class="fieldcontation ${hasErrors(bean: magasinInstance, field: 'Image du magasin', 'error')}">
                        <label for="imageMagasin">
                            <g:message code="imageMagasin.label"  default="Logo du magasin" />
                        </label>
                        <input type="file" name="imageMagasin" value="${magasinInstance? magasinInstance.imageMagasin : ''}" name="fic" size=50 />
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="J'ajoute mon magasin !" class="create" />
                </fieldset>
            </g:form>
        </div>
    </g:else>

<script>
    function float2int (value) {
        return value | 0;
    }

    function testFonction() {
    }
</script>
</html>