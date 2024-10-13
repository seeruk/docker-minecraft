# docker-minecraft

Docker Image packaging for Minecraft. This image uses the official slim Java Buster image as a base and sets up an entrypoint and volumes for running a Minecraft server. It also automatically agrees to the EULA. If you mount a folder to `/opt/mcserver` that contains an `mcserver.jar` then it'll be run by default with some sensible JVM arguments. This image is available on the [Docker Hub][1].

Usage
-----

Make sure to set a memory limit on your container, and this image will obey this memory limit for 
overall memory usage. By default, we set a 50/50 split for heap size and everything else.

* `JVM_INIT_RAM_PERCENT`: Initial memory allocated for the heap at startup (default: 75)
* `JVM_MAX_RAM_PERCENT`: Maximum memory allocated for the heap (default: 75)

License
-------

MIT

Contributing
------------

Feel free to open a [pull request][2], or file an [issue][3] on Github. I always welcome contributions as long as they're for the benefit of all (potential) users of this image.

If you're unsure about anything, feel free to ask about it in an issue before you get your heart set on fixing it yourself.

[1]: https://hub.docker.com/r/seeruk/minecraft/
[2]: https://github.com/SeerUK/docker-minecraft/pulls
[3]: https://github.com/SeerUK/docker-minecraft/issues
