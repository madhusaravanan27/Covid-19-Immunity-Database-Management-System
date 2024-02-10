--Down Script 

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_clinic_details_clinic_patient_id')
    ALTER TABLE clinic_details DROP CONSTRAINT FK_clinic_details_clinic_patient_id;
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_doctor_details_doctor_patient_id')
    ALTER TABLE doctor_details DROP CONSTRAINT FK_doctor_details_doctor_patient_id;
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_patient_medical_history_patient_id')
    ALTER TABLE patient_medical_history DROP CONSTRAINT FK_patient_medical_history_patient_id;
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_patient_medical_history_covid_vaccination_id')
    ALTER TABLE patient_medical_history DROP CONSTRAINT FK_patient_medical_history_covid_vaccination_id;
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_covid_exposure_details_covid_patient_id')
    ALTER TABLE covid_exposure_details DROP CONSTRAINT FK_covid_exposure_details_covid_patient_id;


CREATE TABLE patient_details(
    patient_id int NOT NULL,
    patient_first_name varchar (30) NOT NULL,
    patient_last_name varchar (30) NOT NULL,
    patient_gender varchar (20) NOT NULL,
    patient_age char (20) NOT NULL,
    patient_phone_number char(20) NOT NULL,
    patient_email varchar (30) NOT NULL,
    patient_address_line1 varchar (50)NOT NULL,
    patient_address_line2 varchar (50)NOT NULL,
    patient_address_state varchar (50)NOT NULL,
    patient_address_city varchar (50) NOT NULL,
    patient_address_zipcode varchar (20) NOT NULL,
   
    CONSTRAINT PK_patient_details_patient_id PRIMARY KEY (patient_id),
    CONSTRAINT U_patient_details_patient_email UNIQUE (patient_email) )

   CREATE TABLE  clinic_details(
    clinic_id char(20) NOT NULL,
    clinic_patient_id INT NOT NULL,
    clinic_name varchar (30) NOT NULL,
    clinic_phone_number char (30) NOT NULL,
    clinic_email_id varchar (20) NOT NULL,
    clinic_doctor_id varchar (30) NOT NULL,
    doctor_first_name varchar (30) NOT NULL,
    doctor_last_name varchar (30) NOT NULL,
    clinic_addressline1 varchar (30)NOT NULL,
    clinic_addressline2 varchar (30)NOT NULL,
    clinic_address_state varchar (50)NOT NULL,
    clinic_address_city varchar (50) NOT NULL,
    clinic_address_zipcode varchar (20) NOT NULL,

   
    CONSTRAINT PK_clinic_details_clinic_id PRIMARY KEY (clinic_id),
    CONSTRAINT U_clinic_details_clinic_email UNIQUE (clinic_email_id) ,
constraint FK_clinic_details_clinic_patient_id FOREIGN KEY (clinic_patient_id) REFERENCES patient_details (patient_id) )

CREATE TABLE doctor_details (
    doctor_id  int NOT NULL,
    doctor_patient_id int NOT NULL,
    doctor_first_name varchar (30) NOT NULL,
    doctor_last_name varchar (30) NOT NULL,
    doctor_email varchar (30) NOT NULL,
    doctor_phone char (20) NOT NULL

CONSTRAINT PK_doctor_details_doctor_id PRIMARY KEY (doctor_id),
CONSTRAINT U_doctor_details_doctor_email UNIQUE (doctor_email),
constraint FK_doctor_details_doctor_patient_id FOREIGN KEY (doctor_patient_id) REFERENCES patient_details (patient_id) )


CREATE TABLE patient_medical_history(
    patient_record_id INT  NOT NULL,
    existing_medical_conditions varchar(20) NOT NULL,
    previous_surgeries varchar (30) NOT NULL,
    covid_vaccination_id int  NOT NULL,
    immunization_record char (20) NOT NULL,
   
    CONSTRAINT PK_patient_medical_history_patient_record_id PRIMARY KEY (patient_record_id),

constraint FK_patient_medical_history_patient_id FOREIGN KEY (patient_record_id) REFERENCES patient_details (patient_id))

    




