

````md
# 🍹 Kolekcja ulubionych przepisów do koktajli (menu_docker)

## 📝 Opis projektu
Aplikacja webowa typu społecznościowego do dzielenia się przepisami na koktajle. Użytkownicy mogą tworzyć, edytować i przeglądać przepisy, oceniać je, komentować oraz zapisywać swoje ulubione pozycje.

Projekt został przygotowany zgodnie z wymaganiami przedmiotu **Tworzenie aplikacji dla środowisk chmurowych** – uruchomienie aplikacji wraz z bazą danych odbywa się w całości poprzez **Docker Compose**.

---

## 👩‍🎓 Autor
- **Imię i nazwisko:** Aliaksandra Kurlovich  
- **Nr albumu:** 52301  

---

## 🎯 Cel projektu (wymagania przedmiotu)
Projekt demonstruje:
- uruchomienie aplikacji webowej w kontenerze Docker,
- uruchomienie bazy danych MongoDB w osobnym kontenerze,
- komunikację aplikacji z bazą danych w sieci Docker (`mongo` jako host),
- konfigurację aplikacji przez zmienne środowiskowe (`.env`),
- automatyczne uruchomienie pełnego środowiska komendą `docker compose up`.

---

## 🔧 Funkcjonalności

### 👤 Użytkownicy
- Rejestracja i logowanie
- Obsługa sesji użytkownika (express-session)
- Middleware autoryzacji
- Edycja profilu

### 🍸 Przepisy
- Dodawanie przepisu: nazwa, opis, składniki, instrukcja, tagi, zdjęcie
- Edycja i usuwanie własnych przepisów
- Lista przepisów oraz widoki szczegółowe
- Ulubione przepisy
- Komentarze i oceny (1–5)

### 🖥️ Interfejs
- Responsywny wygląd
- Nawigacja po aplikacji
- Komunikaty flash

---

## 🧰 Wykorzystane technologie i biblioteki
- **Node.js** + **Express**
- **MongoDB** + **Mongoose**
- **EJS** (szablony)
- bcryptjs (hashowanie haseł)
- express-session (sesje)
- connect-flash (komunikaty)
- multer (upload zdjęć)
- dotenv (zmienne środowiskowe)
- method-override
- express-ejs-layouts

---

## 📁 Struktura projektu

```bash
menu_docker/
├── controllers/               # Logika aplikacji
│   ├── przepisController.js
│   └── userController.js
│
├── middleware/                # Middleware
│   ├── auth.js                # Autoryzacja
│   └── upload.js              # Upload zdjęć (multer)
│
├── models/                    # Modele MongoDB (Mongoose)
│   ├── Przepis.js
│   └── User.js
│
├── public/                    # Pliki statyczne
├── routes/                    # Routing
│   ├── przepisy.js
│   └── users.js
│
├── views/                     # Widoki EJS
│   ├── layouts/
│   ├── partials/
│   ├── przepisy/
│   └── users/
│
├── screenshots/               # Zrzuty ekranu do README
├── .env                       # Zmienne środowiskowe
├── Dockerfile                 # Obraz aplikacji Node.js
├── docker-compose.yml         # Uruchomienie app + MongoDB
├── app.js                     # Główny plik Express
└── package.json
````

---

# 🐳 Uruchomienie projektu przez Docker Compose (zalecane)

## ✅ Wymagania

* Docker
* Docker Compose
* Docker Desktop (Windows/macOS)

Sprawdzenie instalacji:

```bash
docker --version
docker compose version
```

---

## 1) Klonowanie repozytorium

```bash
git clone https://github.com/hwanlix/menu_docker.git
cd menu_docker
```

---

## 2) Konfiguracja `.env`

W katalogu głównym projektu utwórz plik `.env`:

```env
PORT=3000
SECRET_KEY=supersecretkey123
MONGODB_URI=mongodb://mongo:27017/koktajle
NODE_ENV=production
```

> Ważne: w środowisku Docker host bazy danych to **mongo** (nazwa serwisu w docker-compose), a nie `localhost`.

---

## 3) Uruchomienie środowiska

Uruchom aplikację wraz z bazą danych:

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

Logi kontenerów:

```bash
docker compose logs -f
```

Zatrzymanie kontenerów:

```bash
docker compose down
```

Reset bazy danych (usunie dane MongoDB):

```bash
docker compose down -v
```

---

# 💻 Uruchomienie lokalne (opcjonalnie, bez Dockera)

## ✅ Wymagania

* Node.js v14+ (zalecane v18)
* npm
* MongoDB lokalnie lub MongoDB Atlas

## Instalacja zależności

```bash
npm install
npm.cmd i
```

## Uruchomienie

Tryb deweloperski:

```bash
npm run dev
```

Tryb produkcyjny:

```bash
npm start
```

Aplikacja:

```text
http://localhost:3000
```

> Przy uruchomieniu lokalnym zmienna `MONGODB_URI` powinna wskazywać na `localhost`, np.:
> `mongodb://localhost:27017/koktajle`

---

## 🧪 Przykładowe dane testowe

### 👤 Rejestracja

* Nazwa użytkownika: `test`
* Email: `test@test.test`
* Hasło: `testtest` (min. 6 znaków)

### 🔑 Logowanie

* Email: `test@test.test`
* Hasło: `testtest`

### 🍸 Dodawanie przepisu

* Nazwa przepisu
* Czas przygotowania (5–60 min)
* Składniki: nazwa + ilość + jednostka (możliwość dodania wielu)
* Instrukcja przygotowania
* Zdjęcie
* Tagi

### ⭐ Komentarze i oceny

* Komentarz (opcjonalnie)
* Ocena 1–5

### ❤️ Ulubione

* Przycisk „Dodaj do ulubionych”

```

---



