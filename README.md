# PaperMC but in Docker

### How to run:

1. Create the directory for all the server files
```bash
mkdir ./server
```

2. Run the container
```bash
sudo docker run -it \
		--name papermc \
		-v $PWD/server:/opt \
		-p 25565:25565 \
		-e eula=true \
		-e RAM=4G \
		thatrandomguy/papermc
```

- **ProTip:** Of course you can change the RAM amount to anything else (2G, 512M, etc), and the port to whatever you want

- **Another ProTip:**  Replace `-it` with `-d` to make the server run in the background and attach to the console with `docker exec -it papermc console`

3. Now you can configure Paper as you would normally, everything is stored under the `server` directory we created in the first step

----------------

### Usage:

- Starting the server
```bash
docker exec -it papermc start
```

- Stopping the server
```bash
docker exec -it papermc stop
```

- Restarting the server
```bash
docker exec -it papermc reload
```

- Attaching to the console
```bash
docker exec -it papermc console
```

**ProTip:** To detach from the console press Ctrl+A and then Ctrl+D

- Executing individual commands on the server
```bash
docker exec -it papermc execute kill @e[type=!player]
```

- Checking the server's version
```bash
docker exec -it papermc version
```