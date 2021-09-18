<%@ page import="projet.MagasinController" %>
<!doctype html>
<html lang="fr" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Réservation créneau</title>
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
    <br><br><br>
    <script src="//cdn.jsdelivr.net/npm/less@4.1.1" >
    </script>
    <div class="time-picker-container" style="width: 100%">
        <h5 id="testChangeMonth" style="text-align: center">Aout 2021</h5>

        <script>
            var ladate=new Date()
            var tab_mois=new Array("Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre");
            var getLeMoisSuivant = ladate.getMonth()
            var dateDebut = ladate.getDate()
            var heureRealTime = ladate.getHours();
            console.log("Heure : " + heureRealTime);
            var datePlusSix = ladate.setDate((ladate.getDate() + 6))
            document.getElementById("testChangeMonth").innerHTML = "Du " + dateDebut + " " + tab_mois[ladate.getMonth()] + " " + ladate.getFullYear() + " au " +  + ladate.getDate() + " " + tab_mois[ladate.getMonth(ladate.setDate((ladate.getDate() + 6)))] + " " + ladate.getFullYear();
            var jourDeLaSemaine = new Date().toLocaleString('en-us', {  weekday: 'long' });
        </script>


        <div class="time-picker">
            <div class="row time-picker-header">
                <ul class="date-slot">
                    <li class="date-slot-wrapper">
                        <div class="date-slot-item">
                            <span class="date-slot-day" id="jour1">Lundi</span>
                            <span class="date-slot-date" id="dayjour1"></span>
                        </div>
                    </li>
                    <li class="date-slot-wrapper">
                        <div class="date-slot-item">
                            <span class="date-slot-day" id="jour2">Mardi</span>
                            <span class="date-slot-date" id="dayjour2">12</span>
                        </div>
                    </li>
                    <li class="date-slot-wrapper">
                        <div class="date-slot-item">
                            <span class="date-slot-day" id="jour3">Mercredi</span>
                            <span class="date-slot-date" id="dayjour3">13</span>
                        </div>
                    </li>
                    <li class="date-slot-wrapper">
                        <div class="date-slot-item">
                            <span class="date-slot-day" id="jour4">Jeudi</span>
                            <span class="date-slot-date" id="dayjour4">14</span>
                        </div>
                    </li>
                    <li class="date-slot-wrapper">
                        <div class="date-slot-item no-free-slot">
                            <span class="date-slot-day" id="jour5">Vendredi</span>
                            <span class="date-slot-date" id="dayjour5">15</span>
                        </div>
                    </li>
                    <li class="date-slot-wrapper">
                        <div class="date-slot-item">
                            <span class="date-slot-day" id="jour6">Samedi</span>
                            <span class="date-slot-date" id="dayjour6">14</span>
                        </div>
                    </li>
                    <li class="date-slot-wrapper">
                        <div class="date-slot-item">
                            <span class="date-slot-day" id="jour7">Dimanche</span>
                            <span class="date-slot-date" id="dayjour7">14</span>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="row">
                <!--
