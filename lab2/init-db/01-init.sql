-- =============================================================
-- Скрипт инициализации БД для лабораторной работы №2
-- Вариант: Самара, Сорокины Хутора
-- =============================================================

CREATE EXTENSION IF NOT EXISTS postgis;

-- ===================== DDL: Таблицы =====================

-- Здания (полигональные объекты)
DROP TABLE IF EXISTS buildings CASCADE;
CREATE TABLE buildings (
    id SERIAL PRIMARY KEY,
    osm_id TEXT UNIQUE,
    addr_housenumber TEXT,
    addr_street TEXT,
    addr_place TEXT,
    addr_city TEXT,
    building TEXT,
    building_levels TEXT,
    geom GEOMETRY(MultiPolygon, 4326) NOT NULL
);

-- Дороги (линейные объекты)
DROP TABLE IF EXISTS roads CASCADE;
CREATE TABLE roads (
    id SERIAL PRIMARY KEY,
    osm_id TEXT UNIQUE,
    highway TEXT,
    tracktype TEXT,
    geom GEOMETRY(MultiLineString, 4326) NOT NULL
);

-- POI (точечные объекты)
DROP TABLE IF EXISTS poi CASCADE;
CREATE TABLE poi (
    id SERIAL PRIMARY KEY,
    osm_id TEXT UNIQUE,
    name TEXT,
    category TEXT,
    geom GEOMETRY(Point, 4326)
);

-- ===================== Пространственные индексы =====================

CREATE INDEX idx_buildings_geom ON buildings USING GIST (geom);
CREATE INDEX idx_roads_geom ON roads USING GIST (geom);
CREATE INDEX idx_poi_geom ON poi USING GIST (geom);

-- ===================== Здания =====================

-- way/1267317778
INSERT INTO buildings (osm_id, building, geom) VALUES
('way/1267317778', 'yes',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2333676 53.3020419,
    50.2336086 53.3020385,
    50.2336132 53.3021549,
    50.2335602 53.3021439,
    50.2335787 53.3021932,
    50.233432 53.3021881,
    50.2333704 53.3021122,
    50.2333676 53.3020419
))'), 4326)));

-- way/1490340091 (ул. 1-я, 20)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340091', '20', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house', '2',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2324602 53.3030276,
    50.2324951 53.3028885,
    50.2327295 53.3029095,
    50.2326946 53.3030486,
    50.2324602 53.3030276
))'), 4326)));

-- way/1490340092 (ул. 1-я, 18)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340092', '18', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house', '2',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2329333 53.3027674,
    50.2329341 53.3026794,
    50.2330932 53.3026799,
    50.2330924 53.3027679,
    50.2329333 53.3027674
))'), 4326)));

-- way/1490340093 (ул. 1-я, 16)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340093', '16', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house', '1',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2329118 53.3024783,
    50.2328881 53.3023747,
    50.2330458 53.3023618,
    50.2330695 53.3024654,
    50.2329118 53.3024783
))'), 4326)));

-- way/1490340094 (ул. 1-я, 14)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340094', '14', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house', '1',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2328698 53.3022118,
    50.232856 53.3021214,
    50.2330065 53.3021132,
    50.2330202 53.3022037,
    50.2328698 53.3022118
))'), 4326)));

-- way/1490340095 (1-я линия, 10)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340095', '10', '1-я линия', 'Сорокины Хутора пос.', 'Самара', 'house', '1',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2327475 53.301879,
    50.2327188 53.3018003,
    50.2328379 53.3017848,
    50.2328666 53.3018634,
    50.2327475 53.301879
))'), 4326)));

-- way/1490340096 (ул. 1-я, 8)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, geom) VALUES
('way/1490340096', '8', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2325618 53.3017394,
    50.2325525 53.3016864,
    50.2326668 53.3016784,
    50.232673 53.3017295,
    50.2325618 53.3017394
))'), 4326)));

-- way/1490340097 (ул. 1-я, 22)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340097', '22', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house', '2',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2330906 53.301628,
    50.2330472 53.3015232,
    50.2332228 53.3014973,
    50.2332662 53.3016021,
    50.2330906 53.301628
))'), 4326)));

-- way/1490340098 (ул. 1-я, 14 - исправлено с 15 на 14 согласно данным)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340098', '14', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house', '2',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2330082 53.3014039,
    50.2329409 53.3012984,
    50.2330603 53.3012712,
    50.2331276 53.3013768,
    50.2330082 53.3014039
))'), 4326)));

-- way/1490340099 (1-я линия, 19 - исправлены координаты)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340099', '19', '1-я линия', 'Сорокины Хутора пос.', 'Самара', 'house', '1',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2333026 53.3030494,
    50.2333242 53.302985,
    50.2334711 53.3030026,
    50.2334496 53.3030669,
    50.2333026 53.3030494
))'), 4326)));

-- way/1490340100 (ул. 1-я, 17)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340100', '17', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house', '2',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2333702 53.3029254,
    50.233391 53.3028646,
    50.2335391 53.3028826,
    50.2335184 53.3029434,
    50.2333702 53.3029254
))'), 4326)));

