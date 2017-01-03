# docker-spigot

Docker Image packaging for Minecraft (SpigotMC), images based on Ubuntu. This image uses the official Spigot BuildTools to produce the server jar file. This is then copied to the server directory if a `mcserver.jar` file does not exist. This jar will then be used to launch the server. This image is available on the [Docker Hub][1].

Usage
-----

The following environment variables are available to allow you to configure how the container will run, and various options within it:

* **SPIGOT_HEAP_INIT**: Allows you to configure the initial JVM heap size. (Default: 2G)
* **SPIGOT_HEAP_MAX**: Allows you to configure the maximum JVM heap size. (Default: 2G)

For building, you can also use the following by altering the `Dockerfile`:

* **JENKINS**: Allows you to configure the Jenkins URL. This is mainly to keep the line length lower though. (Default: https://hub.spigotmc.org/jenkins)
* **SPIGOT_VERSION**: Allows you to build different Spigot versions. (Default: 1.10)

License
-------

MIT

Contributing
------------

Feel free to open a [pull request][2], or file an [issue][3] on Github. I always welcome contributions as long as they're for the benefit of all (potential) users of this image.

If you're unsure about anything, feel free to ask about it in an issue before you get your heart set on fixing it yourself.

[1]: https://hub.docker.com/r/seeruk/spigot/
[2]: https://github.com/SeerUK/docker-spigot/pulls
[3]: https://github.com/SeerUK/docker-spigot/issues
