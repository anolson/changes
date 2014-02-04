## Changes

Small bit-sized code reviews.

GitHub pull requests are awesome for code reviews, but sometimes you just want to share a small change. Use Changes instead to share these small changes.

### Getting the started

```sh
$ git clone git://github.com/anolson/changes.git
$ cd changes
$ bundle
$ rake db:setup
```

### Run the server

```sh
$ rails s
```

### Run the tests

```sh
$ rake spec
```

### Usage

Make a change.

```sh
$ git diff | curl -X POST \
  --data-urlencode patch[raw]@- \
  http://localhost:3000/patches
```



