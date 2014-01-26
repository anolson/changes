## Changes

Small bit-sized code reviews.

<3 GitHub pull requests for code reviews, but sometimes you just want to share a small change.  This is usually done by pasting a screenshot or a diff into Campfire.  Instead, use Changes to share your changes.

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



