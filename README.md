# Focalboard Personal Server (multi‑user) on Railway

This repo is a minimal setup to run the official Focalboard Personal Server image on Railway with PostgreSQL and persistence.

## Files

- `Dockerfile` – builds a container based on `mattermost/focalboard:latest` and injects a custom `config.json`.
- `entrypoint.sh` – replaces the `POSTGRES_URL` placeholder in `config.json` with Railway's `DATABASE_URL` and starts the server.
- `config.json` – base configuration for Focalboard, configured to use PostgreSQL.

## How to use with Railway

1. **Create a PostgreSQL database** in Railway:
   - New → Database → PostgreSQL
   - Railway will create a `DATABASE_URL` variable.

2. **Create a new service from this repo**:
   - Push this folder to a GitHub repo.
   - In Railway: New → Deploy from GitHub → select the repo.

3. **Set environment variables**:
   - Add `PORT=8000` (Railway uses this to know the exposed port).
   - Ensure the `DATABASE_URL` from the PostgreSQL service is available in this service (Railway usually links it automatically, or you can copy it).

4. **Add a Volume (optional but recommended)**:
   - In the service → Settings → Volumes → Add volume
   - Mount path: `/opt/focalboard/files`
   - This keeps uploads persistent.

5. **Deploy**:
   - Railway will build the Docker image and start the service.
   - Open the generated URL; you'll see the Focalboard login/registration page.

6. **First user = admin**:
   - The very first account you register becomes the admin for this Focalboard instance.
   - After that, you invite other users from the menu (Focalboard icon → Invite users).

> Note: Focalboard’s "user management" is fairly minimal compared to tools like ClickUp or Jira.  
> You can invite users and collaborate, but deep user/role administration is handled mostly through APIs (see the official Admin Guide), not a big visual admin panel.

