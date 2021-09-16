# PaperMC but in Docker

### How to run:

1. Create the directory for all the server files
```bash
mkdir ./server && chmod 777 ./server
```

2. Run the container
```bash
sudo docker run -it \
		--name papermc \
		-v $PWD/server:/server \
		-p 25565:25565 \
		-e RAM=4G \
		-e eula=true \
		-e VERSION=1.16.5 \
		-e BUILD=762 \
		thatrandomguy/papermc
```

**NOTE:** By using the command above you are automatically agreeing to the EULA, which can be found [here](https://account.mojang.com/documents/minecraft_eula)

- **ProTip:** Change the environment variables to fit your needs, for example to update the server just change VERSION and BUILD (https://papermc.io/downloads)

- **Another ProTip:**  Replace `-it` with `-d` to make the server run in the background and attach to the console with `docker attach papermc`

3. Now you can configure Paper as you would normally, everything is stored under the `server` directory we created in the first step

---

### Usage

- Stopping the server
```bash
docker stop papermc
```
**Note:** That stopping the server like this, won't show any output and might take a few seconds

- (Re-)Attaching to the console
```bash
docker attach papermc
```

**ProTip:** To detach from the console press Ctrl+P then Ctrl+Q (docker's escape sequence)

- Checking the server's version
```bash
docker exec -it papermc version
```

---

### Updating

0. Take a backup of the current world (optional)

1. Stop the server

2. Remove the container (this won't remove existing configuration nor world files)
```bash
docker rm papermc
```

3. Start the container again, but this time specify the VERSION and BUILD numbers you want to use in the command