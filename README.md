debian repository demo
======================

A very simple demonstration of how you can run a simple debian repo using 
docker. **Absolutely not for production**.

requirements
------------

```
 - docker>=18.09.0, build 4d60db4
 - docker-compose>=1.23.1, build b02f1306
 - GNU Make>=3.81 (optional)
 - port :8080 to be free
```

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

convenience
-----------

```bash
"make help" - list commands
"make run" - docker-compose up
"make ssh_repo" - exec bash in the repo container
"make ssh_demo" - exec bash in the demo container
```

tests
-----

deliberately none. the objective of this repo was to demonstrate to a 
particular individual the very basics of apt repos.

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

why is this "not for production"?
---------------------------------

 - `/etc/apt/sources.list` is replaced in its entirety
 - No authentication
 - No Release files
 - No tests
 - I wrote it in ~20 minutes to show someone the basics

