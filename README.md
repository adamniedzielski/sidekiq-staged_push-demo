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

Go to http://localhost:3000 and try different options. You can change the value of
`USE_STAGED_PUSH` in `.env.dev` to compare between the default behaviour and the gem behaviour.

If you have access to Sidekiq Enterprise subscription you can flip `USE_SIDEKIQ_ENTERPRISE` to
`true`, set `BUNDLE_ENTERPRISE__CONTRIBSYS__COM` in your shell and run `make bundle`. Now you
can start multiple Sidekiq processes and
[Leader Election](https://github.com/mperham/sidekiq/wiki/Ent-Leader-Election) will take care
that only one process is copying jobs from the database to Redis. See
[gotchas](https://github.com/adamniedzielski/sidekiq-staged_push#gotchas).