ICI FAIRE BOUCLE POUR AFFICHAGE HORAIRES
IF CONDITION POUR LE PREMIERJOUR : si heureactuelle > heure affichés, griser la case
-->
                <ul class="time-slot">
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="8prem8"></li>
                    <input id="8prem8nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="9prem9"></li>
                    <input id="9prem9nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="10prem10"></li>
                    <input id="10prem10nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="11prem11"></li>
                    <input id="11prem11nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="12prem12"></li>
                    <input id="12prem12nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="13prem13"></li>
                    <input id="13prem13nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="14prem14"></li>
                    <input id="14prem14nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="15prem15"></li>
                    <input id="15prem15nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="16prem16"></li>
                    <input id="16prem16nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="17prem17"></li>
                    <input id="17prem17nbPlace" type="hidden" >
                </ul>
                <ul class="time-slot">
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="8deux8"></li>
                    <input id="8deux8nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="9deux9"></li>
                    <input id="9deux9nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="10deux10"></li>
                    <input id="10deux10nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="11deux11"></li>
                    <input id="11deux11nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="12deux12"></li>
                    <input id="12deux12nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="13deux13"></li>
                    <input id="13deux13nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="14deux14"></li>
                    <input id="14deux14nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="15deux15"></li>
                    <input id="15deux15nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)"  id="16deux16"></li>
                    <input id="16deux16nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="17deux17"></li>
                    <input id="17deux17nbPlace" type="hidden" >
                </ul>
                <ul class="time-slot">
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="8trois8"></li>
                    <input id="8trois8nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="9trois9"></li>
                    <input id="9trois9nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="10trois10"></li>
                    <input id="10trois10nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="11trois11"></li>
                    <input id="11trois11nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="12trois12"></li>
                    <input id="12trois12nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="13trois13"></li>
                    <input id="13trois13nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="14trois14"></li>
                    <input id="14trois14nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="15trois15"></li>
                    <input id="15trois15nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="16trois16"></li>
                    <input id="16trois16nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="17trois17"></li>
                    <input id="17trois17nbPlace" type="hidden" >
                </ul>
                <ul class="time-slot">
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="8quatre8"></li>
                    <input id="8quatre8nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="9quatre9"></li>
                    <input id="9quatre9nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="10quatre10"></li>
                    <input id="10quatre10nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="11quatre11"></li>
                    <input id="11quatre11nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="12quatre12"></li>
                    <input id="12quatre12nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="13quatre13"></li>
                    <input id="13quatre13nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="14quatre14"></li>
                    <input id="14quatre14nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="15quatre15"></li>
                    <input id="15quatre15nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="16quatre16"></li>
                    <input id="16quatre16nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="17quatre17"></li>
                    <input id="17quatre17nbPlace" type="hidden" >
                </ul>
                <ul class="time-slot">
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="8cinq8"></li>
                    <input id="8cinq8nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="9cinq9"></li>
                    <input id="9cinq9nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="10cinq10"></li>
                    <input id="10cinq10nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="11cinq11"></li>
                    <input id="11cinq11nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="12cinq12"></li>
                    <input id="12cinq127nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="13cinq13"></li>
                    <input id="13cinq13nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="14cinq14"></li>
                    <input id="14cinq14nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="15cinq15"></li>
                    <input id="15cinq15nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="16cinq16"></li>
                    <input id="16cinq16nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="17cinq17"></li>
                    <input id="17cinq17nbPlace" type="hidden" >
                </ul>
                <ul class="time-slot">
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="8six8"></li>
                    <input id="8six8nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="9six9"></li>
                    <input id="9six9nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="10six10"></li>
                    <input id="10six10nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="11six11"></li>
                    <input id="11six11nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="12six12"></li>
                    <input id="12six12nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="13six13"></li>
                    <input id="13six13nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="14six14"></li>
                    <input id="14six14nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="15six15"></li>
                    <input id="15six15nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="16six16"></li>
                    <input id="16six16nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="17six17"></li>
                    <input id="17six17nbPlace" type="hidden" >
                </ul>
                <ul class="time-slot">
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="8sept8"></li>
                    <input id="8sept8nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="9sept9"></li>
                    <input id="9sept9nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="10sept10"></li>
                    <input id="10sept10nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="11sept11"></li>
                    <input id="11sept11nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="12sept12"></li>
                    <input id="12sept12nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="13sept13"></li>
                    <input id="13sept13nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="14sept14"></li>
                    <input id="14sept14nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="15sept15"></li>
                    <input id="15sept15nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="16sept16"></li>
                    <input id="16sept16nbPlace" type="hidden" >
                    <li class="time-slot-item" onclick="getIdClick(this.id)" id="17sept17"></li>
                    <input id="17sept17nbPlace" type="hidden" >
                </ul>


                <script>
                    var listHoraires = []
                </script>
                <g:each in="${getByHoraire}" var="r" id="1">
                    <g:if test="${r.'placeRestantes' == null}">
                        <script>
                            listHoraires.push(${magasinInstance.placeTotale})
                        </script>
                    </g:if>
                    <g:else>
                        <script>
                            listHoraires.push(${r.'placeRestantes'})
                        </script>
                    </g:else>
                </g:each>

                <script>
                    console.log("Liste horaire : " + listHoraires)
                </script>



                <g:each in="${searchBar}" var="r" id="1">
                    uuu
                    uu
                    u
                    ${r.'nom'}
                </g:each>

                <script>

                    for (let heure = 8; heure < 18; heure++) {
                        let heurePlusTrente = heure+1;
                        var date = new Date();
                        if(date.getHours()+1 > heure ) {
                            console.log('Heure dépassée !!')
                            let text = heure + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let variable = heure+"prem"+heure
                            document.getElementById(variable).innerHTML = text;
                            document.getElementById(variable).setAttribute('value', heure + ' ' + heurePlusTrente);
                            var btnCopy = document.getElementById(variable);
                            btnCopy.className += " disabled";
                            btnCopy.onclick = null;
                            document.getElementById(variable).style.cssText = 'background-color:#C9C9C9;';
                        }else {
                            if(listHoraires[heure-8] === 0) {
                                let text = heure + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                                let variable = heure+"prem"+heure
                                let nbPlace = heure-1
                                let setNbPlace = nbPlace+"prem"+nbPlace+"nbPlace"
                                document.getElementById(setNbPlace).setAttribute('value', listHoraires[heure-8]);
                                document.getElementById(variable).innerHTML = text;
                                document.getElementById(variable).setAttribute('value', heure + ' ' + heurePlusTrente);
                                var btnCopy = document.getElementById(variable);
                                btnCopy.className += " disabled";
                                btnCopy.onclick = null;
                                document.getElementById(variable).style.cssText = 'background-color:#C9C9C9;';
                            }else {
                                let setNbPlace = heure+"prem"+heure+"nbPlace"
                                document.getElementById(setNbPlace).setAttribute('value', listHoraires[heure-8]);
                                let text = heure + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                                let variable = heure+"prem"+heure
                                document.getElementById(variable).innerHTML = text;
                                document.getElementById(variable).setAttribute('value', heure + ' ' + heurePlusTrente);
                            }
                        }
                    }

                    for (let heure = 18; heure < 28; heure++) {
                        if(listHoraires[heure-8] === 0) {
                            let heurePlusTrente = heure + 1 - 10 ;
                            let text = heure - 10 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-10
                            let variable1 = heuremoinsDix + "deux" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-10 + ' ' + heurePlusTrente);
                            var btnCopy = document.getElementById(variable1);
                            btnCopy.className += " disabled";
                            btnCopy.onclick = null;
                            document.getElementById(variable1).style.cssText = 'background-color:#C9C9C9;';
                        }else {
                            let nbPlace = heure-10
                            let setNbPlace = nbPlace+"deux"+nbPlace+"nbPlace"
                            document.getElementById(setNbPlace).setAttribute('value', listHoraires[heure-8]);
                            let heurePlusTrente = heure + 1 - 10 ;
                            let text = heure - 10 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-10
                            let variable1 = heuremoinsDix + "deux" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-10 + ' ' + heurePlusTrente);
                        }
                    }

                    for (let heure = 28; heure < 38; heure++) {
                        if(listHoraires[heure-8] === 0) {
                            let heurePlusTrente = heure + 1 - 20 ;
                            let text = heure - 20 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-20
                            let variable1 = heuremoinsDix + "trois" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-20 + ' ' + heurePlusTrente);
                            var btnCopy = document.getElementById(variable1);
                            btnCopy.className += " disabled";
                            btnCopy.onclick = null;
                            document.getElementById(variable1).style.cssText = 'background-color:#C9C9C9;';
                        }else {
                            let nbPlace = heure-20
                            let setNbPlace = nbPlace+"trois"+nbPlace+"nbPlace"
                            document.getElementById(setNbPlace).setAttribute('value', listHoraires[heure-8]);
                            let heurePlusTrente = heure + 1 - 20 ;
                            let text = heure - 20 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-20
                            let variable1 = heuremoinsDix + "trois" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-20 + ' ' + heurePlusTrente);
                        }
                    }

                    for (let heure = 38; heure < 48; heure++) {
                        if(listHoraires[heure-8] === 0) {
                            let heurePlusTrente = heure + 1 - 30 ;
                            let text = heure - 30 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-30
                            let variable1 = heuremoinsDix + "quatre" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-30 + ' ' + heurePlusTrente);
                            var btnCopy = document.getElementById(variable1);
                            btnCopy.className += " disabled";
                            btnCopy.onclick = null;
                            document.getElementById(variable1).style.cssText = 'background-color:#C9C9C9;';
                        }else {
                            let nbPlace = heure-30
                            let setNbPlace = nbPlace+"quatre"+nbPlace+"nbPlace"
                            document.getElementById(setNbPlace).setAttribute('value', listHoraires[heure-8]);
                            let heurePlusTrente = heure + 1 - 30 ;
                            let text = heure - 30 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-30
                            let variable1 = heuremoinsDix + "quatre" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-30 + ' ' + heurePlusTrente);
                        }
                    }


                    for (let heure = 48; heure < 58; heure++) {

                        if(listHoraires[heure-8] === 0) {
                            let heurePlusTrente = heure + 1 - 40 ;
                            let text = heure - 40 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-40
                            let variable1 = heuremoinsDix + "cinq" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-40 + ' ' + heurePlusTrente);
                            var btnCopy = document.getElementById(variable1);
                            btnCopy.className += " disabled";
                            btnCopy.onclick = null;
                            document.getElementById(variable1).style.cssText = 'background-color:#C9C9C9;';
                        }else {
                            let nbPlace = heure-40
                            let setNbPlace = nbPlace+"six"+nbPlace+"nbPlace"
                            document.getElementById(setNbPlace).setAttribute('value', listHoraires[heure-8]);
                            let heurePlusTrente = heure + 1 - 40 ;
                            let text = heure - 40 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-40
                            let variable1 = heuremoinsDix + "cinq" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-40 + ' ' + heurePlusTrente);
                        }


                    }

                    for (let heure = 58; heure < 68; heure++) {

                        if(listHoraires[heure-8] === 0) {
                            let heurePlusTrente = heure + 1 - 50 ;
                            let text = heure - 50 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-50
                            let variable1 = heuremoinsDix + "six" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-50 + ' ' + heurePlusTrente);
                            var btnCopy = document.getElementById(variable1);
                            btnCopy.className += " disabled";
                            btnCopy.onclick = null;
                            document.getElementById(variable1).style.cssText = 'background-color:#C9C9C9;';
                        }else {
                            let nbPlace = heure-50
                            let setNbPlace = nbPlace+"six"+nbPlace+"nbPlace"
                            document.getElementById(setNbPlace).setAttribute('value', listHoraires[heure-8]);
                            let heurePlusTrente = heure + 1 - 50 ;
                            let text = heure - 50 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-50
                            let variable1 = heuremoinsDix + "six" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-50 + ' ' + heurePlusTrente);
                        }

                    }

                    for (let heure = 68; heure < 78; heure++) {

                        if(listHoraires[heure-8] === 0) {
                            let heurePlusTrente = heure + 1 - 60;
                            let text = heure - 60 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-60
                            let variable1 = heuremoinsDix + "sept" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-60 + ' ' + heurePlusTrente);
                            var btnCopy = document.getElementById(variable1);
                            btnCopy.className += " disabled";
                            btnCopy.onclick = null;
                            document.getElementById(variable1).style.cssText = 'background-color:#C9C9C9;';
                        }else {
                            let nbPlace = heure-60
                            let setNbPlace = nbPlace+"sept"+nbPlace+"nbPlace"
                            document.getElementById(setNbPlace).setAttribute('value', listHoraires[heure-8]);
                            let heurePlusTrente = heure + 1 - 60;
                            let text = heure - 60 + ':00' + ' - ' + heurePlusTrente + ':00' + ' (' + listHoraires[heure-8] + ' places) '
                            let heuremoinsDix = heure-60
                            let variable1 = heuremoinsDix + "sept" + heuremoinsDix
                            document.getElementById(variable1).innerHTML = text;
                            document.getElementById(variable1).setAttribute('value', heure-60 + ' ' + heurePlusTrente);
                        }

                    }
                </script>
            </div>
        </div>


        <g:each in="${results}" var="r" id="1">
            <g:if test="${r.'ouvertLeMidi' == '0'}">
                <script type="text/javascript">
                    var btnCopy = document.getElementById("12prem12");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("12prem12").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("12prem12").innerHTML = '12:00 - 13h00 : Fermé'

                    btnCopy = document.getElementById("12deux12");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("12deux12").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("12deux12").innerHTML = '12:00 - 13h00 : Fermé'

                    btnCopy = document.getElementById("12trois12");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("12trois12").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("12trois12").innerHTML = '12:00 - 13h00 : Fermé'

                    btnCopy = document.getElementById("12quatre12");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("12quatre12").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("12quatre12").innerHTML = '12:00 - 13h00 : Fermé'

                    btnCopy = document.getElementById("12cinq12");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("12cinq12").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("12cinq12").innerHTML = '12:00 - 13h00 : Fermé'

                    btnCopy = document.getElementById("12six12");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("12six12").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("12six12").innerHTML = '12:00 - 13h00 : Fermé'

                    btnCopy = document.getElementById("12sept12");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("12sept12").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("12sept12").innerHTML = '12:00 - 13h00 : Fermé'


                    btnCopy = document.getElementById("13prem13");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("13prem13").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("13prem13").innerHTML = '13:00 - 14h00 : Fermé'
                    btnCopy = document.getElementById("13deux13");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("13deux13").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("13deux13").innerHTML = '13:00 - 14h00 : Fermé'
                    btnCopy = document.getElementById("13trois13");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("13trois13").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("13trois13").innerHTML = '13:00 - 14h00 : Fermé'
                    btnCopy = document.getElementById("13quatre13");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("13quatre13").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("13quatre13").innerHTML = '13:00 - 14h00 : Fermé'
                    btnCopy = document.getElementById("13cinq13");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("13cinq13").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("13cinq13").innerHTML = '13:00 - 14h00 : Fermé'
                    btnCopy = document.getElementById("13six13");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("13six13").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("13six13").innerHTML = '13:00 - 14h00 : Fermé'
                    btnCopy = document.getElementById("13sept13");
                    btnCopy.className += " disabled";
                    btnCopy.onclick = null;
                    document.getElementById("13sept13").style.cssText = 'background-color:#C9C9C9;';
                    document.getElementById("13sept13").innerHTML = '13:00 - 14h00 : Fermé'
                </script>
            </g:if>
        </g:each>

    </div>
