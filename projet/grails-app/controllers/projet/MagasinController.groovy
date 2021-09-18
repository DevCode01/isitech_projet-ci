package projet

import grails.converters.JSON
import grails.converters.XML
import grails.gorm.transactions.Transactional
import groovy.sql.GroovyResultSet
import groovy.sql.Sql
import projet.Magasin

import java.sql.Timestamp
import java.time.LocalDate
import java.util.Date
import java.text.SimpleDateFormat
import groovy.time.TimeCategory
import static java.util.Calendar.*


class MagasinController {
    static scaffolding = Magasin
    static allowedMethods = [update: "PUT", save: "POST"]
    static responseFormats = ['html', 'xml', 'json']
    def dataSource
    def currentSession

    def index() {
        def magasinList = Magasin.list()
        [magasinList: magasinList]
    }

    def main() {
        def magasinList = Magasin.list()
        [magasinList: magasinList]
    }

    def detailMagasin() {
        def magasinList = Magasin.list()
        [magasinList: magasinList]
    }

    def edit() {
        [magasinInstance: Magasin.get(params.id), magasinList: magasinList]
    }

    def show() {
        [magasinInstance: Magasin.get(params.id)]
    }


    def listeResa() {
        def results = ceciEstUnTest(params.id)
        def getByHoraire = getMagasinsInFrance(params.id)
        [results: results,magasinInstance: Magasin.get(params.id), getByHoraire:getByHoraire]
    }

    def searchBarResult() {
        def searchBar = searchBar(params.nomDuMagasin, params.codePostal)
        [searchBar:searchBar]
    }




    @Transactional
    def create() {
        def magasin = new Magasin(params).save()

        if(magasin.hasErrors()) {
            /*
             * On failure, redirect back to registration form,
             * and pass the User instance to the GSP page in the
             * flash scope so that validation errors can be rendered.
             */
            flash.magasinInstance = magasin
            redirect uri: '/magasin'
        } else {
            /* On success, place User instance in session scope,
             * and redirect to home page.
             */
            flash.magasinInstance = magasin
            session.magasin = magasin
            redirect uri: '/magasin'
        }
    }





    public Magasin ceciEstUnTest(String ID) {
        Magasin.get(ID.toInteger())
    }




    public List<GroovyResultSet> getMagasinsInFrance(String ID) {
        def idDuMagasin = ID.toInteger()
        def result = []
        def dt = new Date()
        def sdf = new SimpleDateFormat("yyyy-MM-dd")
        println sdf.format(dt)
        def datePlusUn = use(TimeCategory){new Date() + 1.days}
        println sdf.format(datePlusUn)
        def datePlusDeux = use(TimeCategory){new Date() + 2.days}
        println sdf.format(datePlusDeux)
        def datePlusTrois = use(TimeCategory){new Date() + 3.days}
        println sdf.format(datePlusTrois)
        def datePlusQuatre = use(TimeCategory){new Date() + 4.days}
        println sdf.format(datePlusQuatre)
        def datePlusCinque = use(TimeCategory){new Date() + 5.days}
        println sdf.format(datePlusCinque)
        def datePlusSix = use(TimeCategory){new Date() + 6.days}
        println sdf.format(datePlusSix)
        println "Affichage : " + sdf.format(dt)


        Sql sql = new Sql(dataSource)

        result = sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '08:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '09:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '10:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '11:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour: sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '12:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '13:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '14:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '15:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '16:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '17:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(dt)])


        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '08:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '09:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '10:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '11:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour: sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '12:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '13:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '14:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '15:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '16:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '17:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusUn)])

        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '08:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '09:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '10:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '11:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour: sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '12:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '13:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '14:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '15:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '16:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '17:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusDeux)])

        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '08:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '09:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '10:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '11:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour: sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '12:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '13:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '14:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '15:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '16:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin2) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '17:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusTrois)])

        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '08:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '09:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '10:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '11:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '12:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '13:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '14:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '15:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '16:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '17:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusQuatre)])

        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '08:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '09:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '10:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '11:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour: sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '12:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '13:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '14:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '15:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '16:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '17:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusCinque)])

        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '08:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '09:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '10:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '11:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '12:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '13:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '14:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '15:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '16:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])
        result += sql.rows("SELECT (SELECT magasin.placeTotale FROM magasin WHERE magasin.ID = :idDuMagasin) - (SELECT SUM(reservation.nbPlace) FROM reservation WHERE reservation.iddumagasin = :idDuMagasin AND reservation.heureDebut = '17:00:00' AND reservation.dateReservation = :dateDuJour) as placeRestantes", [idDuMagasin:idDuMagasin, dateDuJour:sdf.format(datePlusSix)])


        println result
        println sdf.format(datePlusSix)
        println "ID : " + idDuMagasin
        return result

    }


    protected void notFound(String messageCode = null) {
        messageCode = messageCode ?: 'default.not.found.message'
        withFormat {
            html {
                flash.message = message(code: messageCode, args: [message(default: 'Magasin'), params.id])
                redirect action: "index", method: "GET"
            }
        }
    }

    public List<GroovyResultSet> searchBar(String nomDuMagasin, String codePostal) {

        println 'nom magasin : ' + nomDuMagasin
        println 'code postal : ' + codePostal
        def result = []
        Sql sql = new Sql(dataSource)
        def nomDuMagasinModif = '%'+nomDuMagasin+'%'
        if(codePostal == null) {
            result = sql.rows("SELECT magasin.ID, magasin.nom, magasin.adresse, magasin.placeTotale, magasin.identifiantVille, magasin.iddelacategorie, magasin.ville_id, magasin.categorie_id, magasin.horaireOuverture, magasin.horaireFermeture, magasin.ouvertleMidi, ville.codePostal, ville.nomVille FROM magasin, ville   WHERE nom LIKE :nomDuMagasin AND magasin.identifiantVille = ville.ID", [nomDuMagasin:nomDuMagasinModif])

        }else {
            def codePostalModif = '%'+codePostal+'%'
            result = sql.rows("SELECT magasin.ID, magasin.nom, magasin.adresse, magasin.placeTotale, magasin.identifiantVille, magasin.iddelacategorie, magasin.ville_id, magasin.categorie_id, magasin.horaireOuverture, magasin.horaireFermeture, magasin.ouvertleMidi, ville.codePostal, ville.nomVille FROM magasin, ville  WHERE magasin.nom LIKE :nomDuMagasin AND ville.codePostal LIKE :codePostal AND magasin.identifiantVille = ville.ID", [nomDuMagasin:nomDuMagasinModif, codePostal: codePostalModif])
        }

        if(result == []) {
            result.add('null')
        }
        println 'Result : ' + result
        return result
    }
}
