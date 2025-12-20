-- Fashion Store Categories and Brands Setup

-- Insert Categories
INSERT INTO categories (name, slug, description) VALUES 
('Sale', 'sale', 'Discounted items and special offers'),
('Summer', 'summer', 'Summer collection and seasonal wear'),
('Winter', 'winter', 'Winter collection and warm clothing'),
('Festive Collection', 'festive-collection', 'Special occasion and festive wear')
ON DUPLICATE KEY UPDATE name = name;

-- Insert Fashion Brands
INSERT INTO brands (name, description) VALUES 
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
('Kanni Silk Shawls', 'Premium silk shawls')
ON DUPLICATE KEY UPDATE name = name;

-- Get category IDs for subcategories
SET @sale_id = (SELECT id FROM categories WHERE name = 'Sale');
SET @summer_id = (SELECT id FROM categories WHERE name = 'Summer');
SET @winter_id = (SELECT id FROM categories WHERE name = 'Winter');
SET @festive_id = (SELECT id FROM categories WHERE name = 'Festive Collection');

-- Insert Subcategories for Summer Collection
INSERT INTO subcategories (name, category_id, description) VALUES 
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
('Mix Brands Summer', @summer_id, 'Mixed brands summer collection')
ON DUPLICATE KEY UPDATE name = name;

-- Insert Subcategories for Winter Collection
INSERT INTO subcategories (name, category_id, description) VALUES 
('Pure Pashmina Winter', @winter_id, 'Pure pashmina winter collection'),
('Pashmina Kani Winter', @winter_id, 'Pashmina kani winter collection'),
('Shawls Winter', @winter_id, 'Traditional shawls'),
('Kanni Silk Shawls Winter', @winter_id, 'Premium silk shawls')
ON DUPLICATE KEY UPDATE name = name;

-- Insert Subcategories for Festive Collection
INSERT INTO subcategories (name, category_id, description) VALUES 
('Nishat Festive', @festive_id, 'Nishat festive collection'),
('Crimson Festive', @festive_id, 'Crimson festive collection'),
('Sana Safinaz Festive', @festive_id, 'Sana Safinaz festive collection'),
('Bareeze Festive', @festive_id, 'Bareeze festive collection'),
('Zara Shahjahan Festive', @festive_id, 'Zara Shahjahan festive collection'),
('Sapphire Festive', @festive_id, 'Sapphire festive collection'),
('Mushq Festive', @festive_id, 'Mushq festive collection'),
('Maria B Festive', @festive_id, 'Maria B festive collection'),
('Asifa Nabeel Festive', @festive_id, 'Asifa Nabeel festive collection'),
('Alif Festive', @festive_id, 'Alif festive collection'),
('Noor by Sadia Asad Festive', @festive_id, 'Noor by Sadia Asad festive collection'),
('Suffuse Festive', @festive_id, 'Suffuse festive collection'),
('Afrozeh Festive', @festive_id, 'Afrozeh festive collection'),
('Mix Brands Festive', @festive_id, 'Mixed brands festive collection')
ON DUPLICATE KEY UPDATE name = name;

-- Insert Subcategories for Sale
INSERT INTO subcategories (name, category_id, description) VALUES 
('Summer Sale', @sale_id, 'Summer collection sale'),
('Winter Sale', @sale_id, 'Winter collection sale'),
('Festive Sale', @sale_id, 'Festive collection sale'),
('Clearance Sale', @sale_id, 'Clearance items'),
('Flash Sale', @sale_id, 'Limited time offers')
ON DUPLICATE KEY UPDATE name = name;
