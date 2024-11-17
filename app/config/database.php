<?php

include('../models/constants.php');

class Database {
    /**
     * Path to the file with database credentials.
     */
    private const PATH_TO_SECRETS = "../secrets.json";

    /**
     * Connection to the database.
     */
    private $connector;

    /**
     * Creates a new Database instance.
     * 
     * Establishes a connection to a database using the provided configuration.
     * The configuration file is located at the root of the application and is
     * named 'config.json'. It should contain the following keys:
     * - DBMS: the database management system.
     * - DB_HOST: the hostname or the IP address of the database server.
     * - DB_NAME: the name of the database to use.
     * - DB_CHARSET: the character set to use.
     * - DB_USER: the username for database authentification.
     * - DB_PASSWORD: the password for database authentification. 
     * 
     * @throws Exception If there is an error reading the config file.
     * @throws PDOException If the connection to the database fails.
     */
    public function __construct() {
        try {
            // Attempt to read the secrets.json file
            $file = file_get_contents(self::PATH_TO_SECRETS);
            $conf = json_decode($file, true);

            // Create DSN
            $dsn = $conf['DBMS'] . ":";
            $dsn .= "host=" . $conf['DB_HOST'] . ";";
            $dsn .= "dbname=" . $conf['DB_NAME'] . ";";
            $dsn .= "charset=" . $conf['DB_CHARSET'];
        } catch (Exception $e) {
            die(
                Constants::ERROR_READING_FILE
                . $e->getMessage()
            );
        }

        try {
            // Attempt to establish a connection to the database
            $this -> connector = new PDO(
                $dsn,
                $conf['DB_USER'],
                $conf['DB_PASSWORD']
            );
        } catch (PDOException $e) {
            // Kill the application if connection fails
            die(
                Constants::ERROR_CONNECTING_TO_DATABASE 
                . $e -> getMessage()
            );
        }
    }
}

?>