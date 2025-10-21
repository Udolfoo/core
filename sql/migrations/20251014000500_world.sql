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

-- Make Cuergo's Gold repeatable
UPDATE `quest_template` SET `SpecialFlags` = '1' WHERE `quest_template`.`entry` = 2882 AND `quest_template`.`patch` = 0;

-- Fix Egg Freezing Quest Chain
UPDATE `quest_template` SET `BreadcrumbForQuestId` = '0' WHERE `quest_template`.`entry` = 4907 AND `quest_template`.`patch` = 0;
UPDATE `quest_template` SET `PrevQuestId` = '4907' WHERE `quest_template`.`entry` = 4734 AND `quest_template`.`patch` = 0;

-- Remove Pooling from Serpentbloom in WC
DELETE pg
FROM pool_gameobject AS pg
LEFT JOIN pool_template AS pt ON pt.entry = pg.pool_entry
WHERE pg.description = 'Wailing Caverns - Serpentbloom'
   OR pt.description IN ('Wailing Caverns - Serpentbloom',
                         'Wailing Caverns - Serpentbloom (Master Pool)');

DELETE pp
FROM pool_pool AS pp
LEFT JOIN pool_template AS pt ON pt.entry = pp.mother_pool
WHERE pp.description = 'Wailing Caverns - Serpentbloom'
   OR pt.description = 'Wailing Caverns - Serpentbloom (Master Pool)';


DELETE FROM pool_template
WHERE description IN ('Wailing Caverns - Serpentbloom',
                      'Wailing Caverns - Serpentbloom (Master Pool)');

DELETE FROM gameobject
WHERE id = 19535
  AND map = 43;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
