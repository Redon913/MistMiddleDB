DELIMITER $$
USE `mist_middle`$$

DROP procedure IF EXISTS `getProductCategory`$$

CREATE PROCEDURE `getProductCategory`()
BEGIN
    SELECT distinct productCategory from products;
END$$
DELIMITER ;