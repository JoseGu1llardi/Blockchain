# Blockchain — Spring Boot

A simple blockchain implementation in Java, built to understand the core concepts of distributed ledgers, proof of work, and immutable transaction logs.

Inspired by [Learn Blockchains by Building One](https://hackernoon.com/learn-blockchains-by-building-one-117428612f46).

---

## What it does

- Maintains an in-memory chain of blocks
- Implements a basic **Proof of Work** algorithm (requires a SHA-256 hash ending in `0000`)
- Exposes a REST API to mine blocks, submit transactions, and inspect the chain
- Rewards the miner with 1 coin per block

---

## Tech Stack

| Technology | Version |
|------------|---------|
| Java | 8 |
| Spring Boot | 2.0.0.M4 |
| Maven | 3+ |
| Lombok | latest (managed by Spring Boot) |
| Guava | 23.0 |
| Swagger 2 | 2.6.1 |

---

## Prerequisites

- JDK 8+
- Maven 3.6+
- (Optional) Docker

---

## Running locally

**Option 1 — Maven (development, no JAR build):**
```bash
./start.sh dev
```

**Option 2 — Full build then run:**
```bash
./start.sh
```

**Option 3 — Skip tests for a faster build:**
```bash
./start.sh skip
```

**Option 4 — Docker:**
```bash
docker build -t blockchain .
docker run -p 8080:8080 blockchain
```

The server starts on `http://localhost:8080`.

---

## API Endpoints

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/mine` | Run proof-of-work and forge a new block |
| `GET` | `/chain` | Return the full blockchain |
| `POST` | `/transactions` | Add a pending transaction |

### POST /transactions — request body

```json
{
  "sender": "alice",
  "recipient": "bob",
  "amount": 10.5
}
```

### Interactive docs (Swagger UI)

```
http://localhost:8080/swagger-ui.html
```

---

## Running tests

```bash
mvn test
```

The integration tests mine blocks, submit transactions, and validate the chain response.

---

## Project Structure

```
src/main/java/com/hashfold/blockchain/
├── app/        # Spring Boot entry point
├── api/        # REST controllers and exception handler
├── config/     # Swagger and Spring configuration
├── domain/     # Block and Transaction models
├── model/      # API response DTOs
├── service/    # Blockchain core logic
└── util/       # Proof of Work generator
```

---

## Roadmap

- [ ] Consensus mechanism (resolve conflicts across nodes)
- [ ] Node registration and peer-to-peer communication
- [ ] Persistent storage (replace in-memory with a database)
- [ ] Update to Spring Boot 3.x
