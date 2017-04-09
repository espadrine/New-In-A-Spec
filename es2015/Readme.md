ECMAScript 2015
===============


- `let`, `const` (define block-local vars), `function` in block scope

- Destructuring: `let {x, y} = pt;  let [s, v, o] = triple();`
  (assuming `let pt = {x:2, y:-5}`, for instance).

- Parameter default values: `function f(x, y=1, z=0) {⋯}`

- Rest: `function g(i, j, ...r)  { return r.slice(i, j); }`
  (instead of using `arguments` like a madman).

- Spread: `let a = [0,1,2,3],  o = new Something(...a);`. Also works in array
  literals: `[1, ...array, 4]`.

- Shorthand object literals:
  `let one = 1; { one, func_one() {return 1;}, ['key ' + one]: 1 }`.

- Fat arrow: `(a) => a * a` is the same as
  `(function(a) { return a * a; }).bind(this)`

- Map, Set: `let m = new Map(); m.set(key, value); m.has(key); m.get(key)`.
  Also has `.clear()`, `.delete()`, `.forEach()`, `.keys()`.

- Weak map: `let map = new WeakMap()`.
  Use it if you have circular references in it.
  You also have `new WeakSet()`.

- Promise: `new Promise((resolve, reject) => {…})`.
  * `resolve(valueOrPromise)` returns the promised value (or a new promise, to
    chain them) in `promise.then(value => {…})`.
  * `reject(new Error(…))` breaks the promise in
    `promise.then(…).then(…).catch(error => {…})`.
  * Quick promise creation: `Promise.resolve(value)`, `Promise.reject(error)`.
  * Iterables: `Promise.all(listOfPromises).then(listOfValues => …)`,
    `Promise.race(listOfPromises).then(valueThatResolvedFirst => …)`

- Proxies: `let obj = new Proxy(proto, handler)`.
  Long story short: ~ operator overloading with object-like elements.
  (Can also catch all property accesses on an object.)

- Generators: `function* gen()  { yield 1; yield 2; }`
  Actually, `gen()` returns ~ an object with a `next()` function property.

- Iterators: `for (var [key, val] of items(x))  { alert(key + ',' + val); }`.
  Iterators can be generators or proxies.

- Class syntax, with `extends`, `super`, and `static`:
  ```javascript
  class Point extends Base {
    constructor(x,y) {
      super();
      this[px] = x, this[py] = y;
      this.r = function() { return Math.sqrt(x*x + y*y); }
    }
    get x() { return this[px]; }
    get y() { return this[py]; }
    proto_r() { return Math.sqrt(this[px] * this[px] +
        this[py] * this[py]); }
    equals(p) { return this[px] === p[px] &&
        this[py] === p[py]; }
  }
  ```

- Symbols generate unique inaccessible keys, useful in maps and classes (private
  members).
  ```javascript
  let a = Map();
  {
    let k = Symbol();
    a.set(k, 'value');
    // Here, we can get and reset 'value' as a.get(k).
  }
  // Here, a.get(k) is invalid, a.size is 1, but the key cannot be seen.
  ```

- Modules:
  ```javascript
  module math {
    export function sum(x, y) {
      return x + y;
    }
    export var pi = 3.141593;
  }

  import {sum, pi} from math;
  alert(sum(pi,pi));
  ```

- Template strings: multiline, substitution-ready strings with extensibility.
  `` `You are ${age} years old.` ``.
  ```javascript
  let table = 'email', column = 'sender'
  sql`SELECT count(*) FROM ${table}
  WHERE ${table}.${column} LIKE '%\n%';`
  ```
  
  // Implementation:
  function sql(portions, ...inlineParams) {
    portions[0] === 'SELECT count(*) FROM '
    portions[1] === '\nWHERE '
    portions[3] === " LIKE '%\n%';"  // ← An actual newline!
    portions.raw[3] === " LIKE '%\\n%';"  // ← An escaped newline.
    inlineParams[0] === inlineParams[1] === 'email'
    inlineParams[2] === 'sender'
  }
  ```

- [Typed Array][]

[Typed Array]: http://www.khronos.org/registry/typedarray/specs/latest/

- - -

Specification: <http://people.mozilla.org/~jorendorff/es6-draft.html>

Proposals: <http://wiki.ecmascript.org/doku.php?id=harmony:proposals>

Thanks [Brendan Eich](http://brendaneich.com/), Allen Wirfs-Brock, Douglas
Crockford, Mark Miller, Tom Van Cutsem, Alex Russell, and so many others.
