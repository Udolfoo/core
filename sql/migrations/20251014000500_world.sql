DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251014000500');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251014000500');
-- Add your query below.

-- Fix Skinable Mobs in Dustwallow Marsh
UPDATE `skinning_loot_template`
SET `groupid` = 1
WHERE `groupid` = 0
  AND `entry` IN (
    4356,4355,4388,4343,4398,4397,4396,4357,4352,4345,4342,4344,4351,4341,
    4329,4334,4328,4323,4331,4324,
    14232,14233,14234,4841,4339,10321
  );

-- Fix Supply Chests in Stratholme
UPDATE `gameobject_template` SET `size` = '0.99' WHERE `gameobject_template`.`entry` = 175535 AND `gameobject_template`.`patch` = 0;
UPDATE gameobject_template
SET
  data2 = 0,
  data4 = 2
WHERE entry = 175535 AND type = 6;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