</g:else>

<style type="text/css">
.time-picker {
    margin: 10px;
}
.time-picker-header {
    position: relative;
}
.date-slot {
    list-style: none;
    padding: 0;
}
.date-slot-wrapper {
    width: 13%;
    text-align: center;
    float: left;
}
.date-slot-item {
    margin: 0 20px 10px;
    padding: 10px;
    border: 1px solid transparent;

}
.date-slot-item.active {
    border: 1px solid #0279b3;
}
.date-slot-item.no-free-slot > * {
    color: #666;
}
.date-slot-day,
.date-slot-date {
    display: block;
}
.date-slot-day {
    font-size: 16px;
    line-height: 24px;
    color: #666;
}
.date-slot-date {
    font-size: 24px;
    line-height: 36px;
    color: #000;
}
.time-slot {
    list-style: none;
    padding: 0;
    float: left;
    display: inline-block;
    width: 13%;
}
.time-slot-item {
    font-size: 14px;
    line-height: 22px;
    color: #666;
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 10px;
    margin: 10px 20px;
    text-align: center;
    cursor: pointer;
}
.time-slot-item:hover{
    background: #0279b3;
    border-color: #0279b3;
    color: #fff;
}


.time-picker-container {
    width: 900px;
    background: #fff;
    padding: 80px;
}
</style>

    <g:if test="${fieldValue(bean: magasinInstance, field: "ouvertLeMidi") == 'false'}">
        <br><b>Pas ouvert entre 12 et 14h !</b><br>
    </g:if>


