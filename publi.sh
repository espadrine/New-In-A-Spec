#!/bin/bash --norc

# Which specs do we want to publish?
specs=". dom4 es6 es5 xhr2"

# Thanks! I'll do that.

git checkout gh-pages || exit
git merge master || exit

for spec in $specs
do
  cat "$spec/Readme.md" | Markdown.pl > "$spec/index.html"
  git add "$spec/index.html"
done

git commit -am"I luv to publish stuff to github ❤ !"
git push origin gh-pages

git checkout master

