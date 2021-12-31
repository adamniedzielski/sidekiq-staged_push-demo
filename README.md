# Example app for `sidekiq-staged_push`

This is an application that demonstrates how to use
[`sidekiq-staged_push`](https://github.com/adamniedzielski/sidekiq-staged_push)
and what kind of problem the gem is trying to solve.

## Setup

You need Docker with Docker Compose.

```
make build
make bundle
make dbsetup
```

## Running

In two separate terminal tabs:

```
make server
make sidekiq
```

Go to http://localhost:3000 and try different options.
