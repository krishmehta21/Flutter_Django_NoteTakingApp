# Notes App

This project is a simple Notes application that utilizes a Django backend and a Flutter frontend. The application allows users to perform CRUD (Create, Read, Update, Delete) operations on notes. Users can create new notes, retrieve existing ones, update their content, and delete them as needed.

## Description

The Notes App demonstrates a full-stack application architecture where Django serves as the backend API provider and Flutter provides the mobile front-end interface. Django handles data storage and retrieval using a SQLite database, while Flutter renders the user interface for seamless note management.

### Features

- **Create**: Users can create new notes by entering text content.
- **Retrieve**: Notes can be retrieved either as a list of all notes or individually by their unique identifier.
- **Update**: Existing notes can be updated to modify their content.
- **Delete**: Notes can be deleted from the system when no longer needed.

## Setup

For detailed setup instructions for both the Django backend and the Flutter frontend, refer to the respective sections below.

### Backend Setup (Django)

1. **Install Dependencies**: Ensure Python, pip, Django, and django-cors-headers are installed.
2. **Create Django Project**: Initialize a new Django project and create a Django app for managing notes.
3. **Configure CORS**: Enable CORS for local development.
4. **Set Up Models and Views**: Define models to represent notes and views to handle CRUD operations.
5. **Run the Django Server**: Start the Django development server to serve the API.

### Frontend Setup (Flutter)

1. **Install Flutter**: Set up Flutter on your development machine.
2. **Integrate HTTP Package**: Use the `http` package to make HTTP requests to the Django backend.
3. **Create UI Components**: Design screens for creating, displaying, updating, and deleting notes.
4. **Handle Asynchronous Operations**: Implement state management to handle loading states and manage API calls.
5. **Test on Emulator or Device**: Run the Flutter app on an emulator or physical device to interact with the Notes App.

## Running the Application

To run the Notes App, start both the Django backend server and the Flutter frontend on your local machine. Ensure they are configured to communicate with each other over HTTP.

## Project Structure

- `notes_backend/`: Django project folder containing backend settings and configurations.
- `notes_backend/notes/`: Django app folder for managing notes models, views, and serializers.
- `flutter_app/`: Flutter project folder containing frontend Dart code for UI and business logic.

## Endpoints

- **GET `/notes`**: Retrieve all notes.
- **GET `/notes/id`**: Retrieve a specific note by ID.
- **POST `/notes/create/`**: Create a new note.
- **PUT `/notes/id/update/`**: Update an existing note by ID.
- **DELETE `/notes/id/delete/`**: Delete a note by ID.

These endpoints are used by the Flutter app to perform CRUD operations on notes stored in the Django backend.

