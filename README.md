# 🤖 GENIE AI

GENIE AI is a Flutter-based Voice AI Assistant that answers your questions using ChatGPT and generates images using DALL·E — all through **voice commands** only. Powered by OpenAI API, GENIE AI offers a fully hands-free, intuitive experience combining text-based and image-based AI responses.

## ✨ Features

- 🎙️ Voice-controlled AI assistant
- 🧠 ChatGPT-powered conversational answers
- 🖼️ DALL·E image generation using voice prompts
- 🔊 Text-to-speech responses
- 💡 Clean and intuitive UI
- ⚡ Built with Flutter for cross-platform support

## 🚀 How It Works

1. Press the **mic button** and speak your query.
2. GENIE AI converts your speech to text using the `speech_to_text` package.
3. If the prompt is a question, it sends it to **ChatGPT**.
4. If the prompt is an image request (e.g., "Generate an image of a cat astronaut"), it calls **DALL·E**.
5. Response is either:
   - Spoken aloud using `flutter_tts`
   - Displayed as an AI-generated image

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **OpenAI API**
- **speech_to_text** for speech recognition
- **flutter_tts** for voice output
- **http** for API communication

## 🔐 API Key Setup

1. Get your OpenAI API key from [platform.openai.com](https://platform.openai.com/)

2. Create a `.env` file in the root directory
3. Add your API key:
   ```
   API_KEY=your_api_key_here
   ```
4. Make sure `.env` is listed in your `.gitignore`

## 📱 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/genie-ai.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Set up your API key as described above
4. Run the app:
   ```bash
   flutter run
   ```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- OpenAI for their powerful APIs
- Flutter team for the amazing framework
- All contributors and users of GENIE AI
