#!/bin/bash --norc

# Which specs do we want to publish?
specs=". dom4 es6 es5 xhr2 html5"

# Thanks! I'll do that.

git checkout gh-pages || exit
git merge master || exit

for spec in $specs
do
  if [[ -e "$spec/Readme.md" ]]; then
    cat header.html > "$spec/index.html"
    cat "$spec/Readme.md" | Markdown.pl >> "$spec/index.html"
  fi
  git add "$spec/index.html"
done

git commit -am"I luv publishing stuff on github ❤ !"
git push origin gh-pages

git checkout master

