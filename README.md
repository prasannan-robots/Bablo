# Mentor AI Productivity Partner
### "Distraction is like a parasite to the mind. If you don’t kill distraction, distraction will kill your dreams." -Some Giga Chad

## Why are we doing this?
We have very little time on this planet and we have lots of ideas to create and people to speak. We should not waste our precious time on scrolling reels which gives us dopamine a fake illusion of happiness. This project is aimed to create a world where we can grow enjoy and experience this life

## Downloads

[Android](https://github.com/prasannan-robots/Bablo/releases/download/v2.1.2/app-arm64-v8a-release.apk)

## How this works?
We get data from users and send them through ai model currently we use gpt3.5 to process the information and give you suggestions and criticism to make you grow. Do check the code

### Working Flow

- Users can write about themselves and their beliefs in the journal section.
- Users can enter their interests.
- Mentor analyzes your work and gives suggestions and recommendations to imporve your life
- Mentor fetches recommended YouTube videos based on the user's interests and journal.
- Recommended videos are displayed with titles and an embedded YouTube player.
- The app uses OpenAI's GPT-3.5 Turbo language model for AI interactions.

This is an open-source Flutter application. The app understands user goals, beliefs, and interests to offer personalized social media posts. The code provided includes both the Flutter front-end and FastAPI server back-end.

# Screenshots
### Home

![mentor-v2 1 0-Screenshot 2024-01-20 222539](https://github.com/Bablo-AD/Mentor/assets/64462247/9c521313-3b65-43a8-89d4-6c789aa29cbd)


### Daily journals

![Journal Page](https://github.com/Bablo-AD/Mentor/assets/64462247/d6cb95b0-0751-4549-8124-b9d6f8e070cc)

### Ask quesitons and connect

![Chat Page](https://github.com/Bablo-AD/Mentor/assets/64462247/7fa8250f-be94-4c19-85f4-0b22d90ea67c)


## Features

- User can write about themselves and their beliefs in the journal section.
- User can enter their interests.
- The app fetches recommended YouTube videos based on the user's interests and journal.
- Recommended videos are displayed with titles and an embedded YouTube player.
- The app uses OpenAI's GPT-3.5 Turbo language model for AI interactions.

## Prerequisites for devs

To run this application, you need the following:

- Flutter SDK installed
- Android Emulator or iOS Simulator
- Python with FastAPI installed
- YouTube Data API key
- OpenAI API key

## Getting Started

1. Clone the repository:

```shell
git clone <repository_url>
```

2. Set up the Flutter project by running the following command in the project directory:

```shell
flutter pub get
```
### Check [mentor-server](https://github.com/bablo-AD/Mentor-server) for python code

3. Configure the YouTube Data API key and OpenAI API key:
   - Replace the `DEVELOPER_KEY` variable in the `recommendation_system.py` file with your YouTube Data API key.
   - Set your OpenAI API key as an environment variable with the name `OPENAI_API_KEY`.

4. Start the FastAPI server by running the following command in the project directory:

```shell
uvicorn main:app
```

5. Launch the Flutter application on an Android emulator or iOS simulator:

```shell
flutter run
```

## Usage

1. On the home screen, the user can write about themselves and their beliefs in the journal section by tapping on it.
2. Enter your interests in the provided text field and tap the search button (magnifying glass icon) to fetch recommended YouTube videos.
3. Recommended videos will be displayed with titles and an embedded YouTube player.
4. Tap on a video to open it in the YouTube app or browser.
5. The recommendation section shows a text summary generated by the AI assistant.

## How It Works

The application uses Flutter for the front-end and FastAPI for the back-end server. The Flutter app sends requests to the FastAPI server, which interacts with the YouTube Data API and OpenAI's GPT-3.5 Turbo language model.

The Flutter code consists of two main screens:
- **HomePage**: Displays the journal section and the interest input field. It sends requests to fetch recommended YouTube videos.
- **JournalPage**: Allows the user to write in the journal section.

Watch explanatory videos for more info

Feel free to explore and modify the code to enhance the functionality of the AI social media assistant app!
