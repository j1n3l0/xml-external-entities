# Testing source of XXE vulnerability

The vulnerability appears to be in the pre-build binary for 2.9.4. We did not observe it when built from source. We can check different versions from [here](https://download.gnome.org/sources/libxml2/) for the vulnerability.

See the description of the vulnerability in the document [CVE-2016-9318](https://www.cve.org/CVERecord?id=CVE-2016-9318)

## Build

```sh
docker buildx build -f Dockerfile-${VERSION} -t xxe-test:${VERSION} .
```

## Test

```sh
docker run xxe-test:${VERSION}
```

Where `${VERSION}` is one of `[2.9.4, 2.13.5]`.
