::

  $ . $TESTROOT/setup


help::

  $ $BUILDDIR/ghut-copr -h
  Fetch a pull request head and store it in refs/pull/<fork>/<pr_num>/<revision>.
  
  <revision> is sequentially numbered local history of the PR starting from 1 and
  incrementing with each additional fetch which introduces new commits.
  
  usage: ghut-copr <pr_url>    - fetch and checkout pull request ref
         ghut-copr ls          - list locally stored pull requests and their revisions
         ghut-copr ls <pr_num> - list revisions for a single locally stored pull request


no params::

  $ $BUILDDIR/ghut-copr
  Fetch a pull request head and store it in refs/pull/<fork>/<pr_num>/<revision>.
  
  <revision> is sequentially numbered local history of the PR starting from 1 and
  incrementing with each additional fetch which introduces new commits.
  
  usage: ghut-copr <pr_url>    - fetch and checkout pull request ref
         ghut-copr ls          - list locally stored pull requests and their revisions
         ghut-copr ls <pr_num> - list revisions for a single locally stored pull request
  [1]
