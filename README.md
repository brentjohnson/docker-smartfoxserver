# What is SmartFoxServer

This is an unofficial docker image of [SmartFoxServer 2X](https://www.smartfoxserver.com/).

SmartFoxServer is a comprehensive SDK for rapidly developing multiplayer games and applications with Adobe Flash/Flex/Air, Unity, HTML5, iOS, Universal Windows Platform, Android, Java, C++ and more.
SmartFoxServer comes with a rich set of features, an impressive documentation set, tens of examples with their source, powerful administration tools and a very active support forum.

Born in 2004, and evolving continuously since then, today SmartFoxServer is the leading middleware to create large scale multiplayer games, MMOs and virtual communities.
Thanks to its simplicity of use, versatility and performance, it currently powers hundreds of projects all over the world, from small chats and turn-based games to massive virtual worlds and realtime games.

# TL;DR

```console
$ docker run --name sfs -p 8080:8080 -p 9933:9933 bijohns/smartfoxserver:latest
```

## Using Docker Compose

This is an example of using docker compose to run the HTLM5 version of the [Tris example](http://docs2x.smartfoxserver.com/ExamplesJS/tris) game locally.  The application can be accessed via http://localhost:8000. Please note that it will not work remotely as the example code expects the server to be running on 127.0.0.1.

```yaml
version: "3.8"
services:
  sfs:
    image: "bijohns/smartfoxserver:latest"
    volumes:
      - ./deploy/extensions/Tris-JS:/opt/SmartFoxServer_2X/SFS2X/extensions/Tris-JS
    ports:
      - "8080:8080"
      - "9933:9933"
  nginx:
    image: "nginx"
    ports:
      - 8000:80
    volumes:
      - ./deploy/client:/usr/share/nginx/html
```
