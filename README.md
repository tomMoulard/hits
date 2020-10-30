# Hits!

A docker image for [hits](https://github.com/dwyl/hits).

## Usage
```bash
docker pull tommoulard/hits
```

### docker-compose
```yml
version: '3.6'

networks:
  srv:

services:
  hits:
    image: tommoulard/hits
    restart: always
    networks:
      - 'srv'
    depends_on:
      - 'postgresql'
    ports:
      - '4000:4000'
  postgresql:
    image: postgres
    restart: always
    user: 1000:1000
    networks:
      - 'srv'
    environment:
      - 'POSTGRES_USER=postgres'
      - 'POSTGRES_PASSWORD=postgres'
    volumes:
      - './postgresql/:/var/lib/postgresql/data'
```
