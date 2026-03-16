-- Clear existing data to prevent duplication
TRUNCATE TABLE Staff RESTART IDENTITY CASCADE;

-- Mock Data for Staff
INSERT INTO Staff (FirstName, LastName, Email, Phone, Role, Department, PasswordHash, IsActive)
VALUES
    ('Somchai',  'Jaidee',    'somchai@platform.com',  '081-001-0001', 'Admin',     'Operations',      'hashed_pw_001', TRUE),
    ('Nattaya',  'Srisook',   'nattaya@platform.com',  '081-002-0002', 'Moderator', 'Content Review',  'hashed_pw_002', TRUE),
    ('Prawit',   'Tanaka',    'prawit@platform.com',   '081-003-0003', 'Support',   'Customer Service','hashed_pw_003', TRUE),
    ('Siriporn', 'Wongchai',  'siriporn@platform.com', '081-004-0004', 'Admin',     'Finance',         'hashed_pw_004', TRUE),
    ('Krit',     'Phumiphat', 'krit@platform.com',     NULL,           'Moderator', 'Content Review',  'hashed_pw_005', FALSE);