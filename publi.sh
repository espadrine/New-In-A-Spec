#!/bin/bash --norc

# Which specs do we want to publish?
specs=". dom4 es5 es6 es7 xhr2 html5"

# Thanks! I'll do that.

git checkout gh-pages || exit
git merge master || exit

for spec in $specs
do
  if [[ -e "$spec/Readme.md" ]]; then
    cat header.html > "$spec/index.html"
    cat "$spec/Readme.md" | commonmark \
      | sed "s,https://github.com/espadrine/New-In-A-Spec/tree/master,.," \
      >> "$spec/index.html"
  fi
done
git add "$spec/index.html"

git commit -am"I luv publishing stuff on github ❤ !"
git push origin gh-pages

git checkout master

