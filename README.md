# База данных астрономических объектов солнечной системы.

Данная база данных содержит информацию об астрономических объектах солнечной системы и исторические события связанные с ними.

## Типовые запросы к базе:

Данный запрос добавит новый тип астрономического объекта:
```sql
INSERT INTO `astronomy_db`.`body_type` (`type`) VALUES ('Карликовая планета');
```

Данный запрос добавит характеристики астрономического объекта:
```sql
INSERT INTO `astronomy_db`.`chars` (`radius`, `volume`, `mass`, `density`, `gravity`, `has_rings`, `body_type_id`) VALUES
('1188.3', '7.15', '13.105', '2.0', '0.658', 'Нет', '4');
```

Данный запрос добавить астрономический объект:
```sql
INSERT INTO `astronomy_db`.`bodies` (`title`, `chars_id`, `bodies_orbiting_id`) VALUES ('Плутон', '29', '1');
```

Данный запрос удалит астрономический объект:
```sql
DELETE FROM `astronomy_db`.`bodies` WHERE title = 'Плутон';
```

Данный запрос выведет спутники Сатурна:
```sql
SELECT * FROM bodies WHERE bodies_orbiting_id = (SELECT id FROM bodies WHERE title = 'Сатурн');
```

Для запуска данной базы данных требуется:
- MySQL 8.*

Для запуска базы данных, используйте [файл](https://github.com/TheHexReader/course_work_astronomy_db/blob/main/dump_astronomy_db.sql) дампа