<?php

/**
 * Holds application-wide constants.
 */
class Constants {
    /**
     * Error message to display when the connection to the database failed.
     */
    const ERROR_CONNECTING_TO_DATABASE =
        "An error occured when connecting to the database: ";

    /**
     * Error message to display when there was an error reading a file such as
     * secrets.json.
     */
    const ERROR_READING_FILE = 
        "An error occured while reading the file: ";
}

?>