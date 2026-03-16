-- ============================================================
--  JOB LISTING PLATFORM 
-- ============================================================

-- ============================================================
-- 1. EMPLOYER
--    Company that posts job listings and pays for services
-- ============================================================
CREATE TABLE if not exists Employer (
    EmployerID        SERIAL             NOT NULL,
    CompanyName       VARCHAR(150)    NOT NULL,
    Email             VARCHAR(150)    NOT NULL UNIQUE,
    Phone             VARCHAR(20)     NOT NULL,
    Address           VARCHAR(255)    NOT NULL,
    TaxID             VARCHAR(50)     NOT NULL UNIQUE,
    Industry          VARCHAR(100)    NOT NULL,
    CompanySize       INTEGER             NULL,           -- number of employees
    PaymentStatus     VARCHAR(20)     NOT NULL DEFAULT 'Unpaid',  -- Paid / Unpaid / Suspended
    CreditRemains     INTEGER             NOT NULL DEFAULT 0,
    TotalSpend        INTEGER             NOT NULL DEFAULT 0,
    CreatedAt         TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (EmployerID)
);


-- ============================================================
-- 2. STAFF / ADMIN
--    Platform moderators and admins who manage the system
-- ============================================================
CREATE TABLE if not exists Staff (
    StaffID           SERIAL             NOT NULL,
    FirstName         VARCHAR(100)    NOT NULL,
    LastName          VARCHAR(100)    NOT NULL,
    Email             VARCHAR(150)    NOT NULL UNIQUE,
    Phone             VARCHAR(20)     NULL,
    Role              VARCHAR(50)     NOT NULL,       -- Admin / Moderator / Support
    Department        VARCHAR(100)    NULL,
    PasswordHash      VARCHAR(255)    NOT NULL,
    IsActive          BOOLEAN         NOT NULL DEFAULT TRUE,
    CreatedAt         TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (StaffID)
);


-- ============================================================
-- 3. SKILL
--    Master list of all skills in the system (atomic unit)
-- ============================================================
CREATE TABLE if not exists Skill (
    SkillID           SERIAL             NOT NULL,
    SkillName         VARCHAR(100)    NOT NULL UNIQUE,
    Category          VARCHAR(100)    NOT NULL,       -- Technical / Soft / Language / Tool
    Description       TEXT            NULL,

    PRIMARY KEY (SkillID)
);


-- ============================================================
-- 4. USERS (Candidate / Job Seeker)
--    Person who applies for jobs
-- ============================================================
CREATE TABLE if not exists Users (
    UserID            SERIAL             NOT NULL,
    FirstName         VARCHAR(100)    NOT NULL,
    LastName          VARCHAR(100)    NOT NULL,
    Email             VARCHAR(150)    NOT NULL UNIQUE,
    Phone             VARCHAR(20)     NULL,
    Address           VARCHAR(255)    NULL,
    CurrentPosition   VARCHAR(150)    NULL,
    ExpectedRole      VARCHAR(150)    NULL,
    ExpectedSalary    INTEGER             NULL,
    PasswordHash      VARCHAR(255)    NOT NULL,
    CreatedAt         TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (UserID)
);


-- ============================================================
-- 5. USER_SKILL
--    Skills that a User (candidate) possesses
--    Junction: User ↔ Skill
-- ============================================================
CREATE TABLE if not exists UserSkill (
    UserSkillID       SERIAL             NOT NULL,
    UserID            INTEGER             NOT NULL,
    SkillID           INTEGER             NOT NULL,
    SkillType         VARCHAR(50)     NOT NULL,       -- Core / Soft / Hard / Language
    ProficiencyLevel  VARCHAR(50)     NULL,           -- Beginner / Intermediate / Advanced
    YearsExperience   INTEGER             NULL,
    Certificate       VARCHAR(255)    NULL,

    PRIMARY KEY (UserSkillID),
    FOREIGN KEY (UserID)  REFERENCES Users(UserID)  ON DELETE CASCADE,
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID) ON DELETE RESTRICT
);


