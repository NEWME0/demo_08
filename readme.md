
## Startup with docker

1. `docker build -t demo_08 .` - build image
2. `docker run --rm -d -p 8080:80 --name demo_08_container -i demo_08` - run container
3. View in browser http://localhost:8080/docs
