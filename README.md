# Notes App

This project is a simple Notes application that utilizes a Django backend and a Flutter frontend. The application allows users to create, retrieve, update, and delete notes.

## Table of Contents

- [Description](#description)
- [Setup](#setup)
  - [Backend Setup (Django)](#backend-setup-django)
  - [Frontend Setup (Flutter)](#frontend-setup-flutter)
- [Running the Application](#running-the-application)
- [Project Structure](#project-structure)
- [Endpoints](#endpoints)

## Description

The Notes App is designed to demonstrate a full-stack application with a Django RESTful API and a Flutter-based mobile interface. Users can perform CRUD (Create, Read, Update, Delete) operations on notes. The backend handles data storage and management, while the frontend provides an interactive user interface.

### Features

- Create new notes.
- Retrieve all notes.
- Retrieve a specific note by ID.
- Update existing notes.
- Delete notes.

## Setup

### Backend Setup (Django)

1. **Install Dependencies:**
   Ensure you have Python and pip installed. Then, install Django and django-cors-headers.
   ```sh
   pip install django django-cors-headers