-- ============================================================
-- 6. JOB LISTING
--    Job posted by an Employer
-- ============================================================
CREATE TABLE if not exists JobListing (
    JobID             SERIAL             NOT NULL,
    EmployerID        INTEGER             NOT NULL,
    Position          VARCHAR(150)    NOT NULL,
    Department        VARCHAR(100)    NULL,
    Salary            INTEGER             NULL,
    SalaryMax         INTEGER             NULL,
    JobDescription    TEXT            NOT NULL,
    JobType           VARCHAR(50)     NOT NULL,       -- Full-time / Part-time / Contract / Internship
    WorkMode          VARCHAR(50)     NULL,           -- On-site / Remote / Hybrid
    Location          VARCHAR(150)    NULL,
    Status            VARCHAR(50)     NOT NULL DEFAULT 'Open',  -- Open / Closed / Draft
    PostedAt          TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ExpiresAt         TIMESTAMP         NULL,

    PRIMARY KEY (JobID),
    FOREIGN KEY (EmployerID) REFERENCES Employer(EmployerID) ON DELETE CASCADE
);


-- ============================================================
-- 7. JOB REQUIREMENT
--    Skills required/preferred for a JobListing
--    Junction: JobListing ↔ Skill  (replaces "Recipe Item")
-- ============================================================
CREATE TABLE if not exists JobRequirement (
    RequirementID     SERIAL             NOT NULL,
    JobID             INTEGER             NOT NULL,
    SkillID           INTEGER             NOT NULL,
    RequirementType   VARCHAR(50)     NOT NULL,       -- Required / Preferred
    MinProficiency    VARCHAR(50)     NULL,           -- Beginner / Intermediate / Advanced
    Notes             TEXT            NULL,

    PRIMARY KEY (RequirementID),
    FOREIGN KEY (JobID)   REFERENCES JobListing(JobID) ON DELETE CASCADE,
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)   ON DELETE RESTRICT
);


-- ============================================================
-- 8. APPLICATION
--    Candidate applies to a JobListing  (replaces "Order")
-- ============================================================
CREATE TABLE if not exists Applications (
    ApplicationID     SERIAL             NOT NULL,
    UserID            INTEGER             NOT NULL,
    JobID             INTEGER             NOT NULL,
    MatchScore        DECIMAL(5,2)    NULL,           -- % match calculated by system
    SalaryExpected    INTEGER             NULL,
    CoverLetter       TEXT            NULL,
    Status            VARCHAR(50)     NOT NULL DEFAULT 'Pending',  -- Pending / Reviewed / Shortlisted / Rejected / Hired
    AppliedAt         TIMESTAMP        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt         TIMESTAMP        NULL,

    PRIMARY KEY (ApplicationID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)       ON DELETE CASCADE,
    FOREIGN KEY (JobID)  REFERENCES JobListing(JobID)  ON DELETE CASCADE
);


-- ============================================================
-- 9. APPLICATION DETAIL
--    Skill-level breakdown of an Application  (replaces "Order Item")
--    Maps which UserSkills were matched/missing per Application
-- ============================================================
CREATE TABLE if not exists ApplicationDetail (
    DetailID          SERIAL             NOT NULL,
    ApplicationID     INTEGER             NOT NULL,
    SkillID           INTEGER             NOT NULL,
    MatchStatus       VARCHAR(50)     NOT NULL,       -- Matched / Missing / Partial
    UserProficiency   VARCHAR(50)     NULL,
    RequiredProficiency VARCHAR(50)   NULL,
    Notes             TEXT            NULL,

    PRIMARY KEY (DetailID),
    FOREIGN KEY (ApplicationID) REFERENCES Applications(ApplicationID) ON DELETE CASCADE,
    FOREIGN KEY (SkillID)       REFERENCES Skill(SkillID)             ON DELETE RESTRICT
);


