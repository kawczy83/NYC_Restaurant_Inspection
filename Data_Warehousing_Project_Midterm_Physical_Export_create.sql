-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-11-06 02:06:55.405

-- tables
-- Table: dim_location
CREATE TABLE dim_location (
    location_id int  NOT NULL,
    boro varchar(50)  NULL,
    building varchar(50)  NULL,
    street varchar(50)  NULL,
    zipcode varchar(10)  NULL,
    lat decimal(4,4)  NULL,
    long decimal(4,4)  NULL,
    CONSTRAINT dim_location_pk PRIMARY KEY (location_id)
);

-- Table: dim_name
CREATE TABLE dim_name (
    name_id int  NOT NULL,
    camis int  NOT NULL,
    name varchar(50)  NULL,
    cuisine_desc varchar(50)  NULL,
    phone varchar(50)  NULL,
    CONSTRAINT dim_name_pk PRIMARY KEY (name_id)
);

-- Table: dim_violation
CREATE TABLE dim_violation (
    violation_id int  NOT NULL,
    violation_code varchar(5)  NOT NULL,
    violation_desc text  NOT NULL,
    critical_flag boolean  NOT NULL,
    CONSTRAINT dim_violation_pk PRIMARY KEY (violation_id)
);

-- Table: fact_table
CREATE TABLE fact_table (
    location_id int  NOT NULL,
    name_id int  NOT NULL,
    violation_id int  NOT NULL,
    inspect_date date  NOT NULL,
    grade_date date  NOT NULL,
    grade int  NOT NULL,
    score int  NOT NULL,
    bbl int  NOT NULL,
    CONSTRAINT fact_table_pk PRIMARY KEY (location_id,name_id,violation_id)
);

-- foreign keys
-- Reference: fact_table_dim_location (table: fact_table)
ALTER TABLE fact_table ADD CONSTRAINT fact_table_dim_location
    FOREIGN KEY (location_id)
    REFERENCES dim_location (location_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_table_dim_name (table: fact_table)
ALTER TABLE fact_table ADD CONSTRAINT fact_table_dim_name
    FOREIGN KEY (name_id)
    REFERENCES dim_name (name_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fact_table_dim_violation (table: fact_table)
ALTER TABLE fact_table ADD CONSTRAINT fact_table_dim_violation
    FOREIGN KEY (violation_id)
    REFERENCES dim_violation (violation_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

