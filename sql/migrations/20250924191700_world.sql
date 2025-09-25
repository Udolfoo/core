DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250924191700');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250924191700');
-- Add your query below.

--Wrong Linking in WC by Druid of the Fang
DELETE FROM creature_groups WHERE leader_guid=33964;

-- Fix Legion Hound Damage in Ashenvale
UPDATE `creature_template` SET `damage_multiplier` = '0.9' WHERE `creature_template`.`entry` = 6071 AND `creature_template`.`patch` = 0;

--Fix All Chests Respawns due to Economy
UPDATE gameobject SET spawntimesecsmin = 7200, spawntimesecsmax = 7200 WHERE id IN ( 2850, 2852, 2855, 4149, 153451, 153453, 153454, 153463, 2843, 2844, 2849, 106318, 106319 );

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
