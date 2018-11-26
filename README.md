debian repository demo
======================

A very simple demonstration of how you can run a simple debian repo using 
docker. **Absolutely not for production**.


install / run
-------------

```bash
docker-compose up
```

This will run two containers - one, the repo, containing some debian packages.
This repo should be visible at 
[http://localhost:8080/debs/](http://localhost:8080/debs/).

The other container is the demo - this container has the sole purpose of being 
used to connect to the repo and perform `apt` commands against it:

```bash
docker exec -ti aptlocal_repo bash
```

example debs
------------

This repo includes two binaries for the sake of demonstration:

```
.
└── dists
    └── xenial
        ├── custom
        │   └── binary-amd64
        │       ├── Packages.gz
        │       └── jq_1.5+dfsg-1ubuntu0.1_amd64.deb
        └── main
            └── binary-amd64
                ├── Packages.gz
                └── nginx_1.10.3-0ubuntu0.16.04.3_all.deb
```