<script type="text/javascript">
    var ceciEstUnAutreTest = 0;
    var ladate=new Date()
    var tab_mois=new Array("Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre");
    var getLeMoisSuivant = ladate.getMonth()


    var jourDeLaSemaine = new Date().toLocaleString('en-us', {  weekday: 'long' });
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1).get;
    //console.log("test affichage date : " + tomorrow.getUTCDate());


    var tomorrow = new Date();
    var jourDeLaSemaine = new Date().toLocaleString('fr-fr', {  weekday: 'long' });

    var date = new Date();
    date.setDate(date.getDate() + 1);

    document.getElementById("dayjour1").setAttribute('value', tomorrow.getUTCDate());
    document.getElementById("jour1").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour1").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour2").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour2").innerHTML = tomorrow.getUTCDate()


    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour3").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour3").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour4").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour4").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour5").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour5").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour6").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour6").innerHTML = tomorrow.getUTCDate();

    tomorrow.setDate(tomorrow.getDate() + 1);
    jourDeLaSemaine = date.toLocaleString('fr-fr', {  weekday: 'long' });
    date.setDate(date.getDate() + 1);
    document.getElementById("jour7").innerHTML = jourDeLaSemaine.bold();
    document.getElementById("dayjour7").innerHTML = tomorrow.getUTCDate();

