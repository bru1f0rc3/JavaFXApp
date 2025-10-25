-- ============================================
-- Скрипт вставки данных для БД production
-- ============================================

-- 1. Вставка единиц измерения
INSERT INTO public.units (name) VALUES 
('м'),
('кг'),
('шт');

-- 2. Вставка типов материалов (извлечено из CSV)
INSERT INTO public.material_types (title, defected_percent) VALUES 
('Вата', 0.95),
('Ткань', 0.12),
('Стержень', 0.55),
('Силикон', 0.46),
('Резинка', 0.15);

-- 3. Вставка материалов из materials_short_s_import.csv
-- Формат: title, count_in_pack, unit_id, count_in_stock, min_count, cost, material_type_id
-- ПОЛНЫЙ СПИСОК ВСЕХ 50 МАТЕРИАЛОВ
INSERT INTO public.materials (title, count_in_pack, unit_id, count_in_stock, min_count, cost, material_type_id) VALUES 
('Вата серый 1x1', 7, 1, 191, 34, 6009.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Ткань белый 2x2', 10, 1, 713, 18, 13742.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Металлический стержень белый 0x2', 9, 2, 280, 12, 10633.00, (SELECT material_type_id FROM public.material_types WHERE title='Стержень')),
('Силикон серый 1x1', 2, 1, 981, 12, 2343.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Силикон белый 0x3', 8, 2, 307, 17, 12097.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Силикон белый 1x3', 4, 2, 345, 46, 13550.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Ткань серый 0x3', 10, 1, 965, 17, 15210.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Резинка зеленый 1x0', 8, 2, 256, 9, 32616.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Металлический стержень белый 2x2', 9, 1, 65, 36, 36753.00, (SELECT material_type_id FROM public.material_types WHERE title='Стержень')),
('Ткань синий 3x3', 5, 1, 387, 39, 32910.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Ткань белый 3x2', 9, 1, 398, 25, 782.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Вата розовый 1x0', 3, 1, 589, 32, 35776.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Вата серый 3x2', 5, 2, 471, 40, 20453.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Ткань розовый 0x0', 3, 1, 654, 29, 41101.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Металлический стержень цветной 3x1', 4, 1, 988, 49, 55742.00, (SELECT material_type_id FROM public.material_types WHERE title='Стержень')),
('Резинка синий 1x0', 3, 2, 191, 11, 1407.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Металлический стержень цветной 1x2', 8, 1, 173, 26, 26137.00, (SELECT material_type_id FROM public.material_types WHERE title='Стержень')),
('Ткань цветной 2x1', 2, 1, 993, 34, 15628.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Силикон белый 2x0', 10, 1, 851, 38, 22538.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Силикон зеленый 3x1', 2, 1, 776, 46, 17312.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Вата серый 3x3', 1, 2, 237, 12, 19528.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Вата белый 2x0', 8, 2, 983, 49, 38432.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Вата розовый 3x1', 3, 2, 246, 41, 44015.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Ткань синий 2x0', 4, 1, 146, 16, 19507.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Металлический стержень зеленый 2x2', 4, 1, 478, 34, 32205.00, (SELECT material_type_id FROM public.material_types WHERE title='Стержень')),
('Резинка зеленый 0x0', 7, 1, 594, 19, 42640.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Ткань синий 0x2', 8, 2, 841, 21, 27338.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Ткань зеленый 2x2', 4, 1, 692, 7, 55083.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Металлический стержень синий 0x1', 9, 1, 259, 20, 19715.00, (SELECT material_type_id FROM public.material_types WHERE title='Стержень')),
('Резинка белый 3x3', 1, 1, 586, 26, 35230.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Резинка зеленый 3x0', 10, 2, 976, 40, 41227.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Ткань белый 1x3', 8, 1, 492, 9, 38232.00, (SELECT material_type_id FROM public.material_types WHERE title='Ткань')),
('Силикон цветной 1x0', 10, 1, 843, 28, 34664.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Силикон зеленый 0x3', 9, 2, 124, 35, 24117.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Вата серый 0x1', 8, 1, 25, 38, 42948.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Металлический стержень белый 3x1', 9, 1, 749, 30, 9136.00, (SELECT material_type_id FROM public.material_types WHERE title='Стержень')),
('Резинка синий 3x1', 4, 2, 232, 36, 36016.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Металлический стержень синий 3x1', 6, 1, 336, 24, 26976.00, (SELECT material_type_id FROM public.material_types WHERE title='Стержень')),
('Силикон белый 1x2', 2, 1, 793, 30, 33801.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Резинка цветной 1x1', 8, 1, 347, 13, 26244.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Силикон розовый 1x3', 9, 1, 997, 25, 33874.00, (SELECT material_type_id FROM public.material_types WHERE title='Силикон')),
('Резинка синий 3x2', 5, 1, 284, 31, 44031.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Резинка розовый 1x0', 1, 1, 265, 21, 36574.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Резинка зеленый 0x3', 8, 2, 856, 17, 45349.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Резинка цветной 0x1', 8, 1, 290, 32, 47198.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Вата розовый 3x3', 10, 1, 536, 31, 2517.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Резинка цветной 0x2', 10, 1, 189, 31, 55495.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Вата серый 3x0', 8, 2, 48, 32, 49181.00, (SELECT material_type_id FROM public.material_types WHERE title='Вата')),
('Резинка серый 3x3', 4, 1, 373, 8, 51550.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка')),
('Резинка серый 0x0', 7, 1, 395, 20, 43414.00, (SELECT material_type_id FROM public.material_types WHERE title='Резинка'));

-- 4. Вставка типов продукции (извлечено из CSV)
INSERT INTO public.product_types (title, defected_percent) VALUES 
('Полумаски', 1.42),
('Повязки', 2.87),
('Маски', 3.51),
('Респираторы', 2.35),
('На лицо', 1.25),
('Полнолицевые', 0.95),
('Сменные части', 0.75),
('Запасные части', 0.80),
('Держители', 0.50),
('Предфильтры', 0.60);

-- 5. Вставка продукции из products_s_import.csv
-- Формат: article_number, title, product_type_id, image, production_person_count, production_workshop_number, min_cost_for_agent
-- ПОЛНЫЙ СПИСОК ВСЕХ 100 ПРОДУКТОВ
INSERT INTO public.products (article_number, title, product_type_id, image, production_person_count, production_workshop_number, min_cost_for_agent) VALUES 
('59922', 'Полумаска "Moon" (Элипс) P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd1e2b9.jpg', 5, 4, 2690.00),
('5028556', 'Повязка санитарно–гигиеническая многоразовая с логотипом СОЮЗСПЕЦОДЕЖДА', (SELECT product_type_id FROM public.product_types WHERE title='Повязки'), NULL, 5, 9, 49.00),
('5028272', 'Повязка санитарно–гигиеническая многоразовая черная', (SELECT product_type_id FROM public.product_types WHERE title='Повязки'), NULL, 4, 4, 59.00),
('5028247', 'Маска одноразовая трехслойная из нетканого материала, нестерильная', (SELECT product_type_id FROM public.product_types WHERE title='Повязки'), '\products\5fb128cc69235.jpg', 3, 2, 6.00),
('5028229', 'Повязка санитарно–гигиеническая многоразовая с принтом', (SELECT product_type_id FROM public.product_types WHERE title='Повязки'), NULL, 2, 10, 49.00),
('5030981', 'Маска из нетканого материала KN95', (SELECT product_type_id FROM public.product_types WHERE title='Маски'), '\products\5fb128cc719a6.jpg', 3, 5, 59.00),
('5029784', 'Маска из нетканого материала с клапаном KN95', (SELECT product_type_id FROM public.product_types WHERE title='Маски'), '\products\5fb128cc753e3.jpg', 3, 4, 79.00),
('58953', 'Респиратор У-2К', (SELECT product_type_id FROM public.product_types WHERE title='Маски'), '\products\5fb128cc7941f.jpg', 2, 6, 95.00),
('5026662', 'Респиратор 9101 FFP1', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc7d798.jpg', 5, 8, 189.00),
('59043', 'Респиратор противоаэрозольный 9312', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc80a10.jpg', 4, 7, 399.00),
('58376', 'Респиратор 3M 8112 противоаэрозольный с клапаном выдоха', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc84474.jpg', 3, 1, 299.00),
('58375', 'Респиратор 3M 8101 противоаэрозольный', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc87b90.jpg', 1, 4, 149.00),
('59324', 'Респиратор "Алина" 110', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8b750.jpg', 3, 9, 129.00),
('58827', 'Респиратор "Алина" 100', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8f4dd.jpg', 2, 8, 99.00),
('59898', 'Респиратор "Нева" 109', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc9414b.jpg', 4, 1, 129.00),
('59474', 'Респиратор "Юлия" 109', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc97ff4.jpg', 4, 8, 129.00),
('59472', 'Респиратор "Юлия" 119', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc9bd36.jpg', 3, 7, 149.00),
('5033136', 'Респиратор 3M с клапаном 9162', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc9f069.jpg', 2, 9, 349.00),
('5028048', 'Респиратор 3M 9152 FFP2', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cca31d9.jpg', 2, 8, 390.00),
('58796', 'Респиратор противоаэрозольный 9322', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cca6910.jpg', 4, 4, 449.00),
('58568', 'Респиратор с клапаном 9926', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cca9d9b.jpg', 3, 5, 699.00),
('58466', 'Респиратор 3M 8102 противоаэрозольный', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccae21a.jpg', 3, 9, 199.00),
('58445', 'Респиратор 3M 8122', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccb1958.jpg', 3, 6, 299.00),
('5031919', 'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccb4e8c.jpg', 2, 8, 349.00),
('5030026', 'Респиратор RK6021', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccb97a0.jpg', 5, 8, 290.00),
('5030020', 'Респиратор RK6020', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccbd227.jpg', 3, 5, 129.00),
('5030072', 'Респиратор Алина 210', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccc1592.jpg', 1, 5, 290.00),
('5030062', 'Респиратор Алина 211', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccc4a86.jpg', 1, 6, 290.00),
('58826', 'Респиратор "Алина" 200', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccc9a9e.jpg', 4, 5, 149.00),
('58825', 'Респиратор "Алина" П', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cccdbee.jpg', 4, 5, 290.00),
('58584', 'Респиратор "Алина" АВ', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccd133c.jpg', 2, 5, 249.00),
('59736', 'Респиратор "Нева" 210', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccd5dc2.jpg', 1, 3, 109.00),
('59735', 'Респиратор "Нева" 200', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccd8ff6.jpg', 2, 3, 79.00),
('5027238', 'Респиратор полумаска НРЗ-0102 FFP2 NR D', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccdca1e.jpg', 4, 4, 149.00),
('59475', 'Респиратор "Юлия" 219', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cce0042.jpg', 4, 8, 249.00),
('59473', 'Респиратор "Юлия" 215', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cce39fa.jpg', 3, 4, 349.00),
('59470', 'Респиратор "Юлия" 209', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cce7971.jpg', 2, 8, 179.00),
('5031924', 'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cceae7c.jpg', 5, 2, 490.00),
('5030022', 'Респиратор RK6030', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccef256.jpg', 3, 6, 390.00),
('58850', 'Респиратор "Алина" 310', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128ccf3dd2.jpg', 5, 6, 490.00),
('59739', 'Респиратор "Нева" 310', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cd0544b.jpg', 4, 3, 289.00),
('59471', 'Респиратор "Юлия" 319', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cd08e3f.jpg', 4, 8, 490.00),
('5027980', 'Полумаска "Elipse" (Элипс) ABEK1P3', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cd0d0b1.jpg', 2, 1, 4990.00),
('5027965', 'Полумаска "Elipse" (Элипс) A2P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd10ec2.jpg', 4, 2, 4490.00),
('5027958', 'Полумаска "Elipse" (Элипс) А1', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd157f9.jpg', 2, 4, 3190.00),
('59923', 'Полумаска "Elipse" (Элипс) P3 (анти-запах)', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd19baa.jpg', 1, 9, 2790.00),
('59922', 'Полумаска "Elipse" (Элипс) P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd1e2b9.jpg', 5, 4, 2690.00),
('59921', 'Полумаска "Elipse" (Элипс) A1P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd2215f.jpg', 3, 9, 5690.00),
('59920', 'Полумаска "Elipse" (Элипс) ABEK1', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd268bf.jpg', 2, 8, 5690.00),
('58974', 'Респиратор-полумаска "3М" серия 6000', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd2ab69.jpg', 5, 9, 3490.00),
('59334', 'Респиратор-полумаска Исток 300/400', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd2ef7a.jpg', 4, 7, 490.00),
('4969295', 'Комплект для защиты дыхания J-SET 6500 JETA', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd331c4.jpg', 4, 4, 2490.00),
('5029610', 'Лицевая маска Elipse Integra А1P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd3674d.jpg', 2, 10, 9890.00),
('5029091', 'Лицевая маска Elipse Integra P3', (SELECT product_type_id FROM public.product_types WHERE title='На лицо'), '\products\5fb128cd3af5c.jpg', 5, 9, 7490.00),
('60360', 'Лицевая маска Elipse Integra (Элипс интегра) P3 (анти-запах)', (SELECT product_type_id FROM public.product_types WHERE title='На лицо'), '\products\5fb128cd3e7e4.jpg', 2, 4, 7590.00),
('4958042', 'Полнолицевая маска 5950 JETA', (SELECT product_type_id FROM public.product_types WHERE title='На лицо'), '\products\5fb128cd41ece.jpg', 1, 5, 11490.00),
('59271', 'Сменный патрон с фильтром 6054 для масок и полумасок "3М" серии 6000', (SELECT product_type_id FROM public.product_types WHERE title='Полнолицевые'), '\products\5fb128cd4672c.jpg', 4, 2, 1890.00),
('59253', 'Сменный патрон с фильтром 6059 для масок и полумасок "3М" серии 6000', (SELECT product_type_id FROM public.product_types WHERE title='Сменные части'), '\products\5fb128cd4c99d.jpg', 2, 9, 2290.00),
('5028197', 'Сменный фильтр 6510 A1 JETA', (SELECT product_type_id FROM public.product_types WHERE title='Сменные части'), '\products\5fb128cd50a70.jpg', 5, 9, 990.00),
('5027978', 'Запасные фильтры к полумаске Elipse ABEK1P3', (SELECT product_type_id FROM public.product_types WHERE title='Сменные части'), '\products\5fb128cd5433e.jpg', 3, 6, 2990.00),
('5027961', 'Запасные фильтры к полумаске Elipse A2P3', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd5838d.jpg', 2, 9, 2590.00),
('5027921', 'Запасные фильтры к полумаске Elipse (Элипс) А1', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd5bb7d.jpg', 3, 4, 1290.00),
('4958040', 'Сменный фильтр 6541 ABEK1 JETA', (SELECT product_type_id FROM public.product_types WHERE title='Сменные части'), '\products\5fb128cd5ff78.jpg', 4, 6, 1290.00),
('59919', 'Запасные фильтры к полумаске "Elipse" (Элипс) P3 (анти-запах)', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd63666.jpg', 4, 4, 1690.00),
('59918', 'Запасные фильтры к полумаске "Elipse" (Элипс) P3', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd66df6.jpg', 4, 7, 1390.00),
('59917', 'Запасные фильтры к полумаске "Elipse" (Элипс) A1P3', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd6a2b6.jpg', 1, 3, 2190.00),
('59916', 'Запасные фильтры к полумаске "Elipse" (Элипс) ABEK1', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd6e4ee.jpg', 3, 10, 2590.00),
('59708', 'Запасные фильтры (пара) АВЕ1 к полумаскам "Адвантейдж"', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd71db3.jpg', 2, 3, 1490.00),
('67661', 'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка В', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd7518c.jpg', 5, 9, 110.00),
('67660', 'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка А', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd78fce.jpg', 3, 1, 110.00),
('4958041', 'Держатель предфильтра 5101 JETA', (SELECT product_type_id FROM public.product_types WHERE title='Запасные части'), '\products\5fb128cd7d2cd.jpg', 1, 7, 199.00),
('58431', 'Держатели предфильтра для масок и полумасок "3М" серии 6000', (SELECT product_type_id FROM public.product_types WHERE title='Держители'), '\products\5fb128cd80a06.jpg', 1, 4, 264.00),
('4958039', 'Предфильтр Р2 (4 шт) 6020 JETA', (SELECT product_type_id FROM public.product_types WHERE title='Держители'), '\products\5fb128cd8417e.jpg', 1, 7, 380.00),
('58917', 'Предфильтры для масок и полумасок "3М" серии 6000', (SELECT product_type_id FROM public.product_types WHERE title='Предфильтры'), '\products\5fb128cd8818d.jpg', 5, 3, 409.00),
('59325', 'Респиратор "Мадонна" 110', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8b750.jpg', 3, 9, 129.00),
('58828', 'Респиратор "Витязь" 100', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8f4dd.jpg', 2, 8, 99.00),
('59899', 'Респиратор "Серёга" 109', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc9414b.jpg', 4, 1, 129.00),
('59476', 'Респиратор "Амперметр" 109', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc97ff4.jpg', 4, 8, 129.00),
('59326', 'Респиратор "Фирюза" 110', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8b750.jpg', 3, 9, 129.00),
('58829', 'Респиратор "Красный" 100', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8f4dd.jpg', 2, 8, 99.00),
('59900', 'Респиратор "Волга" 109', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc9414b.jpg', 4, 1, 129.00),
('59477', 'Респиратор "Мадонна" 220', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc97ff4.jpg', 4, 8, 129.00),
('59327', 'Респиратор "Витязь" 220', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8b750.jpg', 3, 9, 129.00),
('58830', 'Респиратор "Серёга" 220', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8f4dd.jpg', 2, 8, 99.00),
('59901', 'Респиратор "Амперметр" 220', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc9414b.jpg', 4, 1, 129.00),
('59478', 'Респиратор "Фирюза" 220', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc97ff4.jpg', 4, 8, 129.00),
('59328', 'Респиратор "Красный" 220', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8b750.jpg', 3, 9, 129.00),
('58831', 'Респиратор "Волга" 220', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cc8f4dd.jpg', 2, 8, 99.00),
('5027981', 'Полумаска "Sunset" ABEK1P3', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cd0d0b1.jpg', 2, 1, 4990.00),
('5027966', 'Полумаска "Sunset" A2P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd10ec2.jpg', 4, 2, 4490.00),
('5027959', 'Полумаска "Sunset" А1', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd157f9.jpg', 2, 4, 3190.00),
('59924', 'Полумаска "Sunset" P3 (анти-запах)', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd19baa.jpg', 1, 9, 2790.00),
('59925', 'Полумаска "Sunset" (Элипс) P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd1e2b9.jpg', 5, 4, 2690.00),
('59926', 'Полумаска "Sunset" A1P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd2215f.jpg', 3, 9, 5690.00),
('59927', 'Полумаска "Sunset" ABEK1', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd268bf.jpg', 2, 8, 5690.00),
('59928', 'Полумаска "Moon" ABEK1', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd268bf.jpg', 2, 8, 5690.00),
('5027982', 'Полумаска "Moon" ABEK1P3', (SELECT product_type_id FROM public.product_types WHERE title='Респираторы'), '\products\5fb128cd0d0b1.jpg', 2, 1, 4990.00),
('5027967', 'Полумаска "Moon" A2P3', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd10ec2.jpg', 4, 2, 4490.00),
('5027960', 'Полумаска "Moon" А1', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd157f9.jpg', 2, 4, 3190.00),
('59929', 'Полумаска "Moon" P3 (анти-запах)', (SELECT product_type_id FROM public.product_types WHERE title='Полумаски'), '\products\5fb128cd19baa.jpg', 1, 9, 2790.00);

-- 6. Вставка связей продукт-материал из productmaterial_s_import.csv
-- Формат: product_article_number, product_title, material_id, count
-- ПОЛНЫЙ СПИСОК ВСЕХ 101 ЗАПИСЕЙ
INSERT INTO public.product_material (product_article_number, product_title, material_id, count) VALUES 
-- Запись 1
('58584', 'Респиратор "Алина" АВ', (SELECT material_id FROM public.materials WHERE title='Резинка розовый 1x0'), 9),
-- Запись 2
('58826', 'Респиратор "Алина" 200', (SELECT material_id FROM public.materials WHERE title='Резинка белый 3x3'), 19),
-- Запись 3
('5028247', 'Маска одноразовая трехслойная из нетканого материала, нестерильная', (SELECT material_id FROM public.materials WHERE title='Резинка белый 3x3'), 19),
-- Запись 4
('59923', 'Полумаска "Elipse" (Элипс) P3 (анти-запах)', (SELECT material_id FROM public.materials WHERE title='Вата серый 3x3'), 18),
-- Запись 5
('5030981', 'Маска из нетканого материала KN95', (SELECT material_id FROM public.materials WHERE title='Вата серый 3x3'), 2),
-- Запись 6
('5030981', 'Маска из нетканого материала KN95', (SELECT material_id FROM public.materials WHERE title='Резинка розовый 1x0'), 15),
-- Запись 7
('58825', 'Респиратор "Алина" П', (SELECT material_id FROM public.materials WHERE title='Вата серый 3x3'), 9),
-- Запись 8
('5028229', 'Повязка санитарно–гигиеническая многоразовая с принтом', (SELECT material_id FROM public.materials WHERE title='Силикон зеленый 3x1'), 4),
-- Запись 9
('59920', 'Полумаска "Elipse" (Элипс) ABEK1', (SELECT material_id FROM public.materials WHERE title='Силикон зеленый 3x1'), 13),
-- Запись 10
('5030981', 'Маска из нетканого материала KN95', (SELECT material_id FROM public.materials WHERE title='Силикон зеленый 3x1'), 5),
-- Запись 11
('59471', 'Респиратор "Юлия" 319', (SELECT material_id FROM public.materials WHERE title='Силикон зеленый 3x1'), 12),
-- Запись 12
('59470', 'Респиратор "Юлия" 209', (SELECT material_id FROM public.materials WHERE title='Силикон серый 1x1'), 15),
-- Запись 13
('59043', 'Респиратор противоаэрозольный 9312', (SELECT material_id FROM public.materials WHERE title='Вата розовый 3x1'), 2),
-- Запись 14
('58445', 'Респиратор 3M 8122', (SELECT material_id FROM public.materials WHERE title='Вата розовый 1x0'), 12),
-- Запись 15
('59735', 'Респиратор "Нева" 200', (SELECT material_id FROM public.materials WHERE title='Резинка синий 1x0'), 19),
-- Запись 16
('5028272', 'Повязка санитарно–гигиеническая многоразовая черная', (SELECT material_id FROM public.materials WHERE title='Ткань розовый 0x0'), 18),
-- Запись 17
('58584', 'Респиратор "Алина" АВ', (SELECT material_id FROM public.materials WHERE title='Ткань розовый 0x0'), 20),
-- Запись 18
('5030026', 'Респиратор RK6021', (SELECT material_id FROM public.materials WHERE title='Ткань розовый 0x0'), 9),
-- Запись 19
('5028229', 'Повязка санитарно–гигиеническая многоразовая с принтом', (SELECT material_id FROM public.materials WHERE title='Ткань розовый 0x0'), 18),
-- Запись 20
('58826', 'Респиратор "Алина" 200', (SELECT material_id FROM public.materials WHERE title='Резинка синий 1x0'), 4),
-- Запись 21
('5027965', 'Полумаска "Elipse" (Элипс) A2P3', (SELECT material_id FROM public.materials WHERE title='Ткань розовый 0x0'), 2),
-- Запись 22
('58825', 'Респиратор "Алина" П', (SELECT material_id FROM public.materials WHERE title='Вата розовый 3x1'), 13),
-- Запись 23
('59470', 'Респиратор "Юлия" 209', (SELECT material_id FROM public.materials WHERE title='Резинка синий 1x0'), 6),
-- Запись 24
('5031919', 'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', (SELECT material_id FROM public.materials WHERE title='Силикон белый 1x3'), 19),
-- Запись 25
('5028556', 'Повязка санитарно–гигиеническая многоразовая с логотипом СОЮЗСПЕЦОДЕЖДА', (SELECT material_id FROM public.materials WHERE title='Металлический стержень цветной 3x1'), 16),
-- Запись 26
('5027965', 'Полумаска "Elipse" (Элипс) A2P3', (SELECT material_id FROM public.materials WHERE title='Ткань синий 2x0'), 19),
-- Запись 27
('58466', 'Респиратор 3M 8102 противоаэрозольный', (SELECT material_id FROM public.materials WHERE title='Резинка синий 3x1'), 4),
-- Запись 28
('59920', 'Полумаска "Elipse" (Элипс) ABEK1', (SELECT material_id FROM public.materials WHERE title='Силикон белый 1x3'), 15),
-- Запись 29
('5027980', 'Полумаска "Elipse" (Элипс) ABEK1P3', (SELECT material_id FROM public.materials WHERE title='Резинка синий 3x1'), 17),
-- Запись 30
('58375', 'Респиратор 3M 8101 противоаэрозольный', (SELECT material_id FROM public.materials WHERE title='Силикон белый 1x3'), 3),
-- Запись 31
('59324', 'Респиратор "Алина" 110', (SELECT material_id FROM public.materials WHERE title='Металлический стержень зеленый 2x2'), 1),
-- Запись 32
('5028229', 'Повязка санитарно–гигиеническая многоразовая с принтом', (SELECT material_id FROM public.materials WHERE title='Ткань зеленый 2x2'), 14),
-- Запись 33
('5030026', 'Респиратор RK6021', (SELECT material_id FROM public.materials WHERE title='Силикон белый 1x3'), 10),
-- Запись 34
('58568', 'Респиратор с клапаном 9926', (SELECT material_id FROM public.materials WHERE title='Резинка серый 3x3'), 19),
-- Запись 35
('59735', 'Респиратор "Нева" 200', (SELECT material_id FROM public.materials WHERE title='Силикон белый 1x3'), 13),
-- Запись 36
('59475', 'Респиратор "Юлия" 219', (SELECT material_id FROM public.materials WHERE title='Металлический стержень цветной 3x1'), 2),
-- Запись 37
('5031924', 'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', (SELECT material_id FROM public.materials WHERE title='Резинка серый 3x3'), 3),
-- Запись 38
('58376', 'Респиратор 3M 8112 противоаэрозольный с клапаном выдоха', (SELECT material_id FROM public.materials WHERE title='Резинка синий 3x2'), 20),
-- Запись 39
('5031924', 'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', (SELECT material_id FROM public.materials WHERE title='Вата серый 3x2'), 13),
-- Запись 40
('58850', 'Респиратор "Алина" 310', (SELECT material_id FROM public.materials WHERE title='Резинка синий 3x2'), 19),
-- Запись 41
('59736', 'Респиратор "Нева" 210', (SELECT material_id FROM public.materials WHERE title='Металлический стержень синий 3x1'), 2),
-- Запись 42
('58445', 'Респиратор 3M 8122', (SELECT material_id FROM public.materials WHERE title='Металлический стержень синий 3x1'), 15),
-- Запись 43
('5031919', 'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 0x0'), 5),
-- Запись 44
('5030062', 'Респиратор Алина 211', (SELECT material_id FROM public.materials WHERE title='Вата серый 1x1'), 19),
-- Запись 45
('59475', 'Респиратор "Юлия" 219', (SELECT material_id FROM public.materials WHERE title='Резинка серый 0x0'), 17),
-- Запись 46
('58953', 'Респиратор У-2К', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 0x0'), 19),
-- Запись 47
('58974', 'Респиратор-полумаска "3М" серия 6000', (SELECT material_id FROM public.materials WHERE title='Резинка серый 0x0'), 17),
-- Запись 48
('5028556', 'Повязка санитарно–гигиеническая многоразовая с логотипом СОЮЗСПЕЦОДЕЖДА', (SELECT material_id FROM public.materials WHERE title='Вата серый 0x1'), 5),
-- Запись 49
('5028247', 'Маска одноразовая трехслойная из нетканого материала, нестерильная', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 1x0'), 20),
-- Запись 50
('59474', 'Респиратор "Юлия" 109', (SELECT material_id FROM public.materials WHERE title='Ткань синий 0x2'), 18),
-- Запись 51
('59043', 'Респиратор противоаэрозольный 9312', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 0x3'), 20),
-- Запись 52
('59474', 'Респиратор "Юлия" 109', (SELECT material_id FROM public.materials WHERE title='Ткань белый 1x3'), 8),
-- Запись 53
('59473', 'Респиратор "Юлия" 215', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 1x0'), 1),
-- Запись 54
('5026662', 'Респиратор 9101 FFP1', (SELECT material_id FROM public.materials WHERE title='Резинка цветной 0x1'), 14),
-- Запись 55
('5026662', 'Респиратор 9101 FFP1', (SELECT material_id FROM public.materials WHERE title='Ткань белый 1x3'), 9),
-- Запись 56
('5028272', 'Повязка санитарно–гигиеническая многоразовая черная', (SELECT material_id FROM public.materials WHERE title='Резинка цветной 0x1'), 11),
-- Запись 57
('5033136', 'Респиратор 3M с клапаном 9162', (SELECT material_id FROM public.materials WHERE title='Вата серый 3x0'), 11),
-- Запись 58
('5027958', 'Полумаска "Elipse" (Элипс) А1', (SELECT material_id FROM public.materials WHERE title='Резинка цветной 0x1'), 20),
-- Запись 59
('5028229', 'Повязка санитарно–гигиеническая многоразовая с принтом', (SELECT material_id FROM public.materials WHERE title='Вата белый 2x0'), 11),
-- Запись 60
('59921', 'Полумаска "Elipse" (Элипс) A1P3', (SELECT material_id FROM public.materials WHERE title='Ткань синий 0x2'), 16),
-- Запись 61
('58375', 'Респиратор 3M 8101 противоаэрозольный', (SELECT material_id FROM public.materials WHERE title='Металлический стержень цветной 1x2'), 1),
-- Запись 62
('58825', 'Респиратор "Алина" П', (SELECT material_id FROM public.materials WHERE title='Ткань синий 0x2'), 1),
-- Запись 63
('59920', 'Полумаска "Elipse" (Элипс) ABEK1', (SELECT material_id FROM public.materials WHERE title='Вата серый 0x1'), 2),
-- Запись 64
('59473', 'Респиратор "Юлия" 215', (SELECT material_id FROM public.materials WHERE title='Ткань белый 3x2'), 1),
-- Запись 65
('58445', 'Респиратор 3M 8122', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 3x1'), 2),
-- Запись 66
('5031919', 'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', (SELECT material_id FROM public.materials WHERE title='Металлический стержень синий 0x1'), 5),
-- Запись 67
('59470', 'Респиратор "Юлия" 209', (SELECT material_id FROM public.materials WHERE title='Металлический стержень синий 0x1'), 6),
-- Запись 68
('5031924', 'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 0x2'), 10),
-- Запись 69
('59922', 'Полумаска "Moon" (Элипс) P3', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 0x2'), 12),
-- Запись 70
('5030026', 'Респиратор RK6021', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 3x1'), 7),
-- Запись 71
('5030072', 'Респиратор Алина 210', (SELECT material_id FROM public.materials WHERE title='Металлический стержень синий 0x1'), 4),
-- Запись 72
('58826', 'Респиратор "Алина" 200', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 3x1'), 16),
-- Запись 73
('58796', 'Респиратор противоаэрозольный 9322', (SELECT material_id FROM public.materials WHERE title='Силикон розовый 1x3'), 4),
-- Запись 74
('58825', 'Респиратор "Алина" П', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 3x1'), 18),
-- Запись 75
('59922', 'Полумаска "Moon" (Элипс) P3', (SELECT material_id FROM public.materials WHERE title='Силикон розовый 1x3'), 10),
-- Запись 76
('5027965', 'Полумаска "Elipse" (Элипс) A2P3', (SELECT material_id FROM public.materials WHERE title='Металлический стержень синий 0x1'), 9),
-- Запись 77
('5028272', 'Повязка санитарно–гигиеническая многоразовая черная', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 0x2'), 9),
-- Запись 78
('59043', 'Респиратор противоаэрозольный 9312', (SELECT material_id FROM public.materials WHERE title='Металлический стержень синий 0x1'), 9),
-- Запись 79
('59324', 'Респиратор "Алина" 110', (SELECT material_id FROM public.materials WHERE title='Силикон зеленый 0x3'), 9),
-- Запись 80
('59898', 'Респиратор "Нева" 109', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 2x2'), 19),
-- Запись 81
('59472', 'Респиратор "Юлия" 119', (SELECT material_id FROM public.materials WHERE title='Ткань белый 3x2'), 3),
-- Запись 82
('59473', 'Респиратор "Юлия" 215', (SELECT material_id FROM public.materials WHERE title='Металлический стержень белый 0x2'), 19),
-- Запись 83
('58466', 'Респиратор 3M 8102 противоаэрозольный', (SELECT material_id FROM public.materials WHERE title='Ткань белый 3x2'), 14),
-- Запись 84
('5030981', 'Маска из нетканого материала KN95', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 3x0'), 19),
-- Запись 85
('59739', 'Респиратор "Нева" 310', (SELECT material_id FROM public.materials WHERE title='Силикон белый 2x0'), 17),
-- Запись 86
('59739', 'Респиратор "Нева" 310', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 3x0'), 16),
-- Запись 87
('5028229', 'Повязка санитарно–гигиеническая многоразовая с принтом', (SELECT material_id FROM public.materials WHERE title='Ткань серый 0x3'), 7),
-- Запись 88
('58445', 'Респиратор 3M 8122', (SELECT material_id FROM public.materials WHERE title='Силикон цветной 1x0'), 4),
-- Запись 89
('5028272', 'Повязка санитарно–гигиеническая многоразовая черная', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 3x0'), 2),
-- Запись 90
('58466', 'Респиратор 3M 8102 противоаэрозольный', (SELECT material_id FROM public.materials WHERE title='Ткань белый 2x2'), 12),
-- Запись 91
('59898', 'Респиратор "Нева" 109', (SELECT material_id FROM public.materials WHERE title='Ткань серый 0x3'), 4),
-- Запись 92
('58375', 'Респиратор 3M 8101 противоаэрозольный', (SELECT material_id FROM public.materials WHERE title='Резинка цветной 0x2'), 3),
-- Запись 93
('5030020', 'Респиратор RK6020', (SELECT material_id FROM public.materials WHERE title='Ткань серый 0x3'), 10),
-- Запись 94
('59043', 'Респиратор противоаэрозольный 9312', (SELECT material_id FROM public.materials WHERE title='Ткань серый 0x3'), 8),
-- Запись 95
('59921', 'Полумаска "Elipse" (Элипс) A1P3', (SELECT material_id FROM public.materials WHERE title='Силикон цветной 1x0'), 16),
-- Запись 96
('59921', 'Полумаска "Elipse" (Элипс) A1P3', (SELECT material_id FROM public.materials WHERE title='Вата розовый 3x3'), 3),
-- Запись 97
('59475', 'Респиратор "Юлия" 219', (SELECT material_id FROM public.materials WHERE title='Резинка цветной 0x2'), 2),
-- Запись 98
('5030022', 'Респиратор RK6030', (SELECT material_id FROM public.materials WHERE title='Ткань серый 0x3'), 20),
-- Запись 99
('5030022', 'Респиратор RK6030', (SELECT material_id FROM public.materials WHERE title='Резинка зеленый 3x0'), 1),
-- Запись 100
('58850', 'Респиратор "Алина" 310', (SELECT material_id FROM public.materials WHERE title='Ткань белый 2x2'), 8);

-- Скрипт завершен