CREATE TABLE antibody_testing_records(
    patient_record_id int  NOT NULL,
    test_id int   NOT NULL,
    test_performed_date date NOT NULL,
    result varchar (10) NOT NULL,
    vaccination_id int  NOT NULL,
    
   
    CONSTRAINT PK_antibody_testing_records_test_id PRIMARY KEY (test_id) ,

constraint FK_antibody_testing_records_patient_record_id FOREIGN KEY (patient_record_id) REFERENCES patient_details (patient_id))

    



CREATE TABLE covid_exposure_details(
    covid_patient_id int  NOT NULL,
    date_of_infection date NOT NULL,
    infection_severity varchar (30) NOT NULL,
    exposure_frequency varchar (30) NOT NULL,
    covid_symtomps varchar (20) NOT NULL,
    treatment_details varchar (20) NOT NULL,
    source varchar (20) NOT NULL

   
    CONSTRAINT PK_covid_exposure_details_covid_patient_id PRIMARY KEY (covid_patient_id),
    
constraint FK_covid_exposure_details_covid_patient_id FOREIGN KEY (covid_patient_id) REFERENCES  patient_details (patient_id) )

INSERT into patient_details
( patient_id ,patient_first_name, patient_last_name, patient_gender, patient_age, patient_phone_number, patient_email, patient_address_line1, patient_address_line2, patient_address_state, patient_address_city,patient_address_zipcode) 
VALUES (1000, 'Samar', 'Zemeer', 'M', '24', 7474940100 , 'szemeer@gmail.com', '1412 E Genesse' , 'Apt 1', 'NY' , 'Syracuse', 13210),
(1001, 'Shabib', 'Khan', 'M', '26', 3153959563 , 'khansaab@gmail.com', '217 Kensington Rd' , 'Apt 1', 'NY' , 'Syracuse', 13210),
 (1002,'Yursulaf', 'Sheikh', 'M', '54', 3168534097 , 'yursulafsmiles@gmail.com', '1095 E Fayette' , 'Apt 2', 'NY' , 'Syracuse', 13210),
 (1003,'Vishal', 'Polamarasetti', 'M', '30', 6805342100, 'vpolamarasetti@gmail.com', '108 Lexington' , 'Apt 5', 'NC' , 'Charlotte', 28134),
(1004,'Anuradha', 'Wilmes', 'F', '28', 3157093423 , 'anuradhawilmes54@gmail.com', '1322 Wall Street' , 'Apt 1', 'NY' , 'New York City', 10005)



INSERT into doctor_details  

(doctor_patient_id, doctor_id, doctor_first_name, doctor_last_name, doctor_phone, doctor_email)  

 VALUES (1000,2000, 'Subhash', 'Mahadev', '3153957173', 'subhashmahadev@medicare.com'), 

 (1001,2001, 'Dino', 'Espasito','3153957171', 'dinoespasito@scrouse.com'), 

    (1002,2002, 'Kara', 'Howard', '3153957176', 'karahoward@scrouse.com'), 

    (1003,2003, 'Whitaker', 'Ellis', 3153957178, 'whitakerellis@scrouse.com'), 

    (1004,2004, 'Rong', 'Li', 3153957174, 'rongli@scrouse.com') 

    INSERT into clinic_details 

(clinic_id, clinic_patient_id, clinic_name, clinic_phone_number, clinic_email_id, clinic_doctor_id, doctor_first_name, doctor_last_name, clinic_addressline1, clinic_addressline2, clinic_address_state, clinic_address_city, clinic_address_zipcode)  

VALUES (3000, 1000, 'Wellnow Urgent Care', '089154321', '3care@gmail.com', 2000, 'Subhash', 'Mahadev', '1600 Erie Blvd E', 'Floor 0', 'NY', 'Syracuse', 13210), 

(3001, 1001, 'Syracuse Health Centre', '089166672', 'schc@gmail.com', 2001, 'Dino', 'Espasito', '1938 E Fayette St', 'Floor 0', 'NY', 'Syracuse', 13210) ,

(3002, 1002, 'Family Wellness Centre', '089198765', 'fmhc@gmail.com', 2002, 'Kara', 'Howard', '1200 E Genesse st', 'Floor 0', 'NY', 'Syracuse', 13210), 

