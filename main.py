import discord
from discord.ext import commands
from flask import Flask, jsonify
import threading
import os

app = Flask(__name__)
storage = {"msg": ""}

@app.route('/get_message', methods=['GET'])
def get_message():
    return jsonify({"content": storage["msg"]})

@app.route('/')
def health():
    return "Online"

def run_flask():
    app.run(host='0.0.0.0', port=int(os.environ.get("PORT", 10000)))

intents = discord.Intents.default()
intents.message_content = True
bot = commands.Bot(command_prefix="!", intents=intents)

TOKEN = 'PASTE_YOUR_NEW_RESET_TOKEN_HERE'
CHAN_ID = 1479671475643617280

@bot.event
async def on_message(message):
    if message.author == bot.user or message.channel.id != CHAN_ID:
        return
    storage["msg"] = message.content
    await message.channel.send(message.content)

if __name__ == "__main__":
    threading.Thread(target=run_flask, daemon=True).start()
    bot.run(TOKEN)