</script>


</body>
</body>
<!-- Footer -->

<!-- Footer -->

<style type="text/css">
footer {
    position:fixed;
    left:0px;
    bottom:0px;
    width:100%;
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
    function hasDuplicates(array) {
        var valuesSoFar = Object.create(null);
        for (var i = 0; i < array.length; ++i) {
            var value = array[i];
            if (value in valuesSoFar) {
                return true;
            }
            valuesSoFar[value] = true;
        }
        return false;
    }

    function contientUnCreneau(array, nombreRepere) {
        var returnIdAndNombreRepere = []
        for (var i = 0; i < array.length; ++i) {
            if (parseInt(array[i]) === nombreRepere + 1) {
                console.log('Different de false')
                var longueurChiffreNB = parseInt(array[i]+1)
                var idRetourne = array[i].substring(longueurChiffreNB, array[i].toString().length - longueurChiffreNB);
                console.log(idRetourne)
                returnIdAndNombreRepere.push(nombreRepere+1)
                returnIdAndNombreRepere.push(idRetourne)
                return returnIdAndNombreRepere;
            }else if(parseInt(array[i]) === nombreRepere - 1){
                console.log('Different de false')
                var longueurChiffreNB = parseInt(array[i]).toString().length;
                var idRetourne = array[i].substring(longueurChiffreNB, array[i].toString().length - longueurChiffreNB);
                returnIdAndNombreRepere.push(nombreRepere-1)
                returnIdAndNombreRepere.push(idRetourne)
                return returnIdAndNombreRepere;
            }
        }
        return false;
    }

    function getOnlyId(array) {
        var onlyIdArray = []

        for (var i = 0; i < array.length; ++i) {
            var longueurChiffreNB = parseInt(array[i]).toString().length;
            var idRetourne = array[i].substring(longueurChiffreNB, array[i].toString().length - longueurChiffreNB);
            onlyIdArray.push(idRetourne)
        }

        return onlyIdArray
    }




    var compteur = 1;
    var listId = []
    var premierNombreRepere = 0;

    function getIdClick(clicked_id)
    {
        ceciEstUnAutreTest = 1
        document.getElementById("testAffichageForm").style.cssText = 'display: block';
        document.getElementById("champNbPlace").style.cssText = 'display: block';
        var x = document.getElementById(clicked_id).value;
        var id = clicked_id;
        console.log('ID : ' + id)
        console.log('Valeur : ' + x)
        listId.push(clicked_id);
        premierNombreRepere = parseInt(listId[0]);

        document.getElementById(listId[0]).style.cssText = 'background-color: #0279b3;border-color: #0279b3;color: #fff;';
        console.log('COMPTEUR : ' + compteur);
        console.log(parseInt(listId[listId.length - 1]) )
        console.log('Nombre repère : ' + premierNombreRepere)
        console.log('Liste : ' + listId);
        console.log('--------------------------')

        if(listId.length > 1) {
            document.getElementById("cestledeuxiemebutton").style.cssText = 'display: block';
            document.getElementById("jefaisdisparaitrelebouton").style.cssText = 'display: none';


        }else if (listId.length === 1){
            document.getElementById("cestledeuxiemebutton").style.cssText = 'display: none';
            document.getElementById("testAffichageForm").style.cssText = 'display: block';
            document.getElementById("jefaisdisparaitrelebouton").style.cssText = 'display: block';
        }

        if(parseInt(listId[listId.length - 1]) + 1 === premierNombreRepere && compteur <= 2 && getOnlyId(listId)[0] == getOnlyId(listId)[listId.length-1] || parseInt(listId[listId.length - 1]) - 1 === premierNombreRepere && compteur <= 2 && getOnlyId(listId)[0] == getOnlyId(listId)[listId.length-1] || parseInt(listId[listId.length - 1]) === premierNombreRepere && compteur <= 2 && getOnlyId(listId)[0] == getOnlyId(listId)[listId.length-1] ) {

            if(hasDuplicates(listId)) {
                if(parseInt(clicked_id) === premierNombreRepere) {
                    console.log('petit deplicata horaire de base');
                    document.getElementById("testAffichageForm").style.cssText = 'display: none';
                    document.getElementById("cestledeuxiemebutton").style.cssText = 'display: none';
                    document.getElementById("champNbPlace").style.cssText = 'display: none';
                    document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                    premierNombreRepere = premierNombreRepere+1
                    listId = []
                    compteur = 1;
                    console.log('Nombre repère : ' + premierNombreRepere)
                    listId.pop();

                }else {
                    console.log('petit deplicata');
                    listId.pop();
                    listId.pop();
                    console.log('Liste : ' + listId);
                    document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                }

            }else {
                console.log('1 de plus ou de moins');
                document.getElementById(clicked_id).style.cssText = 'background-color: #0279b3;border-color: #0279b3;color: #fff;';
                compteur++;
            }
        }

        if(compteur > 2 && hasDuplicates(listId)) {
            if(parseInt(clicked_id) === premierNombreRepere) {
                console.log('petit deplicata horaire de base');
                if(contientUnCreneau(listId, premierNombreRepere) !== false) {
                    console.log('Définition dun autre créneau de référence');
                    premierNombreRepere = contientUnCreneau(listId, premierNombreRepere)[0]
                    console.log('Nombre repère à présent : ' + premierNombreRepere)
                    var newNombreRepere = premierNombreRepere.toString() + contientUnCreneau(listId, premierNombreRepere)[1] + premierNombreRepere.toString()
                    console.log('Return function : ' + contientUnCreneau(listId, premierNombreRepere))
                    console.log('test affichage id : ' + contientUnCreneau(listId, premierNombreRepere)[1])
                    console.log('Nouvel id : ' + newNombreRepere)
                    listId = []

                    listId.push(newNombreRepere)
                    compteur = 1;
                }else {
                    console.log('Aucun créneau de référence')
                    premierNombreRepere = null;
                    listId = [];
                    compteur = 0;
                    document.getElementById("testAffichageForm").style.cssText = 'display: none';
                    document.getElementById("cestledeuxiemebutton").style.cssText = 'display: none';
                }
                document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                console.log('Nombre repère : ' + premierNombreRepere);

            }else {
                console.log('petit deplicata condition compteur > 2');
                document.getElementById("cestledeuxiemebutton").style.cssText = 'display: none';
                document.getElementById("jefaisdisparaitrelebouton").style.cssText = 'display: block';
                listId.pop();
                listId.pop();
                console.log('Liste : ' + listId);
                document.getElementById(clicked_id).style.cssText = 'background-color: none;';
                compteur = 1;
            }
        }
    }

    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }


    function testFonction() {
        var x = document.getElementById(listId[0]).value+1;
        console.log('ID jour : ' + getOnlyId(listId)[0])
        var idDuJour = getOnlyId(listId)[0]

        if(idDuJour == "prem") {
            var date = new Date();
            var laDate = formatDate(date)
            console.log(formatDate(date))
            document.getElementById("dateReservation").setAttribute('value', laDate);
        }

        if(idDuJour == "deux") {
            var date = new Date();
            date.setDate(date.getDate() + 1);
            var laDate = formatDate(date)
            console.log(formatDate(date))
            document.getElementById("dateReservation").setAttribute('value', laDate);
        }

        if(idDuJour == "trois") {
            var date = new Date();
            date.setDate(date.getDate() + 2);
            var laDate = formatDate(date)
            console.log(formatDate(date))
            document.getElementById("dateReservation").setAttribute('value', laDate);
        }

        if(idDuJour == "quatre") {
            var date = new Date();
            date.setDate(date.getDate() + 3);
            var laDate = formatDate(date)
            console.log(formatDate(date))
            document.getElementById("dateReservation").setAttribute('value', laDate);
        }

        if(idDuJour == "cinq") {
            var date = new Date();
            date.setDate(date.getDate() + 4);
            var laDate = formatDate(date)
            console.log(formatDate(date))
            document.getElementById("dateReservation").setAttribute('value', laDate);
        }

        if(idDuJour == "six") {
            var date = new Date();
            date.setDate(date.getDate() + 5);
            var laDate = formatDate(date)
            console.log(formatDate(date))
            document.getElementById("dateReservation").setAttribute('value', laDate);
        }

        if(idDuJour == "sept") {
            var date = new Date();
            date.setDate(date.getDate() + 6);
            var laDate = formatDate(date)
            console.log(formatDate(date))
            document.getElementById("dateReservation").setAttribute('value', laDate);
        }

            console.log('Affichage 1h en plus : ' + x)
            document.getElementById("heureDebutForm").setAttribute('value', document.getElementById(listId[0]).value + ':00:00');
            document.getElementById("heureFinForm").setAttribute('value', x + ':00:00');

            var essaiDeLaValeur =  listId[0] + "nbPlace"

        if(document.getElementById(essaiDeLaValeur).value < 6) {
            document.getElementById("limiteDuCompteur").setAttribute('max', document.getElementById(essaiDeLaValeur).value);
            console.log("places < 6")
        }else {
            document.getElementById("limiteDuCompteur").setAttribute('max', 6);
            console.log('place = 6')
        }
    }


    function secondForm() {
        if (listId.length > 1) {
            testFonction()
            var x = document.getElementById(listId[1]).value+1;
            var y = document.getElementById(listId[0]).value+1;
            console.log('ID jour : ' + getOnlyId(listId)[1])
            var idDuJour = getOnlyId(listId)[1]
            document.getElementById("heureDebutForm3").setAttribute('value', document.getElementById(listId[0]).value + ':00:00');
            document.getElementById("heureDebutForm2").setAttribute('value', document.getElementById(listId[1]).value + ':00:00');
            document.getElementById("nbPlace2").setAttribute('value', document.getElementById("limiteDuCompteur").value);
            document.getElementById("nbPlace3").setAttribute('value', document.getElementById("limiteDuCompteur").value);
            document.getElementById("heureFinForm2").setAttribute('value', x + ':00:00');
            document.getElementById("heureFinForm3").setAttribute('value', y + ':00:00');


            if (idDuJour == "prem") {
                var date = new Date();
                var laDate = formatDate(date)
                console.log(formatDate(date))
                document.getElementById("dateReservation2").setAttribute('value', laDate);
                document.getElementById("dateReservation3").setAttribute('value', laDate);
            }

            if (idDuJour == "deux") {
                var date = new Date();
                date.setDate(date.getDate() + 1);
                var laDate = formatDate(date)
                console.log(formatDate(date))
                document.getElementById("dateReservation2").setAttribute('value', laDate);
                document.getElementById("dateReservation3").setAttribute('value', laDate);
            }

            if (idDuJour == "trois") {
                var date = new Date();
                date.setDate(date.getDate() + 2);
                var laDate = formatDate(date)
                console.log(formatDate(date))
                document.getElementById("dateReservation2").setAttribute('value', laDate);
                document.getElementById("dateReservation3").setAttribute('value', laDate);
            }

            if (idDuJour == "quatre") {
                var date = new Date();
                date.setDate(date.getDate() + 3);
                var laDate = formatDate(date)
                console.log(formatDate(date))
                document.getElementById("dateReservation2").setAttribute('value', laDate);
                document.getElementById("dateReservation3").setAttribute('value', laDate);
            }

            if (idDuJour == "cinq") {
                var date = new Date();
                date.setDate(date.getDate() + 4);
                var laDate = formatDate(date)
                console.log(formatDate(date))
                document.getElementById("dateReservation2").setAttribute('value', laDate);
                document.getElementById("dateReservation3").setAttribute('value', laDate);
            }

            if (idDuJour == "six") {
                var date = new Date();
                date.setDate(date.getDate() + 5);
                var laDate = formatDate(date)
                console.log(formatDate(date))
                document.getElementById("dateReservation2").setAttribute('value', laDate);
                document.getElementById("dateReservation3").setAttribute('value', laDate);
            }

            if (idDuJour == "sept") {
                    var date = new Date();
                    date.setDate(date.getDate() + 6);
                    var laDate = formatDate(date)
                    console.log(formatDate(date))
                    document.getElementById("dateReservation2").setAttribute('value', laDate);
                document.getElementById("dateReservation3").setAttribute('value', laDate);
                }

            var essaiDeLaValeur =  listId[0] + "nbPlace"
            var essaiDeLaValeur1 =  listId[1] + "nbPlace"
            if(document.getElementById(essaiDeLaValeur).value < 6) {
                document.getElementById("limiteDuCompteur").setAttribute('max', document.getElementById(essaiDeLaValeur).value);
            }
            if(document.getElementById(essaiDeLaValeur1).value < 6) {
                document.getElementById("limiteDuCompteur").setAttribute('max', document.getElementById(essaiDeLaValeur1).value);
            }
            }else {
            testFonction()
            document.forms["jetestUnForm"].submit();

        }
    }
