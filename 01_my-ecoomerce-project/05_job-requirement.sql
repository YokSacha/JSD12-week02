-- Clear existing data to prevent duplication
TRUNCATE TABLE JobRequirement RESTART IDENTITY CASCADE;

INSERT INTO JobRequirement (JobID, SkillID, RequirementType, MinProficiency, Notes)
VALUES
    (1, 1, 'Required',  'Intermediate', 'Python for backend services'),
    (1, 2, 'Required',  'Intermediate', 'SQL for database management'),
    (1, 8, 'Preferred', 'Beginner',     'Docker for containerization'),
    (2, 5, 'Required',  'Intermediate', 'React for frontend development'),
    (2, 7, 'Preferred', 'Intermediate', 'Good communication with design team'),
    (3, 3, 'Required',  'Advanced',     'Lead project planning sessions'),
    (3, 7, 'Required',  'Intermediate', 'Client-facing communication'),
    (4, 2, 'Required',  'Advanced',     'SQL for data querying'),
    (4, 6, 'Required',  'Advanced',     'Data analysis and reporting'),
    (5, 1, 'Required',  'Advanced',     'Python for data pipelines'),
    (5, 2, 'Required',  'Advanced',     'SQL for data warehousing');