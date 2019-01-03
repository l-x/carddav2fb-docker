# carddav2fb-docker

Docker image for [andig/carddav2fb].

## Build the docker image

```sh
$ git clone https://github.com/l-x/carddav2fb-docker.git
$ cd carddav2fb-docker
```

Create a file called `config.php` (see [config.example.php] for documentation).

```sh
$ docker build --tag carddav2fb:latest .
```

## Use the docker image

```sh
$ docker run -ti --rm carddav2fb list
$ docker run -ti --rm carddav2fb run -i
```

[andig/carddav2fb]: https://github.com/andig/carddav2fb
[config.example.php]: https://github.com/andig/carddav2fb/blob/master/config.example.php