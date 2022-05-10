# WorkoutWizard
C:\Users\psten\AppData\Roaming\gcloud\application_default_credentials.json
Ddbbrn6@

# Start Docker
docker-compose -f pg_db.yml up

# Activate Virtual Env
.\env\Scripts\activate

# Start backend
uvicorn main:app --host 127.0.0.1 --port 8080

# migration
alembic upgrade head

# Start frontend
npm start

# Local docs URL
http://127.0.0.1:8080/docs#/default