-- way/1490340101 (ул. 1-я, 13 - исправлены координаты)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, geom) VALUES
('way/1490340101', '13', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.2336406 53.3025823,
    50.2336397 53.3024894,
    50.2337416 53.302489,
    50.2337425 53.302582,
    50.2336406 53.3025823
))'), 4326)));

-- way/1490340102 (ул. 1-я, 11а)
INSERT INTO buildings (osm_id, addr_housenumber, addr_street, addr_place, addr_city, building, building_levels, geom) VALUES
('way/1490340102', '11а', '1-я улица', 'Сорокины Хутора пос.', 'Самара', 'house', '2',
 ST_Multi(ST_SetSRID(ST_GeomFromText('POLYGON((
    50.233373 53.3024521,
    50.2333801 53.3023582,
    50.2335687 53.3023632,
    50.2335616 53.3024572,
    50.233373 53.3024521
))'), 4326)));

-- ===================== Дороги =====================

-- way/35263851 (service)
INSERT INTO roads (osm_id, highway, tracktype, geom) VALUES
('way/35263851', 'service', 'grade1',
 ST_Multi(ST_SetSRID(ST_GeomFromText('LINESTRING(
    50.2310966 53.3019124,
    50.231331 53.3019213,
    50.2318904 53.301881,
    50.2325173 53.3018125,
    50.2329451 53.3017507,
    50.2330277 53.3016783,
    50.2331173 53.3016474,
    50.2337442 53.3015628,
    50.23427 53.3015305,
    50.2347983 53.3015477,
    50.2351826 53.3015915,
    50.2354698 53.3016715,
    50.2358406 53.3017682,
    50.2362733 53.3018539,
    50.2365454 53.301929,
    50.2369173 53.3020525,
    50.2373427 53.3021682,
    50.2378078 53.3022572,
    50.2385044 53.3023633,
    50.2399798 53.3024358,
    50.2407826 53.3025523,
    50.2412125 53.3025838,
    50.2413703 53.3025787
)'), 4326)));

-- way/35263853 (track)
INSERT INTO roads (osm_id, highway, tracktype, geom) VALUES
('way/35263853', 'track', 'grade1',
 ST_Multi(ST_SetSRID(ST_GeomFromText('LINESTRING(
    50.2331996 53.302917,
    50.2331346 53.3031478,
    50.233394 53.3032068,
    50.2338143 53.3032459,
    50.2343374 53.303307,
    50.2346879 53.3033392,
    50.234971 53.3033272,
    50.2353822 53.3032466
)'), 4326)));

-- way/696754922 (service)
INSERT INTO roads (osm_id, highway, geom) VALUES
('way/696754922', 'service',
 ST_Multi(ST_SetSRID(ST_GeomFromText('LINESTRING(
    50.2330488 53.3030869,
    50.2331996 53.302917,
    50.2332859 53.3026437,
    50.2332643 53.3023837,
    50.233143 53.3019969,
    50.2329451 53.3017507,
    50.2327722 53.3013645,
    50.2323687 53.3006923,
    50.232145 53.3004064,
    50.2319803 53.3002329,
    50.2316667 53.2997773,
    50.2315231 53.2996601,
    50.2313634 53.2995275,
    50.2312825 53.2993865,
    50.2311731 53.2991223,
    50.2309026 53.2984894,
    50.2306344 53.2978802,
    50.2304129 53.2972352,
    50.2301529 53.2966639,
    50.2291323 53.2952242,
    50.2286617 53.2945786,
    50.2284045 53.2942089,
    50.2283454 53.2939296,
    50.2279157 53.2934938,
    50.2276481 53.293188,
    50.2275443 53.2929345,
    50.2275508 53.2927311,
    50.2275286 53.2923183,
    50.2272306 53.291873,
    50.2269863 53.2915382,
    50.2267196 53.2913578,
    50.2271566 53.2912539,
    50.2273689 53.2912037,
    50.2275348 53.2911653,
    50.2281626 53.2910159,
    50.228804 53.2916985,
    50.2291321 53.2919693,
    50.2296982 53.2921009,
    50.2297543 53.2921139,
    50.2304337 53.292171,
    50.230702 53.2922494,
    50.2308366 53.2924003,
    50.2308449 53.2926286,
    50.2304527 53.2932422,
    50.2304791 53.2934656,
    50.2307712 53.2936758,
    50.2309796 53.2938432,
    50.2308546 53.2940784,
    50.2309498 53.2942815,
    50.2312896 53.2947587,
    50.2313433 53.2949654,
    50.2313126 53.2951711,
    50.2313038 53.2954241,
    50.2312421 53.2957386,
    50.2312168 53.2958377,
    50.2313295 53.2959456,
    50.2314567 53.2960377,
    50.2314666 53.2961582,
    50.23141 53.2963919
)'), 4326)));

-- way/944048517 (steps)
INSERT INTO roads (osm_id, highway, geom) VALUES
('way/944048517', 'steps',
 ST_Multi(ST_SetSRID(ST_GeomFromText('LINESTRING(
    50.2330488 53.3030869,
    50.2327409 53.3033452
)'), 4326)));

-- ===================== POI =====================

-- node/413336136 (пешеходный переход)
INSERT INTO poi (osm_id, name, category, geom) VALUES
('node/413336136', NULL, 'crossing',
 ST_SetSRID(ST_MakePoint(50.2412125, 53.3025838), 4326));