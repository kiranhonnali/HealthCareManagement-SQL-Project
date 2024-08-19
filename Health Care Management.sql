CREATE TABLE Patients (
    PatientID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender CHAR(1),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Doctors (
    DoctorID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    OfficeAddress VARCHAR(255)
);

CREATE TABLE Appointments (
    AppointmentID SERIAL PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Reason TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE MedicalRecords (
    RecordID SERIAL PRIMARY KEY,
    PatientID INT,
    RecordDate DATE,
    Description TEXT,
    Diagnosis TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Prescriptions (
    PrescriptionID SERIAL PRIMARY KEY,
    RecordID INT,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    Duration VARCHAR(50),
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID)
);

-- Insert sample data into Patients
INSERT INTO Patients (FirstName, LastName, DOB, Gender, Address, PhoneNumber, Email)
VALUES
    ('Aarav', 'Sharma', '1985-03-15', 'M', '12 Ashoka Road, Delhi', '999-1234', 'aarav.sharma@example.com'),
    ('Isha', 'Kumar', '1990-07-20', 'F', '45 Lotus Lane, Mumbai', '999-5678', 'isha.kumar@example.com'),
    ('Rohan', 'Patel', '1982-11-05', 'M', '89 Sunflower Street, Bangalore', '999-8765', 'rohan.patel@example.com'),
    ('Ananya', 'Reddy', '1995-06-25', 'F', '23 Rose Garden, Hyderabad', '999-4321', 'ananya.reddy@example.com'),
    ('Arjun', 'Singh', '1988-09-10', 'M', '56 Mango Avenue, Chennai', '999-6789', 'arjun.singh@example.com'),
    ('Priya', 'Chopra', '1992-02-14', 'F', '78 Jasmine Road, Pune', '999-9876', 'priya.chopra@example.com'),
    ('Vivaan', 'Gupta', '1987-12-01', 'M', '91 Orchid Street, Delhi', '999-5432', 'vivaan.gupta@example.com'),
    ('Kavya', 'Nair', '1994-08-08', 'F', '34 Marigold Lane, Bangalore', '999-6543', 'kavya.nair@example.com'),
    ('Aryan', 'Mehta', '1983-10-22', 'M', '67 Tulip Road, Mumbai', '999-3214', 'aryan.mehta@example.com'),
    ('Mira', 'Deshmukh', '1989-04-19', 'F', '12 Lotus Avenue, Hyderabad', '999-2143', 'mira.deshmukh@example.com');

-- Insert sample data into Doctors
INSERT INTO Doctors (FirstName, LastName, Specialization, PhoneNumber, Email, OfficeAddress)
VALUES
    ('Dr. Rajesh', 'Mohan', 'Cardiology', '999-4321', 'rajesh.mohan@clinic.com', '101 Health St, Delhi'),
    ('Dr. Aditi', 'Sharma', 'Orthopedics', '999-5678', 'aditi.sharma@clinic.com', '102 Wellness Ave, Mumbai'),
    ('Dr. Sanjay', 'Patel', 'Pediatrics', '999-8765', 'sanjay.patel@clinic.com', '103 Care Blvd, Bangalore'),
    ('Dr. Priya', 'Reddy', 'Internal Medicine', '999-6543', 'priya.reddy@clinic.com', '104 Med Center, Hyderabad'),
    ('Dr. Arun', 'Singh', 'Dermatology', '999-5432', 'arun.singh@clinic.com', '105 Skin Clinic, Chennai'),
    ('Dr. Neha', 'Chopra', 'Gynecology', '999-3214', 'neha.chopra@clinic.com', '106 Women’s Health Clinic, Pune'),
    ('Dr. Vikram', 'Gupta', 'Neurology', '999-2143', 'vikram.gupta@clinic.com', '107 Brain Care, Delhi'),
    ('Dr. Ananya', 'Nair', 'Ophthalmology', '999-4321', 'ananya.nair@clinic.com', '108 Eye Clinic, Bangalore'),
    ('Dr. Ravi', 'Mehta', 'Endocrinology', '999-5678', 'ravi.mehta@clinic.com', '109 Hormone Center, Mumbai'),
    ('Dr. Sanya', 'Deshmukh', 'Gastroenterology', '999-8765', 'sanya.deshmukh@clinic.com', '110 Digestive Care, Hyderabad');

-- Insert sample data into Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Reason)
VALUES
    (1, 1, '2024-09-01', '09:00:00', 'Annual check-up'),
    (2, 2, '2024-09-05', '10:30:00', 'Back pain consultation'),
    (3, 3, '2024-09-10', '11:00:00', 'Routine pediatric exam'),
    (4, 4, '2024-09-15', '09:30:00', 'Internal medicine follow-up'),
    (5, 5, '2024-09-20', '10:00:00', 'Skin issue consultation'),
    (6, 6, '2024-09-25', '11:00:00', 'Gynecology check-up'),
    (7, 7, '2024-09-30', '09:15:00', 'Neurology follow-up'),
    (8, 8, '2024-10-05', '10:45:00', 'Eye exam'),
    (9, 9, '2024-10-10', '11:30:00', 'Endocrinology check-up'),
    (10, 10, '2024-10-15', '09:00:00', 'Gastroenterology consultation');

-- Insert sample data into MedicalRecords
INSERT INTO MedicalRecords (PatientID, RecordDate, Description, Diagnosis)
VALUES
    (1, '2024-09-01', 'Patient reports general fatigue and mild chest pain.', 'No significant issues found'),
    (2, '2024-09-05', 'Patient has back pain; X-ray shows no fractures.', 'Muscle strain'),
    (3, '2024-09-10', 'Routine check-up; no major issues.', 'Healthy growth and development'),
    (4, '2024-09-15', 'Patient experiencing mild fever and fatigue.', 'Viral infection'),
    (5, '2024-09-20', 'Patient has severe itching and redness.', 'Dermatitis'),
    (6, '2024-09-25', 'Patient reports irregular periods and abdominal pain.', 'Polycystic ovary syndrome'),
    (7, '2024-09-30', 'Patient reports frequent headaches and dizziness.', 'Migraines'),
    (8, '2024-10-05', 'Patient reports blurred vision and eye strain.', 'Refractive error'),
    (9, '2024-10-10', 'Patient reports excessive thirst and frequent urination.', 'Diabetes mellitus'),
    (10, '2024-10-15', 'Patient reports abdominal pain and bloating.', 'Irritable bowel syndrome');

-- Insert sample data into Prescriptions
INSERT INTO Prescriptions (RecordID, MedicationName, Dosage, Frequency, Duration)
VALUES
    (1, 'Aspirin', '100 mg', 'Once daily', '30 days'),
    (2, 'Ibuprofen', '200 mg', 'Every 8 hours as needed', '7 days'),
    (3, 'Vitamin D', '400 IU', 'Once daily', '30 days'),
    (4, 'Paracetamol', '500 mg', 'Every 6 hours as needed', '7 days'),
    (5, 'Hydrocortisone', '1%', 'Apply twice daily', '14 days'),
    (6, 'Metformin', '500 mg', 'Twice daily', '30 days'),
    (7, 'Sumatriptan', '50 mg', 'Once at onset of migraine', 'As needed'),
    (8, 'Loratadine', '10 mg', 'Once daily', '30 days'),
    (9, 'Insulin', '10 units', 'Twice daily', 'Ongoing'),
    (10, 'Dicyclomine', '20 mg', 'Three times daily', '15 days');



-- Join Queries
SELECT a.AppointmentDate, a.AppointmentTime, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName
FROM Appointments a
JOIN Doctors d ON a.DoctorID = d.DoctorID
WHERE a.PatientID = 1;

-- Aggregate functions
SELECT d.FirstName, d.LastName, COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID;

-- Subqueries
SELECT * 
FROM MedicalRecords
WHERE PatientID = 1
ORDER BY RecordDate DESC
LIMIT 1;

-- Views
CREATE VIEW PatientAppointments AS
SELECT p.FirstName, p.LastName, a.AppointmentDate, a.AppointmentTime, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID;


select * from PatientAppointments

-- Generate Reports
SELECT COUNT(PrescriptionID) AS TotalPrescriptions, 
       EXTRACT(MONTH FROM CURRENT_DATE) AS Month
FROM Prescriptions
WHERE EXTRACT(MONTH FROM CURRENT_DATE) = EXTRACT(MONTH FROM CURRENT_DATE);

-- Indexing
CREATE INDEX idx_patient_id ON Appointments(PatientID);

-- Stored Procedures
CREATE OR REPLACE PROCEDURE ScheduleAppointment(
    p_PatientID INT,
    p_DoctorID INT,
    p_AppointmentDate DATE,
    p_AppointmentTime TIME,
    p_Reason TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Reason)
    VALUES (p_PatientID, p_DoctorID, p_AppointmentDate, p_AppointmentTime, p_Reason);
END;
$$;

CALL ScheduleAppointment(
    1,                   -- p_PatientID
    2,                   -- p_DoctorID
    '2024-09-01',        -- p_AppointmentDate
    '09:00:00',          -- p_AppointmentTime
    'Annual check-up'    -- p_Reason
);


-- Triggers

CREATE OR REPLACE FUNCTION update_last_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.LastModified = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_last_modified
BEFORE UPDATE ON MedicalRecords
FOR EACH ROW
EXECUTE FUNCTION update_last_modified();

-- Retrieve Patients History
SELECT p.FirstName, p.LastName, a.AppointmentDate, a.AppointmentTime, d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName, pr.MedicationName, pr.Dosage
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
LEFT JOIN MedicalRecords m ON p.PatientID = m.PatientID
LEFT JOIN Prescriptions pr ON m.RecordID = pr.RecordID
WHERE p.PatientID = 1;

-- Doctor Appointment Statistics
SELECT d.Specialization, COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.Specialization;


-- Monthly Prescription Count
SELECT COUNT(pr.PrescriptionID) AS TotalPrescriptions
FROM Prescriptions pr
JOIN MedicalRecords mr ON pr.RecordID = mr.RecordID
WHERE mr.RecordDate BETWEEN DATE_TRUNC('month', CURRENT_DATE) AND CURRENT_DATE;

-- Patients Appointment Summary
SELECT p.FirstName, p.LastName, EXTRACT(MONTH FROM a.AppointmentDate) AS Month, COUNT(a.AppointmentID) AS TotalAppointments
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
GROUP BY p.PatientID, Month;

-- Ranking Appointments
SELECT a.AppointmentID, a.DoctorID, a.AppointmentDate, a.AppointmentTime,
       RANK() OVER (PARTITION BY a.DoctorID ORDER BY a.AppointmentDate) AS AppointmentRank
FROM Appointments a;


-- Pivot Table
SELECT 
    EXTRACT(YEAR FROM mr.RecordDate) AS Year,
    EXTRACT(MONTH FROM mr.RecordDate) AS Month,
    COUNT(pr.PrescriptionID) AS TotalPrescriptions
FROM Prescriptions pr
JOIN MedicalRecords mr ON pr.RecordID = mr.RecordID
GROUP BY EXTRACT(YEAR FROM mr.RecordDate), EXTRACT(MONTH FROM mr.RecordDate);

-- Finding Duplicates
SELECT FirstName, LastName, DOB, COUNT(*)
FROM Patients
GROUP BY FirstName, LastName, DOB
HAVING COUNT(*) > 1;

-- Doctor's Prescription Statistics
SELECT d.DoctorID, d.FirstName, d.LastName, ROUND(AVG(prescriptions_per_doctor),0) AS AvgPrescriptions
FROM (
    SELECT a.DoctorID, COUNT(pr.PrescriptionID) AS prescriptions_per_doctor
    FROM Appointments a
    JOIN Prescriptions pr ON a.AppointmentID = pr.RecordID
    GROUP BY a.DoctorID
) sub
JOIN Doctors d ON sub.DoctorID = d.DoctorID
GROUP BY d.DoctorID;




