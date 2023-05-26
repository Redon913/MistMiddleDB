DELIMITER $$
USE `mist_middle`$$
DROP procedure IF EXISTS `getBlogs`$$

CREATE PROCEDURE `getBlogs`(in ID int)
BEGIN
	if ID = -1
		THEN
			SELECT * FROM blogs order by pCount desc LIMIT 7;
	ELSEIF ID = 0
		THEN
			SELECT blogId,
					title,
                    left(content,250) as content,
                    image
					FROM blogs;
	ELSE
			SELECT blogId,
					title,
					content,
                    image
					FROM blogs where blogid = ID;
	end if;
END$$
DELIMITER ;