-- Данный запрос добавит новый тип астрономического объекта: --
INSERT INTO `astronomy_db`.`body_type` (`type`) VALUES ('Карликовая планета');

-- Данный запрос добавит характеристики астрономического объекта: --
INSERT INTO `astronomy_db`.`chars` (`radius`, `volume`, `mass`, `density`, `gravity`, `has_rings`, `body_type_id`) VALUES
('1188.3', '7.15', '13.105', '2.0', '0.658', 'Нет', '4');

-- Данный запрос добавить астрономический объект: --
INSERT INTO `astronomy_db`.`bodies` (`title`, `chars_id`, `bodies_orbiting_id`) VALUES ('Плутон', '29', '1');

-- Данный запрос удалит астрономический объект: --
DELETE FROM `astronomy_db`.`bodies` WHERE id = (SELECT * FROM (SELECT id FROM `astronomy_db`.`bodies` WHERE title = 'Плутон') AS t1);

-- Данный запрос выведет спутники Сатурна: --
SELECT * FROM bodies WHERE bodies_orbiting_id = (SELECT id FROM bodies WHERE title = 'Сатурн');