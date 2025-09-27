DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250924191700');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250924191700');
-- Add your query below.

-- Wrong Linking in WC by Druid of the Fang
DELETE FROM creature_groups WHERE `creature_groups`.`member_guid` = 33963;
DELETE FROM creature_groups WHERE `creature_groups`.`member_guid` = 33962;
DELETE FROM creature_groups WHERE `creature_groups`.`member_guid` = 33934;
DELETE FROM creature_groups WHERE `creature_groups`.`member_guid` = 33935;

-- Fix Sweeping Strikes flags (always hit, cant be dodged/parried/blocked)
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `EquippedItemClass`, `Comment`) VALUES (12723, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2359312, -1, 541065344, 262656, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, NULL);
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `EquippedItemClass`, `Comment`) VALUES (26654, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 2359312, -1, 4194432, 262656, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, NULL);

-- Fix Legion Hound Damage in Ashenvale
UPDATE `creature_template` SET `damage_multiplier` = '0.9' WHERE `creature_template`.`entry` = 6071 AND `creature_template`.`patch` = 0;

-- Fix All Chests Respawns due to Economy
UPDATE gameobject SET spawntimesecsmin = 7200, spawntimesecsmax = 7200 WHERE id IN ( 2850, 2852, 2855, 4149, 153451, 153453, 153454, 153463, 2843, 2844, 2849, 106318, 106319 );

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
