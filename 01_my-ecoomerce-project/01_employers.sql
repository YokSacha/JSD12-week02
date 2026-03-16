-- Clear existing data to prevent duplication
TRUNCATE TABLE employer RESTART IDENTITY CASCADE;

-- Mock Data for employer
INSERT INTO Employer (CompanyName, Email, Phone, Address, TaxID, Industry, CompanySize, PaymentStatus, CreditRemains, TotalSpend)
VALUES
    ('TechNova Co., Ltd.',       'hr@technova.com',       '021-111-1111', '123 Sukhumvit Rd, Bangkok',     'TAX-001-TN', 'Information Technology',  500,  'Paid',   10, 5000),
    ('GreenBridge Solutions',    'recruit@greenbridge.io','021-222-2222', '456 Silom Rd, Bangkok',          'TAX-002-GB', 'Consulting',              120,  'Paid',   5,  2000),
    ('MediCare Hospital Group',  'jobs@medicare.co.th',   '021-333-3333', '789 Rama IV Rd, Bangkok',        'TAX-003-MC', 'Healthcare',              1200, 'Paid',   8,  3500),
    ('FinEdge Capital',          'talent@finedge.com',    '021-444-4444', '321 Sathorn Rd, Bangkok',        'TAX-004-FE', 'Finance',                 300,  'Unpaid', 0,  0),
    ('LogiMove Logistics',       'hr@logimove.co.th',     '021-555-5555', '654 Charoenkrung Rd, Bangkok',   'TAX-005-LM', 'Logistics',               80,   'Paid',   3,  1500);