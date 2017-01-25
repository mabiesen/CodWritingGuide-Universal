#Some Helpful Habits for Coding in Rails

1. Create your own manifests for CSS and Javascript references.  Manifests will assist in order of operation for script calls; auto-generated manifests do not take order of operation into account.  Additionally, manifests help to reduce clutter in HTML.

2. Set all gems equal to the version being used and rebundle.  This will help in error handling through quicker segregation of issues.

3. After bundle update, save a copy of the output and gemfile for reference in new projects.

4. Run on the server after every functional change.  Assists in debugging.  Push to git after successful run.

5. Map out basic partials at the start of a project to reduce duplication of efforts.

6. As will all code, use a workspace to insure good organization.