-- ============================================================
-- 10. SKILL GAP
--     Gaps identified for a User on a specific Job
-- ============================================================
CREATE TABLE if not exists SkillGap (
    GapID             SERIAL             NOT NULL,
    UserID            INTEGER             NOT NULL,
    JobID             INTEGER             NOT NULL,
    MissingSkills     TEXT            NULL,           -- Comma-separated or JSON
    MatchedSkills     TEXT            NULL,
    GapScore          INTEGER             NULL,           -- How many skills are missing
    CourseID          INTEGER             NULL,           -- FK to Learning Partner course

    PRIMARY KEY (GapID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)      ON DELETE CASCADE,
    FOREIGN KEY (JobID)  REFERENCES JobListing(JobID) ON DELETE CASCADE
);


-- ============================================================
-- 11. LEARNING PARTNER
--     External training providers offering courses
-- ============================================================
CREATE TABLE if not exists  LearningPartner (
    PartnerID         SERIAL             NOT NULL,
    PartnerName       VARCHAR(150)    NOT NULL,
    Email             VARCHAR(150)    NULL,
    Phone             VARCHAR(20)     NULL,
    Website           VARCHAR(255)    NULL,

    PRIMARY KEY (PartnerID)
);


-- ============================================================
-- 12. COURSE
--     Training courses offered by Learning Partners
-- ============================================================
CREATE TABLE if not exists Course (
    CourseID          SERIAL             NOT NULL,
    PartnerID         INTEGER             NOT NULL,
    CourseName        VARCHAR(200)    NOT NULL,
    SkillsCovered     TEXT            NULL,
    Duration          VARCHAR(100)    NULL,           -- e.g. "4 weeks", "20 hours"
    Cost              DECIMAL(10, 2)             NULL,
    CourseURL         VARCHAR(255)    NULL,

    PRIMARY KEY (CourseID),
    FOREIGN KEY (PartnerID) REFERENCES LearningPartner(PartnerID) ON DELETE CASCADE
);


-- ============================================================
-- 13. BRIDGE SKILL
--     Recommends courses to close a candidate's skill gap
-- ============================================================
CREATE TABLE if not exists BridgeSkill (
    BridgeID          SERIAL             NOT NULL,
    UserID            INTEGER             NOT NULL,
    GapID             INTEGER             NOT NULL,
    CourseID          INTEGER             NOT NULL,
    ExpectedRole      VARCHAR(150)    NULL,
    Status            VARCHAR(50)     NOT NULL DEFAULT 'Recommended',  -- Recommended / Enrolled / Completed
    EnrolledAt        TIMESTAMP        NULL,
    CompletedAt       TIMESTAMP        NULL,

    PRIMARY KEY (BridgeID),
    FOREIGN KEY (UserID)   REFERENCES Users(UserID)    ON DELETE CASCADE,
    FOREIGN KEY (GapID)    REFERENCES SkillGap(GapID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE RESTRICT
);


-- ============================================================
-- 14. PAYMENT / TRANSACTION
--     Employer pays for job posting or platform services
--     (replaces "Transaction" — employer side billing)
-- ============================================================
CREATE TABLE if not exists Payment (
    PaymentID         SERIAL             NOT NULL,
    EmployerID        INTEGER             NOT NULL,
    JobID             INTEGER             NULL,           -- NULL if paying for general credits
    Amount            DECIMAL(10, 2)             NOT NULL,
    ServiceType       VARCHAR(100)    NOT NULL,       -- Job Post / Featured Listing / Credit Top-up
    PaymentStatus     VARCHAR(50)     NOT NULL DEFAULT 'Pending',  -- Pending / Completed / Failed / Refunded
    PaymentMethod     VARCHAR(50)     NULL,           -- Credit Card / Bank Transfer / etc.
    PaidAt            TIMESTAMP        NULL,
    CreditUsed        DECIMAL(10, 2)             NOT NULL DEFAULT 0,
    CreditRemains     DECIMAL(10, 2)             NOT NULL DEFAULT 0,
    TotalSpend        DECIMAL(10, 2)             NOT NULL DEFAULT 0,
    Notes             TEXT            NULL,

    PRIMARY KEY (PaymentID),
    FOREIGN KEY (EmployerID) REFERENCES Employer(EmployerID) ON DELETE CASCADE,
    FOREIGN KEY (JobID)      REFERENCES JobListing(JobID)    ON DELETE SET NULL
);