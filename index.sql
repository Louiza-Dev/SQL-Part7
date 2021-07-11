-- Charger et exécuter le ficher bdd.sql
SOURCE bdd.sql;

-- Exo 1
-- Afficher tous les cadres associés à leurs langages. Si un langage n'a pas de framework l'affiche aussi.
SELECT * FROM languages AS lng LEFT JOIN frameworks AS frmk ON lng.id = frmk.languagesId;

-- Exo 2
-- Afficher tous les cadres associés à leurs langages. Si un langage n'a pas de framework ne l'affiche pas.
SELECT * FROM languages INNER JOIN frameworks ON languages.id = frameworks.languagesId;
SELECT * FROM languages INNER JOIN frameworks WHERE languages.id = frameworks.languagesId;
SELECT languages.name , frameworks.name FROM languages JOIN frameworks ON
languages.id = frameworks.languagesId;

-- Exo 3
-- Afficher le nombre de framework qu'un langage.
-- SELECT `languagesId`, GROUP_CONCAT(`name`) AS lang_frmw FROM `frameworks`  GROUP BY `languagesId`;
--
-- SELECT languages.name, SUM(`languagesId`) AS lang_frmw FROM `languages`, `frameworks`  GROUP BY `languagesId`;
--
-- SELECT `languagesId`, `name`, GROUP_CONCAT(`languagesId`) AS lang_frmw FROM `frameworks`  GROUP BY `languagesId`;
--
-- SELECT `name`, GROUP_CONCAT(`frameworks` SEPARATOR " ") AS lang_frmw FROM `languages`
-- LEFT JOIN `languages` ON `languagesId` = `languages`.`id` GROUP BY `languages`.`name`;
--
-- SELECT `id`, `name`, GROUP_CONCAT(`languagesId`) AS lang_frmw FROM `languages`
-- LEFT JOIN `frameworks` ON `languagesId` = `languages`.`id` GROUP BY `languagesId`;
--
-- SELECT languages.name, GROUP_CONCAT(languagesId) FROM languages JOIN frameworks
-- ON `languagesId` = `languages`.`id` GROUP BY `name`;
--
-- SELECT languages.name, GROUP_CONCAT(frameworks.name), COUNT(`languagesId`) FROM languages
-- JOIN frameworks  ON `languagesId` = `languages`.`id` GROUP BY `languagesId`;
--
-- SELECT languages.name, GROUP_CONCAT(frameworks.name), COUNT(`languagesId`) FROM languages
-- JOIN frameworks  ON `languagesId` = `languages`.`id` GROUP BY `languagesId`;

SELECT languages.name, COUNT(`languagesId`) FROM languages LEFT JOIN frameworks
  ON `languagesId` = `languages`.`id` GROUP BY `languagesId`;

  SELECT languages.name, COUNT(`languagesId`) FROM languages RIGHT JOIN frameworks
    ON `languagesId` = `languages`.`id` GROUP BY `languagesId`;
-- Exo 4
-- Afficher les langages ayant plus de 3 frameworks.


SELECT  languages.name, COUNT(frameworks.name) FROM languages JOIN frameworks
ON languages.id = frameworks.languagesId
GROUP BY languages.name HAVING COUNT(frameworks.name) > 3;

SELECT  languages.name, COUNT(`languagesId`) FROM languages JOIN frameworks
ON languages.id = frameworks.languagesId
GROUP BY `name` HAVING COUNT(`languagesId`) > 3;


SELECT languages.name, COUNT(frameworks.name) FROM languages JOIN frameworks
   ON languages.id = frameworks.languagesId
   GROUP BY languages.name HAVING COUNT(frameworks.name) > 3;











SELECT * FROM languages LEFT JOIN frameworks ON languages.id = frameworks.languagesId;
