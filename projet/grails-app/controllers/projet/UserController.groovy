package projet

import grails.gorm.transactions.Transactional
import groovy.sql.GroovyResultSet
import groovy.sql.Sql

class UserController {
    static scaffolding = Magasin
    static allowedMethods = [update: "PUT", save: "POST"]
    static responseFormats = ['html', 'xml', 'json']
    def dataSource
    def currentSession


    def espacePro() { }

    def creationUser() {}

    def login() {
        def getLogin = getLogin(params.usernameUser, params.passwordUser)
        [getLogin:getLogin]
    }

    public List<GroovyResultSet> getLogin(String username, String password) {
        def result = []
        def usernameModif = username
        def passwordModif = password
        Sql sql = new Sql(dataSource)
        result = sql.rows("SELECT * FROM user WHERE username LIKE :usernameLogin and password LIKE :passwordLogin", [usernameLogin:usernameModif, passwordLogin: passwordModif])
        println 'Result : ' + result.size()

        if(result.size() == 0) {
            return result
        }else {
            return result
        }

    }

    @Transactional
    def createUser() {
        def user = new User(params.usernameUser, params.passwordUser).save()
        if(user.hasErrors()) {
            /*
             * On failure, redirect back to registration form,
             * and pass the User instance to the GSP page in the
             * flash scope so that validation errors can be rendered.
             */
            flash.reservationInstance = user
        } else {

            /* On success, place User instance in session scope,
             * and redirect to home page.
             */
            flash.reservationInstance = user
            redirect(action: "espacePro")
        }
    }
}
