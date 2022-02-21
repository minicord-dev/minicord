# Minicord

A local API and gateway emulator for Discord

---

Minicord is a project built to help you test bots in a live environment before pushing them to production deployment. This is ideal for cases such as running your bot in CI checks, or for testing features in a local environment against an API which doesn't care if it's abused.

## Note

**Minicord is a work in progress and is not yet ready to be used. It likely won't be ready for quite a long time, as a lot has to be developed and many technical challenges worked out.**

In addition, only API v10 and later will be implemented. Previous API versions will not be supported.

## Todo

- Add API routes
- Add gateway
- Add admin dashboard (likely a separate project using Svelte)
- Add unit testing

What I generally want testing to look like with Minicord:

## Ideas

Here's my initial idea of how one might use Minicord to test a bot:

```py
from minicord import Environment, objects, test

@test(
    name="Test ping command",
    description="Test the ping command",
    timeout=5,
)
async def test_ping(env: Environment) -> None:
    channel = env.guilds[1234].channels[5678]
    await channel.send(
        "!ping",
        author=objects.GeneratedUser()
    )

    await channel.expect_message(
        author=env.bot.user,
        match=r"^Pong! \d+\.\d+ms$",
    )
```
