-- Clear existing data to prevent duplication
TRUNCATE TABLE Users RESTART IDENTITY CASCADE;

-- Mock Data for employer
INSERT INTO Users (FirstName, LastName, Email, Phone, Address, CurrentPosition, ExpectedRole, ExpectedSalary, PasswordHash)
VALUES
    ('Arisa',    'Moonpan',   'arisa@email.com',   '090-111-0001', 'Chiang Mai',  'Junior Developer',   'Mid-level Developer',  45000, 'hashed_c_001'),
    ('Noppadon', 'Saelee',    'noppa@email.com',   '090-222-0002', 'Bangkok',     'Data Analyst',       'Senior Data Analyst',  60000, 'hashed_c_002'),
    ('Wanida',   'Thongchai', 'wanida@email.com',  '090-333-0003', 'Bangkok',     'HR Officer',         'HR Manager',           55000, 'hashed_c_003'),
    ('Teerawat', 'Khampha',   'tee@email.com',     '090-444-0004', 'Phuket',      'Freelance Developer','Full-stack Developer',  70000, 'hashed_c_004'),
    ('Malee',    'Ruangrit',  'malee@email.com',   NULL,           'Khon Kaen',   NULL,                 'Data Engineer',        65000, 'hashed_c_005');