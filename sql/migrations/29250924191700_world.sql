DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250817105838');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250817105838');
-- Add your query below.

//Wrong Linking in WC by Druid of the Fang
DELETE FROM creature_groups WHERE leader_guid=33964;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
