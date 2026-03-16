-- Clear existing data to prevent duplication
TRUNCATE TABLE JobListing RESTART IDENTITY CASCADE;

-- Mock Data for MenuItems
INSERT INTO JobListing (EmployerID, Position, Department, Salary, SalaryMax, JobDescription, JobType, WorkMode, Location, Status)
VALUES
    (1, 'Backend Developer',     'Engineering',  40000, 60000, 'Build and maintain REST APIs using Python and SQL.',         'Full-time',  'Hybrid',   'Bangkok', 'Open'),
    (1, 'Frontend Developer',    'Engineering',  38000, 55000, 'Develop responsive UIs using React.',                        'Full-time',  'On-site',  'Bangkok', 'Open'),
    (2, 'Business Analyst',      'Strategy',     45000, 65000, 'Analyze business requirements and propose solutions.',        'Full-time',  'Hybrid',   'Bangkok', 'Open'),
    (3, 'Data Analyst',          'IT',           42000, 58000, 'Analyze patient data and generate reports.',                  'Full-time',  'On-site',  'Bangkok', 'Open'),
    (4, 'Financial Data Engineer','Finance IT',  55000, 80000, 'Build data pipelines for financial reporting systems.',       'Full-time',  'Remote',   'Bangkok', 'Open');