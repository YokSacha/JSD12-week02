-- Clear existing data to prevent duplication
TRUNCATE TABLE skill RESTART IDENTITY CASCADE;

-- Mock Data for Ingredients
INSERT INTO Skill (SkillName, Category, Description)
VALUES
    ('Python',              'Technical', 'General purpose programming language'),
    ('SQL',                 'Technical', 'Structured Query Language for databases'),
    ('Project Management',  'Soft',      'Planning and managing projects and teams'),
    ('English',             'Language',  'English language proficiency'),
    ('React',               'Technical', 'JavaScript UI library by Meta'),
    ('Data Analysis',       'Technical', 'Analyzing datasets to extract insights'),
    ('Communication',       'Soft',      'Verbal and written communication skills'),
    ('Docker',              'Tool',      'Containerization platform');