</script>




<div id="testAffichageForm" style="display:none;" onclick="testFonction()">
    <div>
        <g:form controller="reservation" >
            <fieldset class="form">
                <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'idMagasin', 'error')}">
                    <g:hiddenField name="idMagasin" value="${fieldValue(bean: magasinInstance, field: "id") }"/>
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'dateReservation', 'error')}">
                    <label for="name">dateReservation</label>
                    <input type="text" id="dateReservation" name="dateReservation">
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'heureDebut', 'error')}">
                    <label for="heureDebut">heureDebut</label>
                    <input type="text"  id="heureDebutForm" class="heureDebut" name="heureDebut">
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'heureFin', 'error')}">
                    <label for="heureFin">heureFin</label>
                    <input type="text"  id="heureFinForm" class="heureFin" name="heureFin">
                </div>

                <div id="champNbPlace" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'nbPlace', 'error')}">
                    <label for="nbPlace">
                        <g:message code="nbPlace.label" default="nombre de place" />
                    </label>
                    <input type="number" id="limiteDuCompteur" name="nbPlace" max="6" value="${ReservationInstance?.nbPlace}" required/>
                </div>

                <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'idPersonne', 'error')}">
                    <g:hiddenField name="idPersonne" value="0"/>
                </div>
            </fieldset>
            <g:actionSubmit id="jefaisdisparaitrelebouton"  name="jetestUnForm" action="create" value="Je valide ma réservation" />
        </g:form>
    </div>