(3005, 1003, 'Wellnow Urgent Care', '089154321', '1care@gmail.com', 2003, 'Whitaker', 'Ellis', '1600 Erie Blvd E', 'Floor 0', 'NY', 'Syracuse', 13210) ,

(3006, 1004, 'Syracuse Health Centre', '089154321', 'urgentcare@gmail.com', 2004, 'Rong', 'Li', '1600 Erie Blvd E', 'Floor 0', 'NY', 'Syracuse', 13210) 

----------Antibody Testing records Table 

 

INSERT into antibody_testing_records 

(patient_record_id, test_id, test_performed_date, result, vaccination_id)  

VALUES (1000,100, '07-12-2022', 'positive', 310) ,

(1001,101, '04-16-2022', 'positive', 311) ,

(1002,102, '08-28-2022', 'positive', 312) ,

(1003,103, '07-21-2022', 'positive', 313) ,

(1004,104, '07-31-2022', 'positive', 314) 

 

-----Insert Covid Exposure Details 

INSERT into covid_exposure_details  

(covid_patient_id, date_of_infection, infection_severity, exposure_frequency, covid_symtomps, treatment_details, source)  

VALUES 
(1000, '07-12-2022', 'severe', '5', 'fever cough', 'urgent care', 'neighbor' ) ,

(1001, '04-16-2022', 'severe', '5','fever fatigue', 'urgent care', 'family') ,

(1002, '08-28-2022', 'low', '1', 'cold fatigue','mild care' ,'family' ) ,

(1003, '07-21-2022', 'mild', '3', 'cold cough', 'mild care', 'colleague') ,

(1004, '07-31-2022', 'mild', '2', 'cough fatigue','mild care', 'neighbor' ) 

 

-----Insert Patient Medical History 

 

INSERT into patient_medical_history  

(existing_medical_conditions, previous_surgeries,  immunization_record, covid_vaccination_id, patient_record_id)  

 VALUES ('BP Sugar', 'Heart Surgery', 3, 300, 1000) ,

('Liver damage','none', 2, 301, 1001) ,

('Lung Failure','none',0, 302, 1002) ,

('Kidney Failure','none', 1, 303, 1003) ,

('None','none', 0, 304, 1004) 




 select * from patient_medical_history 
 select * from doctor_details  
 select  * from clinic_details
 select * from  covid_exposure_details
 select * from antibody_testing_records

 ---user story 5
 UPDATE patient_details

SET patient_first_name= 'Jane', patient_last_name='Doe',patient_gender='F',patient_age='64',patient_phone_number = '9876543210', patient_email = 'janedoe@example.com', patient_address_line1='123', patient_address_line2='Euclid Avenue', patient_address_state='NY', patient_address_city='Syracuse',patient_address_zipcode='13210'
WHERE patient_id = 1000; 

select * from patient_details


--- user story 7
 SELECT * FROM patient_details
LEFT JOIN covid_exposure_details
ON patient_details.patient_id = covid_exposure_details.covid_patient_id;

----user story 4
INSERT doctor_details (doctor_patient_id, doctor_id, doctor_first_name, doctor_last_name, doctor_phone, doctor_email) 
VALUES (1006,97623, 'Leela', 'Abhram', '3153998173' , 'leelaabhram@medicare.com')
select * from doctor_details

INSERT into patient_details
( patient_id ,patient_first_name, patient_last_name, patient_gender, patient_age, patient_phone_number, patient_email, patient_address_line1, patient_address_line2, patient_address_state, patient_address_city,patient_address_zipcode) 
VALUES (1005,'Laura','Jean', 'F', '26', 7475980100 , 'laurajeanr@gmail.com', '890 E Genesse' , 'Apt 1', 'NY' , 'Syracuse', 13210)

--- user story 6
INSERT INTO covid_exposure_details(covid_patient_id, date_of_infection, exposure_frequency,infection_severity, covid_symtomps, treatment_details,source) 

VALUES (1005, '2022-04-28', '3','Mild', 'Fever fatigue', 'mild care','family');

select * from covid_exposure_details where covid_patient_id =1005
 