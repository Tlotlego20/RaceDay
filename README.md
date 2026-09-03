# RaceDay
Assignment Part1


## Project Overview

RaceDay is a web-based event management system designed to manage running and cycling events. The system allows organisers to create events, manage categories, view participant enrolments and record race results. Participants can register, view events, enrol in categories and view their results.

## Assignment Objectives

The purpose of this project is to:

- Design the RaceDay database structure.
- Create an Entity Relationship Diagram (ERD).
- Plan the system API endpoints.
- Create the database using Microsoft SQL Server.
- Apply primary keys, foreign keys and database constraints.
- Insert sample data for testing.
- Use GitHub to manage and document the project.

## Database Design

The database contains six entities:

1. **Organisers** – stores organiser information.
2. **Participants** – stores participant information.
3. **Events** – stores RaceDay event information.
4. **Categories** – stores event categories and entry fees.
5. **Enrolments** – stores participant event registrations.
6. **Results** – stores participant race results.

### Relationships

- Organisers → Events: **1:M**
- Events → Categories: **1:M**
- Participants → Enrolments: **1:M**
- Events → Enrolments: **1:M**
- Categories → Enrolments: **1:M**
- Enrolments → Results: **1:1**

The `Enrolments` table connects participants to events and categories.

## API Planning

The API plan covers:

- Authentication and login
- User profiles
- Event management
- Event categories
- Participant enrolments
- Race results

The complete API Endpoint Plan is available in:

`/docs/API-Endpoint-Plan.md`

## SQL Database

The database was created using **Microsoft SQL Server and SQL Server Management Studio (SSMS)**.

The SQL script includes:

- Database and table creation
- Primary and foreign keys
- NOT NULL and UNIQUE constraints
- DEFAULT and CHECK constraints
- Sample data
- JOIN and SELECT queries for testing

The database contains **24 sample data rows**:

The SQL script is available 


