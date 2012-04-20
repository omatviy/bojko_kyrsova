-- TRUNCATE `nations`;
-- for PG use double quote for table/column names

--CREATE LANGUAGE plpgsql;

--TRUNCATE "nations";

-- id of the US is hardcoded to 1
--INSERT INTO "nations" ("id", "region_id", "display_order", "name", "tel_code") VALUES (1, 0, 1, 'United States', '1');
-- REINDEX INDEX nations_id;
DELETE from "nations";

INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 1, 'United States', '1');
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Afghanistan', NULL); 
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Albania', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Albania', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Algeria', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'American Samoa', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Andorra', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Angola', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Anguilla', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Antigua & Barbuda', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Russia', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Spain', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Swaziland', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Sweden', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Switzerland', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Syria', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Taiwan', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Tajikistan', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Tanzania', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Thailand', NULL);
INSERT INTO "nations" ("region_id", "display_order", "name", "tel_code") VALUES (0, 2, 'Ukraine', NULL);

