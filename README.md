## MiniPR

Small bit-sized code reviews.

<3 <3 <3 GitHub pull requests for code reviews, but sometimes you just want to share a small change.  This is usually done by pasting a screenshot or a diff into Campfire.  Instead share your changes with MiniPR.

### Getting the started

```sh
$ git clone git://github.com/anolson/mini_pr_.git
$ cd mini_pr
$ bundle
$ rake db:setup
```

### Run the server

```sh
$ rails s
```

###

```sh
$ rake spec
```

### Usage

Make a change.

```sh
$ git diff | curl -X POST \
  --data-urlencode pull_request[raw_diff]@- \
  http://localhost:3000/pull_requests
```



