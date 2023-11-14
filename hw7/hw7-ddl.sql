# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.


DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 


# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key (skills_id)
);




# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills(skills_id, skills_name, skills_description, skills_tag) values
 (1, 'kick boxing', 'visualize this!', 'Skill 1'),
 (2, 'python coding', 'writing python programs', 'Skill 2'),
 (3, 'data analysis', 'analyzing datasets', 'Skill 3'),
 (4, 'graphic design', 'creating visual elements', 'Skill 4'),
 (5, 'public speaking', 'effective communication', 'Skill 5'),
 (6, 'database management', 'managing and organizing data', 'Skill 6'),
 (7, 'web development', 'building interactive websites', 'Skill 7'),
 (8, 'problem solving', 'finding effective solutions', 'Skill 8');


 select * from skills;


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(255),
    people_last_name varchar(256) NOT NULL,
    people_email varchar(255),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(255),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);
# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

-- Add more records as needed
INSERT INTO people (people_id, people_first_name, people_last_name, people_email, people_linkedin_url, people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined)  
VALUES 
(1, 'John', 'Person 1', 'john@example.com', 'https://www.linkedin.com/in/john', 'https://example.com/john.jpg', 'john#1234', 'A brief bio about John.', '2023-01-01'),
(2, 'Jane', 'Person 2', 'jane@example.com', 'https://www.linkedin.com/in/jane', 'https://example.com/jane.jpg', 'jane#5678', 'A brief bio about Jane.', '2023-02-15'),
(3, 'Robert', 'Person 3', 'robert@example.com', 'https://www.linkedin.com/in/robert', 'https://example.com/robert.jpg', 'robert#9876', 'A brief bio about Robert.', '2023-03-20'),
(4, 'Emily', 'Person 4', 'emily@example.com', 'https://www.linkedin.com/in/emily', 'https://example.com/emily.jpg', 'emily#4321', 'A brief bio about Emily.', '2023-04-25'),
(5, 'Alex', 'Person 5', 'alex@example.com', 'https://www.linkedin.com/in/alex', 'https://example.com/alex.jpg', 'alex#6543', 'A brief bio about Alex.', '2023-05-10'),
(6, 'Sophia', 'Person 6', 'sophia@example.com', 'https://www.linkedin.com/in/sophia', 'https://example.com/sophia.jpg', 'sophia#1111', 'A brief bio about Sophia.', '2023-06-30'),
(7, 'Michael', 'Person 7', 'michael@example.com', 'https://www.linkedin.com/in/michael', 'https://example.com/michael.jpg', 'michael#2222', 'A brief bio about Michael.', '2023-07-15'),
(8, 'Jessica', 'Person 8', 'jessica@example.com', 'https://www.linkedin.com/in/jessica', 'https://example.com/jessica.jpg', 'jessica#3333', 'A brief bio about Jessica.', '2023-08-01'),
(9, 'David', 'Person 9', 'david@example.com', 'https://www.linkedin.com/in/david', 'https://example.com/david.jpg', 'david#4444', 'A brief bio about David.', '2023-08-15'),
(10, 'Sophie', 'Person 10', 'sophie@example.com', 'https://www.linkedin.com/in/sophie', 'https://example.com/sophie.jpg', 'sophie#5555', 'A brief bio about Sophie.', '2023-09-01');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 

INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 1, '2023-01-15'),
(3, 1, '2023-02-20'),
(6, 1, '2023-05-10'),
(3, 2, '2023-03-25'),
(4, 2, '2023-04-30'),
(5, 2, '2023-06-15'),
(1, 3, '2023-01-20'), 
(5, 3, '2023-04-05'),
(3, 5, '2023-03-10'),
(6, 5, '2023-05-20'),
(2, 6, '2023-02-15'),
(3, 6, '2023-03-30'),
(4, 6, '2023-04-15'),
(3, 7, '2023-03-05'),
(5, 7, '2023-04-20'),
(6, 7, '2023-05-05'),
(1, 8, '2023-01-10'),
(3, 8, '2023-02-15'),
(5, 8, '2023-04-10'),
(6, 8, '2023-05-25'),
(2, 9, '2023-02-10'),
(5, 9, '2023-04-15'),
(6, 9, '2023-06-01'),
(1, 10, '2023-01-25'),
(4, 10, '2023-04-20'),
(5, 10, '2023-05-15');



    

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int not null,
    roles_name varchar(255) not null,
    roles_sort_priority int not null,
    primary key (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_id, roles_name, roles_sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date NOT NULL,
    primary key (peopleroles_id),
    foreign key (people_id) references people(people_id),
    foreign key (role_id) references roles(roles_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
(1, 2, '2023-01-15'),
(2, 5, '2023-02-20'), (2, 6, '2023-02-20'),
(3, 2, '2023-03-25'), (3, 4, '2023-03-25'),
(4, 3, '2023-04-05'),
(5, 3, '2023-05-10'),
(6, 2, '2023-06-15'), (6, 1, '2023-06-15'),
(7, 1, '2023-03-20'),
(8, 1, '2023-04-25'), (8, 4, '2023-04-25'),
(9, 2, '2023-05-10'),
(10, 2, '2023-06-30'), (10, 1, '2023-06-30');

# select * from peopleroles;
# select * from people;
# select * from roles;
# select * from skills;
# select * from peopleskills;