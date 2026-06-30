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
- install postgres (docker run -e POSTGRES_PASSWORD=mysecretpasswird -d -p 5432:5432 postgres)
-Build the image - 'docker build -t usre-project .'
- start the image - 'docker run -p 3000:3000 user-project'

## docker compose installation steps
 - install docker,docker compose
 - Run 'docker-compose up'