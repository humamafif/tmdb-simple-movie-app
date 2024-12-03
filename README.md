# Simple Movie App

Simple Movie App is a Flutter-based mobile application that allows users to explore popular movies, search for movies by title, and view detailed information about movies, such as release dates, ratings, and synopses. The app also includes a user profile page and basic navigation features to enhance the user experience.

## Features

- **Home Page**: Displays a carousel of popular movies and the latest movie news.
- **Search Movie**: Allows users to search for movies based on the movie title.
- **Movie Details**: Provides detailed information about a selected movie, including release date, rating, and overview.
- **User Profile**: Displays the user's profile with options to edit and manage their profile.
- **Bottom Navigation**: Easy navigation between Home, Search, and Profile pages.

## Tech Stack

- **Flutter**: The primary framework used to build the app.
- **Dart**: Programming language used with Flutter.
- **The Movie Database (TMDb) API**: External API used to fetch movie data such as movie details, popular movies, etc.


## API Setup

To make the application work, you'll need to configure the API settings. This includes setting the **base URL** and the **API key** for the Movie Database (TMDb) API. Here's how to set it up:

1. Locate the file `api.dev.dart` in the project.
2. Inside the file, you will find the following placeholders:
   - `baseURL`: The base URL for the API.
   - `apiKey`: Your personal TMDb API key.
   
   You can sign up for a free TMDb API key [here](https://www.themoviedb.org/settings/api) if you haven't already.

3. Replace the placeholder values in `api.dev.dart` with your own TMDb API key. Make sure this file is not committed to the repository, as it contains sensitive information.

## Installation

To run this project locally, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/humamafif/tmdb-simple-movie-app.git
    ```

2. Navigate to the project directory:
    ```bash
    cd tmdb-simple-movie-app
    ```

3. Install the required dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app:
    ```bash
    flutter run
    ```

Make sure you have Flutter installed on your system. You can follow the official Flutter installation guide [here](https://flutter.dev/docs/get-started/install).
