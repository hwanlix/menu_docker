

---

````md
# 🍹 Kolekcja ulubionych przepisów do koktajli 

## 📝 Opis projektu

Aplikacja społecznościowa do dzielenia się przepisami na koktajle. Pozwala użytkownikom tworzyć, edytować i przeglądać
przepisy, oceniać je oraz zapisywać swoje ulubione. Projekt powstał z myślą o pasjonatach domowego miksowania i
kulinariów.

Projekt został przygotowany zgodnie z wymaganiami przedmiotu **Tworzenie aplikacji dla środowisk chmurowych** – aplikacja uruchamiana jest w całości za pomocą **Docker Compose**.

---

## 👩‍🎓 Autor

- **Imię i nazwisko:** Aliaksandra Kurlovich
- **Nr albumu:** 52301

---

## 🔧 Funkcjonalności

### 👤 Użytkownicy
- Rejestracja i logowanie
- Edycja danych profilowych
- Obsługa sesji, autoryzacja i middleware

### 🍸 Przepisy
- Dodawanie przepisów (nazwa, opis, składniki, zdjęcie, instrukcja)
- Edycja i usuwanie własnych przepisów
- Przeglądanie listy koktajli i szczegółowych widoków
- Zapisywanie ulubionych przepisów
- Komentowanie i ocenianie

### 🖥️ Interfejs
- Responsywny wygląd dopasowany do ekranów mobilnych
- Przejrzysta nawigacja
- System powiadomień i komunikatów flash

---

## 📁 Struktura projektu

```bash
Kolekcja-ulubionych-przepisów-do-koktajli/
├── controllers/               # Kontrolery obsługujące logikę biznesową
│   ├── przepisController.js   # Logika związana z przepisami
│   └── userController.js      # Logika związana z użytkownikami
│
├── middleware/                # Własne middleware aplikacji
│   ├── auth.js                # Middleware autoryzacji użytkownika
│   └── upload.js              # Obsługa przesyłania zdjęć (multer)
│
├── models/                    # Modele danych dla MongoDB (Mongoose)
│   ├── Przepis.js             # Model przepisu koktajlu
│   └── User.js                # Model użytkownika
│
├── public/                    # Statyczne pliki (CSS, JS, obrazy)
│
├── routes/                    # Definicje tras
│   ├── przepisy.js            # Routing związany z przepisami
│   └── users.js               # Routing związany z użytkownikami
│
├── screenshots/               # Zrzuty ekranu aplikacji do README
│
├── views/                     # Szablony EJS do renderowania widoków
│   ├── layouts/               # Układy bazowe HTML
│   ├── partials/              # Header, footer, komunikaty flash
│   ├── przepisy/              # Widoki listy i detali przepisów
│   └── users/                 # Widoki rejestracji, logowania, profilu
│
├── .env                       # Zmienne środowiskowe
├── Dockerfile                 # Konfiguracja kontenera aplikacji
├── docker-compose.yml         # Konfiguracja uruchomienia aplikacji + bazy
├── app.js                     # Główny plik aplikacji Express
└── package.json               # Plik konfiguracyjny projektu
````

---

## 🧰 Wykorzystane biblioteki

* express - framework webowy dla Node.js
* mongoose - ODM (Object Data Modeling) dla MongoDB
* ejs - silnik szablonów
* bcryptjs - hashowanie haseł
* express-session - zarządzanie sesjami
* connect-flash - komunikaty flash
* multer - obsługa przesyłania plików
* dotenv - zarządzanie zmiennymi środowiskowymi
* method-override - obsługa metod HTTP
* express-ejs-layouts - układ szablonów EJS

---

# 🐳 Uruchomienie projektu przez Docker (zalecane)

## ✅ Wymagania

* Docker
* Docker Compose
* Docker Desktop (Windows/macOS)

### 📌 Instalacja Docker Desktop (Windows/macOS)

1. Pobierz i zainstaluj **Docker Desktop** ze strony Docker.
2. Uruchom Docker Desktop.
3. Sprawdź czy Docker działa:

```bash
docker --version
docker compose version
```

---

## 🛠️ Instalacja i uruchomienie

### 1) Sklonuj repozytorium

```bash
git clone https://github.com/hwanlix/menu_docker.git
cd Kolekcja-ulubionych-przepis-w-do-koktajli
```

### 2) Skonfiguruj plik `.env`

Utwórz plik `.env` w katalogu głównym projektu i uzupełnij:

```env
PORT=3000
SECRET_KEY=supersecretkey123
MONGODB_URI=mongodb://mongo:27017/koktajle
```

> W Dockerze host bazy danych to `mongo` (nazwa serwisu w docker-compose), a nie `localhost`.

### 3) Uruchom aplikację (pełne środowisko)

```bash
docker compose up --build
```

Aplikacja będzie dostępna pod adresem:

```text
http://localhost:3000
```

---

## 🔥 Przydatne komendy Docker

Uruchomienie w tle:

```bash
docker compose up -d --build
```

Podgląd logów:

```bash
docker compose logs -f
```

Zatrzymanie kontenerów:

```bash
docker compose down
```

Zatrzymanie + usunięcie wolumenów (reset bazy danych):

```bash
docker compose down -v
```

---

# 💻 Uruchomienie lokalne (bez Dockera)

## ✅ Wymagania

* Node.js v14 lub nowszy
* npm v6 lub nowszy
* MongoDB lokalnie lub MongoDB Atlas
* Express.js v4.21.2

### 🛠️ Instalacja

```bash
npm install
```

Uzupełnij `.env`:

```env
PORT=3000
SESSION_KEY=super_tajny_klucz
MONGODB_URI=mongodb://localhost:27017/koktajle
```

Uruchom:

* Tryb deweloperski:

  ```bash
  npm run dev
  ```
* Tryb produkcyjny:

  ```bash
  npm start
  ```

Aplikacja będzie dostępna pod adresem:

```text
http://localhost:PORT
```

---

## 🧪 Przykładowe dane wejściowe

### 👤 Rejestracja:

* Nazwa użytkownika - `test`
* Email - `test@test.test`
* Hasło - `testtest` (min. 6 znaków)
* Potwierdź hasło

### 🔑 Logowanie:

* Email - `test@test.test`
* Hasło - `testtest`

### 🍸 Dodawanie przepisu:

* Nazwa przepisu
* Czas przygotowania (5–60 min co 5)
* Składniki: nazwa + ilość + jednostka (możliwość dodania wielu)
* Instrukcje przygotowania
* Dodanie pliku obrazu
* Dodanie tagów

### ⭐ Dodawanie komentarzy:

* Komentarz (opcjonalnie)
* Ocena (1–5 gwiazdek)

### 👤 Edycja profilu:

* Nazwa użytkownika
* Email
* Obecne hasło
* Nowe hasło (min. 6 znaków)
* Potwierdź nowe hasło

### ❤️ Ulubione:

* przycisk „Dodaj do ulubionych”

````


