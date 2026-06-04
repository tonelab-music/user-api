# user-api

User accounts, preferences, wishlists, and notification settings for Tonelab Music.

## Stack

- **Runtime**: Node.js 20 (TypeScript)
- **Framework**: Fastify
- **Auth**: Clerk (JWT verification)
- **Database**: PostgreSQL
- **Cache**: Redis (session, preferences hot-path)
- **CI/CD**: GitHub Actions → AWS Lambda

## API

| Method | Path | Description |
|---|---|---|
| `GET` | `/v1/users/me` | Current user profile |
| `PATCH` | `/v1/users/me` | Update profile (name, avatar, address) |
| `GET` | `/v1/users/me/preferences` | Notification + marketing preferences |
| `PUT` | `/v1/users/me/preferences` | Update preferences |
| `GET` | `/v1/users/me/wishlist` | Get wishlist items |
| `POST` | `/v1/users/me/wishlist` | Add item to wishlist |
| `DELETE` | `/v1/users/me/wishlist/:sku` | Remove item from wishlist |
| `GET` | `/v1/users/me/orders` | Order history |
| `GET` | `/v1/users/me/subscriptions` | Active Tone Box subscriptions |

## Local development

```bash
npm install
cp .env.example .env
npm run dev        # starts on :3003
```

## Environment variables

| Variable | Description |
|---|---|
| `DATABASE_URL` | Postgres connection string |
| `REDIS_URL` | Redis connection string |
| `CLERK_SECRET_KEY` | Clerk secret for JWT verification |
| `ORDER_SERVICE_URL` | URL for order history lookups |

## Project structure

```
src/
  routes/         # Fastify route definitions
  services/       # Business logic (profile, wishlist, preferences)
  models/         # TypeScript types + Postgres schemas
  middleware/     # Clerk JWT verification, rate limiting
  types/          # Shared types
tests/
  unit/           # Service tests
  integration/    # API endpoint tests with real DB
```
