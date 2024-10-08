# ATCG-Database-Project

DBMS + Web Design project for Apostleland Trading Card Game.

## Project Overview
This project is a web-based database application that serves to improve the quality of life for players of the Apostleland Trading Card Game (ATCG) by creating a centralized online database where all currently created cards can be viewed, filtered, and sorted. Inspired by similar applications for other Trading Card Games such as Magic the Gathering's Scryfall, the project uses MySQL for the database, React.js for the frontend, and Tailwind CSS for styling.

## Collaborators:
- **Ethan Wen**: Project Lead, Project Specifications, ER Design, Relational Schema, Data Production and Formatting, Graphic Elements
- **Kyaw Soe Han**: Database Functional Requirements, ER Design, Relational Schema, Relation Normalization, MySQL Initialization Statements
- **Kyle Chen**: Front-End Development, Back-End Development, Searching and Sorting Components, Front-End Routing, Generating and Formatting Search Queries, Front-End to Back-End Connection, Backend Routes, NodeJS Search and Filter Queries
- **Mathew Estrada**: Front-End Development, User Interface Design, Home Page / Advanced Search Implementation, User Input Handling, Random Card Generator, Card Details Page, Search Results Display
- **Nathan Pham**: Back-End Development, Database Management, REST API, Web Server, Routes and Controllers, API Testing, Data Interaction

## Repository Structure

### Backend
The backend part of the project handles the database operations and serves the API endpoints required by the frontend.

#### Initialization and Insert Scripts
- `InitializeDB.sql`: Initializes and populates the database schema. Only this script is needed to be run for the database. 
- `InsertStatements/`: Contains individual SQL scripts for populating the database with initial data for reference. All the populating is already done by InitializeDB.sql.

#### API and Models
- `index.js`: The entry point for the backend server.
- `database.js`: Configures the database connection.
- `controllers/`: Contains controller files that handle the logic for API endpoints.
- `models/`: Includes models that define the schema for database tables.
- `routes/`: Contains route definitions for API endpoints.

#### Configuration and Tests
- `package.json`: Manages package dependencies and scripts.
- `server.test.js`: Contains tests for the backend server.

### Frontend
The frontend provides the user interface, allowing users to interact with the data managed by the backend.

#### Public Assets
- `public/`: Hosts static files like images, icons, and the main HTML document.

#### React Components and Pages
- `src/components/`: Contains reusable React components like buttons and cards.
- `src/pages/`: React components that represent entire pages of the app, such as the home page and search page.

### Data and Images
- `data/json-data/`: Stores static data in JSON format.
- `public/images/`: Contains image files used throughout the application.

## Setup and Installation
Instructions on how to set up and run the project locally.

### Requirements
- Node.js
- npm

### Installation
Front-End
1. cd into the frontend folder
2. run 'npm install' to download all frontend dependencies
3. run 'npm start' to start the npm server
```bash
cd ./atcg/frontend
npm install
npm start
```

Back-End
1. cd into the backend folder
2. run 'npm install' to download all backend dependencies
3. open an sql connection to an sql server and run the sql script initializeDB.sql to create the database, necessary tables, and populate the data(the default connection being used is the root localhost)
5. create a .env file inside the backend folder containing, specifying the environment variables associated with the previous sql connection:
```bash
// example
  DB_HOST='localhost'
  DB_USER='root'
  DB_PASSWORD='pass123'
  DB_NAME='atcg'
```
6. Finally start the node backend server, passing in the .env file on the index.js file
```bash
cd ./atcg/backend
npm install
node --env-file=.env index.js
```

## Usage
Details on how to use the application, including any available scripts and commands.
After starting both frontend and backend servers, the application should be ready to be used

## Contributing
Guidelines for contributing to the project.

## License
Information about the project's license.

## Contact
Details on how to contact the maintainers of the project.
