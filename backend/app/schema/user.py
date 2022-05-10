from typing import Optional
from fastapi import FastAPI
from pydantic import BaseModel

class UserBase(BaseModel):
    first_name: str
    last_name: str
    user_name: str
    email: str

class UserCreate(UserBase):
    password: str

class UserDB(UserBase):
    password: str
    id: int

class User(UserBase):
    id: int

    class Config:
        orm_mode = True
