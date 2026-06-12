#!/bin/bash

# Login using gh
if ! gh auth status > /dev/null 2>&1; then
  echo -e "Please login to GitHub CLI (gh) to continue.\n"
  gh auth login
  exit 1
else
  echo -e "Logged in to GitHub CLI (gh).\n"
fi

# Clone the frontend repository to frontend/
if [[ ! -d "frontend" ]]; then
  echo -e "Cloning frontend repository...\n"
  git clone https://github.com/acm-qu/rate-my-instructor-frontend frontend
else
  echo -e "Frontend repository already exists. Pulling latest changes...\n"
  $(cd frontend && git pull)
fi

# Clone the backend repository to backend/
if [[ ! -d "backend" ]]; then
  echo -e "Cloning backend repository...\n"
  git clone https://github.com/acm-qu/rate-my-instructor-backend backend
else
  echo -e "Backend repository already exists. Pulling latest changes...\n"
  $(cd backend && git pull)
fi

# Check for env folder
if [[ ! -d "env" ]]; then
  echo -e "Request environment variables from Abdelhakim for the application to work.\n"
else
  echo -e "Env folder checked\n"
fi

echo -e "\nSetup complete. You can now run 'docker compose up' to start the application.\n"
