-- Clear existing data to prevent duplication
TRUNCATE TABLE Applications RESTART IDENTITY CASCADE;

-- Mock Data for OrderIApplicationtems

INSERT INTO Applications (UserID, JobID, MatchScore, SalaryExpected, CoverLetter, Status)
VALUES
    (1, 1, 72.50, 45000, 'I am excited to apply for the Backend Developer role.', 'Pending'),
    (2, 4, 91.00, 60000, 'My data analysis experience aligns well with this role.','Shortlisted'),
    (3, 3, 85.00, 55000, 'I have led multiple business analysis projects.',         'Reviewed'),
    (4, 2, 88.50, 70000, 'React and Docker are my primary skills.',                'Shortlisted'),
    (5, 5, 95.00, 65000, 'I specialize in Python data pipelines.',                 'Pending');