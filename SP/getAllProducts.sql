
DELIMITER $$
USE `mist_middle`$$

DROP procedure IF EXISTS `getAllProducts`;

CREATE PROCEDURE `getAllProducts`(in productId int)
BEGIN
	IF productId = -1 THEN
		SELECT * FROM products;
	else
		SELECT * FROM products p where p.productId = productId;
    end if;
END$$

DELIMITER ;