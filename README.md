# PhraseMate Backend

## Overview
PhraseMate is a backend application designed to manage and enhance phrase learning through advanced search, filtering, and quiz features.

## Setup Instructions

### Ruby Version
- Ensure you have Ruby version 3.0 or higher installed.

### System Dependencies
- PostgreSQL for database management.

### Configuration
- Clone the repository and navigate to the project directory.
- Install dependencies using `bundle install`.

### Database Setup
- Create and migrate the database using:
  ```bash
  rails db:create
  rails db:migrate
  ```

### Running the Application
- Start the Rails server:
  ```bash
  rails server
  ```

## Features Implemented

### Phrase Management System
- **Multiple Examples**: Phrases can have multiple examples stored as arrays.
- **Search and Filtering**: Filter phrases by category, difficulty, tags, and keywords.

### Pagination
- Integrated `kaminari` for paginating phrase listings and search results.

### Quiz Feature
- **Quiz and Question Models**: Created models to manage quizzes and their questions.
- **API Endpoints**: Implemented endpoints for creating quizzes and submitting answers.

## Next Steps

### User Progress Tracking
- Implement features to track user progress and performance over time.

### Quiz Analytics
- Provide insights and analytics on quiz performance.

### Enhance Quiz Features
- Add more question types, such as true/false or fill-in-the-blank.

### Frontend Integration
- Ensure the API is ready for frontend integration.

This README provides a comprehensive overview of the PhraseMate backend project, detailing the setup process, features implemented, and potential future enhancements.
