-- Brand-Category Mapping for Fashion Store

-- Get category IDs
SET @summer_id = (SELECT id FROM categories WHERE name = 'Summer');
SET @winter_id = (SELECT id FROM categories WHERE name = 'Winter');

-- Get or create brand IDs first
INSERT IGNORE INTO brands (name, description) VALUES 
('Nishat', 'Premium Pakistani fashion brand'),
('Crimson', 'Contemporary fashion label'),
('Sana Safinaz', 'Luxury fashion designer'),
('Bareeze', 'Traditional and modern fusion'),
('Zara Shahjahan', 'Designer fashion brand'),
('Sapphire', 'Contemporary fashion'),
('Mushq', 'Luxury designer wear'),
('Maria B', 'Designer fashion brand'),
('Asifa Nabeel', 'Designer label'),
('Alif', 'Fashion brand'),
('Noor by Sadia Asad', 'Designer fashion'),
('Suffuse', 'Luxury fashion brand'),
('Afrozeh', 'Designer fashion'),
('Mix Brands', 'Various fashion brands'),
('Pure Pashmina', 'Premium pashmina products'),
('Pashmina Kani', 'Traditional kani work'),
('Shawls', 'Traditional shawls'),
('Kanni Silk Shawls', 'Premium silk shawls');

-- Get brand IDs after insertion
SET @nishat_id = (SELECT id FROM brands WHERE name = 'Nishat');
SET @crimson_id = (SELECT id FROM brands WHERE name = 'Crimson');
SET @sana_safinaz_id = (SELECT id FROM brands WHERE name = 'Sana Safinaz');
SET @bareeze_id = (SELECT id FROM brands WHERE name = 'Bareeze');
SET @zara_shahjahan_id = (SELECT id FROM brands WHERE name = 'Zara Shahjahan');
SET @sapphire_id = (SELECT id FROM brands WHERE name = 'Sapphire');
SET @mushq_id = (SELECT id FROM brands WHERE name = 'Mushq');
SET @maria_b_id = (SELECT id FROM brands WHERE name = 'Maria B');
SET @asifa_nabeel_id = (SELECT id FROM brands WHERE name = 'Asifa Nabeel');
SET @alif_id = (SELECT id FROM brands WHERE name = 'Alif');
SET @noor_id = (SELECT id FROM brands WHERE name = 'Noor by Sadia Asad');
SET @suffuse_id = (SELECT id FROM brands WHERE name = 'Suffuse');
SET @afrozeh_id = (SELECT id FROM brands WHERE name = 'Afrozeh');
SET @mix_brands_id = (SELECT id FROM brands WHERE name = 'Mix Brands');
SET @pure_pashmina_id = (SELECT id FROM brands WHERE name = 'Pure Pashmina');
SET @pashmina_kani_id = (SELECT id FROM brands WHERE name = 'Pashmina Kani');
SET @shawls_id = (SELECT id FROM brands WHERE name = 'Shawls');
SET @kanni_silk_id = (SELECT id FROM brands WHERE name = 'Kanni Silk Shawls');

-- Create specific subcategories for Summer category with fashion brands
INSERT IGNORE INTO subcategories (name, category_id, description) VALUES 
('Nishat Summer', @summer_id, 'Nishat summer collection'),
('Crimson Summer', @summer_id, 'Crimson summer collection'),
('Sana Safinaz Summer', @summer_id, 'Sana Safinaz summer collection'),
('Bareeze Summer', @summer_id, 'Bareeze summer collection'),
('Zara Shahjahan Summer', @summer_id, 'Zara Shahjahan summer collection'),
('Sapphire Summer', @summer_id, 'Sapphire summer collection'),
('Mushq Summer', @summer_id, 'Mushq summer collection'),
('Maria B Summer', @summer_id, 'Maria B summer collection'),
('Asifa Nabeel Summer', @summer_id, 'Asifa Nabeel summer collection'),
('Alif Summer', @summer_id, 'Alif summer collection'),
('Noor by Sadia Asad Summer', @summer_id, 'Noor by Sadia Asad summer collection'),
('Suffuse Summer', @summer_id, 'Suffuse summer collection'),
('Afrozeh Summer', @summer_id, 'Afrozeh summer collection'),
('Mix Brands Summer', @summer_id, 'Mixed brands summer collection');

-- Create specific subcategories for Winter category with traditional items
INSERT IGNORE INTO subcategories (name, category_id, description) VALUES 
('Pure Pashmina Winter', @winter_id, 'Pure pashmina winter collection'),
('Pashmina Kani Winter', @winter_id, 'Pashmina kani winter collection'),
('Shawls Winter', @winter_id, 'Traditional shawls'),
('Kanni Silk Shawls Winter', @winter_id, 'Premium silk shawls');
