# Testing source of XXE vulnerability

The vulnerability appears to be in the pre-build binary for 2.9.4.
We did not observe it when built from source. We can check different
versions from here for the vulnerability:

https://download.gnome.org/sources/libxml2/

## Build

```sh
docker buildx build -f Dockerfile-${VERSION} -t xxe-test:${VERSION} .
```

## Test

```sh
docker run xxe-test:${VERSION}
```

Where `${VERSION}` is one of `[2.9.4, 2.13.5]`.
