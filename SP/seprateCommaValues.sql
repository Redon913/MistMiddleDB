
DELIMITER $$
USE `mist_middle`$$

DROP procedure IF EXISTS `separateCommaValues`$$


CREATE PROCEDURE `separateCommaValues`(input_string VARCHAR(255))
BEGIN
    DECLARE value VARCHAR(255);
    DECLARE comma_position INT DEFAULT 0;
    DECLARE string_length INT DEFAULT 0;

    SET string_length = CHAR_LENGTH(input_string);

    CREATE TEMPORARY TABLE temp_values (
        separated_value VARCHAR(255)
    );

    WHILE string_length > 0 DO
        SET comma_position = LOCATE(',', input_string);

        IF comma_position > 0 THEN
            SET value = TRIM(SUBSTRING(input_string, 1, comma_position - 1));
            SET input_string = SUBSTRING(input_string, comma_position + 1);
        ELSE
            SET value = TRIM(input_string);
            SET input_string = '';
        END IF;

        IF value <> '' THEN
            INSERT INTO temp_values (separated_value) VALUES (value);
        END IF;

        SET string_length = CHAR_LENGTH(input_string);
    END WHILE;

    SELECT separated_value FROM temp_values;

    DROP TABLE temp_values;
END $$

DELIMITER ;
