package projet

class User {

    def dataSource
    int id
    String username
    String password
    int role


    User(String username, String password) {
        this.username = username
        this.password = password
        this.role = 0
    }

    int getRole() {
        return this.role;
    }

    static mapping = {
        table 'user'
        version false
        id column: 'id', generator: 'increment'
        username column: 'username'
        password column: 'password'
        role column: 'role'
    }

    static constraints = {
        id(nullable: true)
        username(nullable: false)
        password(nullable: false)
        role(nullable: false)
    }

    String toString() {
        return ""
    }
}
