# configure-local-ssh
Image used for local ssh configuration for cases where private repos are downloaded

## Build ARGs

The following Docker build arguments are supported

| Argument        | Default                                                                   | Description                                          |
| --------------- | ------------------------------------------------------------------------- | ---------------------------------------------------- |
| ARTIFACTORY_URL |                                                                           | Artifactory URL used by the `configure-maven` script |

## Building the image

```sh
docker build -t configure-local-ssh -f ./Dockerfile .
```

## Running the image

This image is designed to be used in conjunction with tilt builds.
To do this import the image into your application dockerfile and pass in your ssh key as a build argument.
