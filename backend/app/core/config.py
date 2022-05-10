from pydantic import BaseSettings

class Settings(BaseSettings):
    SQLALCHEMY_DATABASE_URI = "postgresql://postgres:postgres@localhost/postgres"
    FIRST_SUPERUSER = "user"
    FIRST_SUPERUSER_PASSWORD = "adminpassword"


settings = Settings()