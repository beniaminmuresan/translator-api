**Task README**

The purpose of this task is to test understanding of OO and TDD.

You can find the task requirements [here](README.pdf)


**How to set up locally?**
```
git clone git@github.com:beniaminmuresan/translator-api.git && cd translator-api
docker-compose run --rm api rails db:setup
docker-compose up
```
Once you have it up an running, check out the docs:

http://localhost:3000/api-docs/index.html

**Run specs**
```
docker-compose run --rm api rspec
```

**Run linter**
```
docker-compose run --rm api rubocop
```
