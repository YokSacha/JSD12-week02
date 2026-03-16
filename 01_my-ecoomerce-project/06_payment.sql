-- Clear existing data to prevent duplication
TRUNCATE TABLE Payment RESTART IDENTITY CASCADE;

-- Mock Data for Payment
-- Note: total_price is calculated manually from the order items for this mock data.
INSERT INTO Payment (EmployerID, JobID, Amount, ServiceType, PaymentStatus, PaymentMethod, PaidAt, CreditUsed, CreditRemains, TotalSpend)
VALUES
    (1, 1, 2000.00, 'Job Post',          'Completed', 'Credit Card',    '2025-01-10 09:00:00', 0.00,    10.00, 2000.00),
    (1, 2, 2000.00, 'Job Post',          'Completed', 'Credit Card',    '2025-01-15 10:00:00', 0.00,    8.00,  4000.00),
    (2, 3, 1500.00, 'Featured Listing',  'Completed', 'Bank Transfer',  '2025-02-01 11:00:00', 500.00,  5.00,  1500.00),
    (3, 4, 2000.00, 'Job Post',          'Completed', 'Credit Card',    '2025-02-10 14:00:00', 0.00,    8.00,  3500.00),
    (4, 5, 3000.00, 'Credit Top-up',     'Pending',   NULL,              NULL,                  0.00,    0.00,  0.00);
