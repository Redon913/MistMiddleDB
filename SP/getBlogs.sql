DELIMITER $$
USE `mist_middle`$$
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