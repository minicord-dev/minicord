from fastapi import FastAPI

from src.impl.database import database

app = FastAPI()


@app.on_event("startup")
async def startup() -> None:
    await database.connect()
