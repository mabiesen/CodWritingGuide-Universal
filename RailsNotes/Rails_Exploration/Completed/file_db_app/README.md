# README

Successfully created database and stored file information

Tutorial used is located at the following site:

http://ryan.endacott.me/2014/06/10/rails-file-upload.html

Directions are complex and involve updating multiple files.

At times, the tutorial shows a short snippet of what is to be accomplished. At these times, opted to leave notes in the files of how I reconciled the gaps in the tutorial.

BUG:  Immediately after file submission, attention is redirected to the submitted document.  This is not ideal.
FIXED:  in the create function of the documents controller in the format.html, changed redirect to root_url
