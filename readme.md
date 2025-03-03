# gitauth – Simple & Dynamic Authentication
This is a __very simple__ Git credential helper that dynamically selects the correct authentication credentials based on:
- The remote URL you're pushing to
- Your configured Git user.email and user.name

# How It Works
1. Git calls this script when authentication is needed.
2. The script checks:
  - The __remote URL__ you're pushing to.
  - Your configured __user.email__ (highest priority).
  - Your configured __user.name__ (fallback if no email match is found).
3. It searches `~/.git-credentials` for the correct credentials.
4. If a match is found, it provides the correct username and token for authentication.

This means: ✅ __No need to manually switch credentials
✅ Works automatically based on your repo’s Git config or global config
✅ No per-repo configuration required__

# Installation

### Manual
1. Clone this repo and move the script into your `$PATH`:
```bash
git clone https://github.com/kr-nn/gitauth
cd gitauth
chmod +x gitauth
mv gitauth ~/.local/bin/  # Or /usr/local/bin/
```
2. Set it as your Git credential helper:
```bash
git config --global credential.helper "!gitauth"
```
3. Make sure your `~/.git-credentials` file contains your stored credentials:

```
https://user1:ghp_token1@github.com
https://user2:ghp_token2@github.com
https://user1@email.com:ghp_emailtoken1@github.com
https://user2@email.com:ghp_emailtoken2@github.com
```

> !NOTE: do not use %40 in place of @, the script does this for you

4. Set your `user.email` or `user.name` in each repo or globally:

```bash
git config user.email "user1@email.com"
git config user.name "user1"
```
or
```bash
git config --global user.email "user1@email.com"
git config --global user.name "user1"
```
Just push as usual:

```bash
git push # or git push origin
```

The script will automatically select the right token based on your user.email or user.name!

Why Use This?
🔹 __Simple__: No complex setup, just drop it in and it works.
🔹 __Automatic__: Picks the right credentials for each repo.
🔹 __Portable__: Works anywhere, no per-repo config needed.
