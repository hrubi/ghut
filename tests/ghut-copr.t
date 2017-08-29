::
  $ source $TESTROOT/setup
  $ source $TESTROOT/setup-git


fetch non-existing pull request::

  $ $BUILDDIR/ghut-copr https://github.com/foofork/barrepo/pull/1234
  fatal: Couldn't find remote ref refs/pull/1234/head
  fatal: The remote end hung up unexpectedly
  [128]


fetch pull request::

  $ printf "foo\n" > $repo_dir/file.txt
  $ repo_git --work-tree="$repo_dir" add file.txt
  $ repo_git commit -q -mfirst
  $ repo_git update-ref refs/pull/1234/head \
  >   $(repo_git rev-parse -- HEAD)

  $ $BUILDDIR/ghut-copr https://github.com/foofork/barrepo/pull/1234
  checking out: refs/pull/foofork/1234/1


fetch the pull request for the second time::

  $ $BUILDDIR/ghut-copr https://github.com/foofork/barrepo/pull/1234
  no new revision for https://github.com/foofork/barrepo/pull/1234
  checking out: refs/pull/foofork/1234/1


fetch new version of the pull request::

  $ printf "boo\n" > $repo_dir/file.txt
  $ repo_git --work-tree="$repo_dir" add file.txt
  $ repo_git commit -q -msecond
  $ repo_git update-ref refs/pull/1234/head \
  >   $(repo_git rev-parse -- HEAD)

  $ $BUILDDIR/ghut-copr https://github.com/foofork/barrepo/pull/1234
  checking out: refs/pull/foofork/1234/2


diff the pull versions::

  $ git diff refs/pull/foofork/1234/1
  diff --git a/file.txt b/file.txt
  index 257cc56..5819a18 100644
  --- a/file.txt
  +++ b/file.txt
  @@ -1 +1 @@
  -foo
  +boo
