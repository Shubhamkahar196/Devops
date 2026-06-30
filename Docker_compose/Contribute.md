## Manual Installation
- install nodejs locally()
- clone the repo
- install dependencies npm install
- start the db lodally
   - docker run -e POSTGRES_PASSWORD=mysecretpasswird -d -p 5432:5432 postgres
   - go to neon.tech and get yourself new db
   -change the .env and update your db credentials
   -npx prisma migrate
   -npx prisma generate
   - npm run build


## docker installation
- install docker
-start a new network `docker network create user-project `
- start postgres (docker run --network user-project -e POSTGRES_PASSWORD=mysecretpasswird -d -p 5432:5432 postgres)
-Build the image - 'docker build --network=host -t user_project .'
- start the image -' docker run -e DATABASE_URL=postgresql://postgres:mysecretpasswird@localhost:5432/postgres --network user_project -p 3000:3000 user-project'

## docker compose installation steps
 - install docker,docker compose
 - Run 'docker-compose up'