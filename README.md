# 🪐 Mars Cam

A simple Ruby on Rails app that pulls daily images from NASA’s Mars Rover API and lets users search for photos by sol (Martian day).

Built with:
- Rails 8
- NASA Open API
- ActiveRecord
- A sprinkle of space magic

---

## 🚀 Features

- 💫 Automatically fetches and saves a new Mars photo each day  
- 🔍 Users can enter a sol and view a photo from that specific Martian day  
- 🖼️ Clean UI for browsing today’s photo and searching others  
- ⚙️ Rake task included for automated photo fetching  
- 🔐 API key is stored securely via dotenv (never hardcoded)  

---

## 📦 Setup

1. Clone the repo:

```bash
git clone https://github.com/your-username/mars_cam.git
cd mars_cam
```

2. Install dependencies:

```bash
bundle install
```

3. Set up your `.env` file:

Create a `.env` in the root directory:

```bash
touch .env
```

Add your NASA API key:

```env
NASA_API_KEY=your_actual_key_here
```

4. Set up the database:

```bash
rails db:create db:migrate
```

5. Run the server:

```bash
rails server
```

---

## 🛠 Rake Task

You can fetch a new random photo (and save it) using:

```bash
rails mars:fetch_daily
```

This uses a random sol between 1000–1500. You can tweak this in `NasaApiService`.

---

## 🧪 Testing

To run tests:

```bash
rails test
```

Make sure your test suite is happy and that `.env` isn't committed (your secrets are sacred).

---

## 🧼 Linting

Run Rubocop:

```bash
bundle exec rubocop -A
```

---

## 📡 NASA API

Data is sourced from NASA’s [Mars Rover Photos API](https://api.nasa.gov/). Requires a free API key.

---
