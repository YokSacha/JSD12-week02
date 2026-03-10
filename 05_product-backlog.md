// USER ============================================================

class User {
  constructor(userID, fullname, contactInfo, address, position, expectedSalary, skillset, expectedRole, role = UserRole.JOB_SEEKER) {
    this.userID        = userID;
    this.fullname      = fullname;
    this.contactInfo   = contactInfo;   // email,phone
    this.address       = address;
    this.position      = position;      // current position
    this.expectedSalary = expectedSalary;
    this.skillset      = skillset;      // general summary
    this.expectedRole  = expectedRole;  // target role
    this.role          = role;          // UserRole enum
    this.createdAt     = new Date();
  }
}


// EMPLOYER ============================================================

class Employer {
  constructor(employerID, userID, companyName, contactInfo, industry,TaxID) {
    this.employerID  = employerID;
    this.userID      = userID;       
    this.companyName = companyName;
    this.contactInfo = contactInfo;
    this.industry    = industry;
    this.TaxID       = TaxID;
    this.createdAt   = new Date();
  }
}


// JOB LISTING ============================================================

class JobListing {
  constructor(jobID, employerID, position, salary, jobDescription, requirement, requiredSkills = [], preferredSkills = []) {
    this.jobID           = jobID;
    this.employerID      = employerID;      
    this.position        = position;
    this.salary          = salary;
    this.jobDescription  = jobDescription;
    this.requirement     = requirement;
    this.requiredSkills  = requiredSkills;  
    this.preferredSkills = preferredSkills; 
    this.status          = JobStatus.ACTIVE;
    this.createdAt       = new Date();
  }
}


// SKILL GAP  (AI-generated per User + Job pair) ============================================================

class SkillGap {
  constructor(gapID, userID, jobID, missingSkills = [], recommendedProgramIDs = []) {
    this.gapID                 = gapID;
    this.userID                = userID;                
    this.jobID                 = jobID;                
    this.missingSkills         = missingSkills;        
    this.recommendedProgramIDs = recommendedProgramIDs; 
    this.analyzedAt            = new Date();
  }
}


// APPLICATION ============================================================

class Application {
  constructor(applicationID, userID, jobID, userSkills, jobListing) {
    this.applicationID       = applicationID;
    this.userID              = userID;              
    this.jobID               = jobID;               
    this.requiredSkills      = jobListing.requiredSkills;
    this.preferredSkills     = jobListing.preferredSkills;
    this.languageProficiency = userSkills.languageProficiency;
    this.salaryRange         = String(jobListing.salary);
    this.matchScore          = this.calculateMatchScore(userSkills, jobListing); 
    this.status              = AppStatus.PENDING;
    this.appliedAt           = new Date();
  }



// BRIDGE PROGRAM ============================================================

class BridgeProgram {
  constructor(programID, partnerID, name, skillsCovered = [], cost, durationDays, description) {
    this.programID     = programID;
    this.partnerID     = partnerID;      
    this.name          = name;
    this.skillsCovered = skillsCovered;  
    this.cost          = cost;
    this.durationDays  = durationDays;
    this.description   = description;
  }



