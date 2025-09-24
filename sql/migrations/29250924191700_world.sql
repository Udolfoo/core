DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250817105838');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250817105838');
-- Add your query below.

--Wrong Linking in WC by Druid of the Fang
DELETE FROM creature_groups WHERE leader_guid=33964;

-- Fix Legion Hound Damage in Ashenvale
UPDATE `creature_template` SET `damage_multiplier` = '0.9' WHERE `creature_template`.`entry` = 6071 AND `creature_template`.`patch` = 0;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
