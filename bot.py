import os
import discord
from discord.ext import commands

# Enable necessary intents
intents = discord.Intents.all()

bot = commands.Bot(command_prefix='!', intents=intents)
@bot.event
async def on_ready():
    await bot.change_presence(status=discord.Status.idle, activity=discord.Activity(type=discord.ActivityType.watching, name="out `.lua` files"))

@bot.event
async def on_message(message):
    if message.content.startswith('!obf'):
        if len(message.attachments) > 0:
            attachment = message.attachments[0]
            if attachment.filename.endswith('.lua'):
                await attachment.save(attachment.filename)
                os.rename(attachment.filename, 'input.lua')
                os.system('lua main.lua')
                response = discord.File('output.lua')
                await message.channel.send('Here is the obfuscated file:', file=response)
                os.remove('input.lua')

bot.run('MTA2MTA5MTA1NDgzMDQ5Nzg1NQ.Gg1jaL.sahw6eJIn4izd34DLjwQZtfmechyQr-jcSqd_8')
