DELIMITER $$
USE `mist_middle`$$

DROP procedure IF EXISTS `getAllProducts`$$

CREATE PROCEDURE `getAllProducts`(in productId int)
BEGIN
	IF productId = -1 THEN
		SELECT * FROM products;
	else
		SELECT * FROM products p where p.productId = productId;
    end if;
END$$

DROP procedure IF EXISTS `registerUser`$$

CREATE PROCEDURE `registerUser`(in username VARCHAR(30),
                                in firstName varchar(20),
                                in middleName varchar(20),
                                in lastname varchar(20),
                                in mobileNumber varchar(15),
                                in email varchar(30),
                                in gender varchar(3),
                                in address VARCHAR(30),
                                in pincode INT,
                                in password varchar(100)
)
BEGIN
    DECLARE RecordCount int;
    SELECT EXISTS(SELECT * from users u where u.username = username OR u.email = email OR u.mobileNumber = mobileNumber) INTO @RecordCount;

    CASE
		WHEN @RecordCount = 1  THEN
			SELECT @RecordCount;
        WHEN @RecordCount = 0 THEN
			INSERT INTO users(username, firstName, middleName, LastName, mobileNumber, email, gender, address, pincode)
			value(username, firstName, middleName, LastName, mobileNumber, email, gender, address, pincode);
			
			INSERT INTO shadow value(last_insert_id(), password);
	END CASE;
END$$


DROP procedure IF EXISTS `getProductCategory`$$

CREATE PROCEDURE `getProductCategory`()
BEGIN
    SELECT distinct productCategory from products;
END$$


DROP procedure IF EXISTS `getBlogs`$$

CREATE PROCEDURE `getBlogs`(in hotB int)
BEGIN
	if hotB = 1
		THEN
			SELECT * FROM blogs order by pCount desc LIMIT 7;
		ELSE
			SELECT blogid,
					title,
                    left(content,200) as content,
                    image
					FROM blogs;
	end if;
END$$
DELIMITER ;