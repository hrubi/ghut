::
  $ source $TESTROOT/setup
  $ source $TESTROOT/setup-git


pull list is initially empty::

  $ $BUILDDIR/ghut-copr ls
  $ $BUILDDIR/ghut-copr ls 1234
  $ $BUILDDIR/ghut-copr ls 5678


add first pull::

  $ repo_git commit -q --allow-empty -mfirst
  $ repo_git update-ref refs/pull/1234/head \
  >   $(repo_git rev-parse -- HEAD)


fetch the first pull::

  $ $BUILDDIR/ghut-copr https://github.com/foofork/barrepo/pull/1234
  checking out: refs/pull/foofork/1234/1


add second version of the first pull::

  $ repo_git commit -q --allow-empty -mfirst-2
  $ repo_git update-ref refs/pull/1234/head \
  >   $(repo_git rev-parse -- HEAD)


fetch the second version of the first pull::

  $ $BUILDDIR/ghut-copr https://github.com/foofork/barrepo/pull/1234
  checking out: refs/pull/foofork/1234/2


add second pull::

  $ repo_git commit -q --allow-empty -msecond
  $ repo_git update-ref refs/pull/5678/head \
  >   $(repo_git rev-parse -- HEAD)

fetch the second pull::

  $ $BUILDDIR/ghut-copr https://github.com/foofork/barrepo/pull/5678
  checking out: refs/pull/foofork/5678/1


list first pull::

  $ $BUILDDIR/ghut-copr ls 1234
  refs/pull/foofork/1234/1
  refs/pull/foofork/1234/2


list second pull::

  $ $BUILDDIR/ghut-copr ls 5678
  refs/pull/foofork/5678/1


list all pulls::

  $ $BUILDDIR/ghut-copr ls
  refs/pull/foofork/1234/1
  refs/pull/foofork/1234/2
  refs/pull/foofork/5678/1