</div>



    <div id="cestledeuxiemebutton" style="display:none;">
        <g:form controller="reservation"  >
            <fieldset class="form">
                <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'idMagasin', 'error')}">
                    <g:hiddenField name="idMagasin" value="${fieldValue(bean: magasinInstance, field: "id") }"/>
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'dateReservation', 'error')}">
                    <label for="name">dateReservation</label>
                    <input type="text" id="dateReservation3" name="dateReservation" value="2021-08-18">
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'heureDebut', 'error')}">
                    <label for="heureDebut">heureDebut</label>
                    <input type="text"  id="heureDebutForm3" class="heureDebut" name="heureDebut">
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'heureFin', 'error')}">
                    <label for="heureFin">heureFin</label>
                    <input type="text"  id="heureFinForm3" class="heureFin" name="heureFin" value="17:00:00">
                </div>

                <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'nbPlace', 'error')}">
                    <g:hiddenField id="nbPlace2" name="nbPlace"/>
                </div>

                <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'idPersonne', 'error')}">
                    <g:hiddenField name="idPersonne" value="0"/>
                </div>
            </fieldset>
            <fieldset class="form">
                <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'idMagasin', 'error')}">
                    <g:hiddenField name="idMagasin" value="${fieldValue(bean: magasinInstance, field: "id") }"/>
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'dateReservation', 'error')}">
                    <label for="name">dateReservation</label>
                    <input type="text" id="dateReservation2" name="dateReservation">
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'heureDebut', 'error')}">
                    <label for="heureDebut">heureDebut</label>
                    <input type="text"  id="heureDebutForm2" class="heureDebut" name="heureDebut">
                </div>

                <div style="display:none;" class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'heureFin', 'error')}">
                    <label for="heureFin">heureFin</label>
                    <input type="text"  id="heureFinForm2" class="heureFin" name="heureFin">
                </div>

                <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'nbPlace', 'error')}">
                    <g:hiddenField id="nbPlace3" name="nbPlace"/>
                </div>

                <div class="fieldcontation ${hasErrors(bean: ReservationInstance, field: 'idPersonne', 'error')}">
                    <g:hiddenField name="idPersonne" value="0"/>
                </div>
            </fieldset>
            <g:actionSubmit name="jetestDeuxForm" action="create2" value="Je valide ma réservation" onclick="secondForm()"/>
        </g:form>
    </div>

</html>

<!--
SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = 1) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = 1 AND reservation.heureDebut = '12:00:01' AND reservation.dateReservation = '2021-08-10') as placeRestantes
-->
