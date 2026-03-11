# Personal Site

A personal web page built with Rails 8.1 and Ruby 4.0. Includes journal entries and a home page. Built as a Claude experiment/testing ground.

## Stack

- **Ruby** 4.0.1
- **Rails** 8.1.2
- **Database** SQLite3
- **Asset pipeline** Propshaft + Importmap
- **Frontend** Hotwire (Turbo + Stimulus)
- **Web server** Puma + Thruster
- **Deployment** Docker / Kamal

## Local Development

### Prerequisites

- [asdf](https://asdf-vm.com/) with the `ruby` plugin
- Bundler

### Setup

```bash
# Install Ruby
asdf install

# Install dependencies
bundle install

# Set up the database
bin/rails db:prepare

# Start the server
bin/dev
```

The app will be available at `http://localhost:3000`.

## Docker

### Build

```bash
docker build -t personal .
```

### Run

```bash
docker run -d -p 80:80 \
  -e RAILS_MASTER_KEY=$(cat config/master.key) \
  --name personal \
  personal
```

The app will be available at `http://localhost`.

The entrypoint automatically runs `db:prepare` on startup, creating or migrating the database as needed.

## Deployment with Kamal

[Kamal](https://kamal-deploy.org) is included for zero-downtime container deployments.

```bash
# First deploy
kamal setup

# Subsequent deploys
kamal deploy
```

Configure your target host and registry in `config/deploy.yml` before deploying. Set secrets in `.kamal/secrets`.

## Routes

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | Home page |
| GET | `/journal_entries` | List all journal entries |
| GET | `/journal_entries/:id` | View a journal entry |
| GET | `/journal_entries/new` | New entry form |
| POST | `/journal_entries` | Create a journal entry |
| GET | `/journal_entries/:id/edit` | Edit entry form |
| PATCH/PUT | `/journal_entries/:id` | Update a journal entry |
| DELETE | `/journal_entries/:id` | Delete a journal entry |

## Database

SQLite is used for simplicity. The database file lives at `storage/development.sqlite3` (development) and `storage/production.sqlite3` (production).

To reset the database:

```bash
bin/rails db:reset
```
