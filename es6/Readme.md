EcmaScript Sixth Edition
========================


- `let`, `const` (define block-local vars), `function` in block scope

- destructuring: `let {x, y} = pt;  let [s, v, o] = triple();`
  (assuming `let pt = {x:2, y:-5}`, for instance).

- parameter default values: `function f(x, y=1, z=0) {⋯}`

- rest: `function g(i, j, ...r)  { return r.slice(i, j); }`
  (instead of using `arguments` like a madman).

- spread: `let a = [0,1,2,3],  o = new Something(...a);`

- proxies: `let obj = Proxy.create(handler, proto)`.
  Long story short: ~ operator overloading with object-like elements.

- weak map: `let map = new WeakMap`.
  Use it if you have circular references in it.

- generators: `function* gen()  { yield 1; yield 2; }`
  Actually, `gen()` returns ~ an object with a `next()` function property.

- iterators: `for (var [key, val] of items(x))  { alert(key + ',' + val); }`.
  Iterators can be generators or proxies.

- array and generator comprehension:
  `[a+b for (a in A) for (b in B)]` (array comprehension),
  `(x for (x of generateValues()) if (x.color === 'blue'))` (generator
  expression).

- binary data: `const Pixel = new StructType({x:uint32, y:uint32, color:Color})`
  (if `Color` is itself a `StructType`), `new ArrayType(Pixel, 3)`.

- class syntax, with `extends`, `prototype`, and `super`:

        class Point {
          constructor(x,y) {
            private x = x;
            private y = y;
            public closed_r() { return Math.sqrt(x*x + y*y); }
          }
          get x() { return @x; }
          get y() { return @y; }
          equals(p) { return @x === p@x && @y === p@y; }
          proto_r() { return Math.sqrt(@x*@x + @y*@y); }
        }

- modules:
    
      module math {
        export function sum(x, y) {
          return x + y;
        }
        export var pi = 3.141593;
      }

      import {sum, pi} from math;
      alert(sum(pi,pi));

- quasis: multiline, substitution-ready strings with extensibility.
  `` `You are ${age} years old.` ``.
  
        // The following regexp spans multiple lines.
        re`line1: (words )*
        line2: \w+`
        
        // It desugars to:
        re({raw:'line1: (words )*\nline2: \w+',
            cooked:'line1: (words )*\nline2: \w+'})


- - -

Specification: <http://wiki.ecmascript.org/doku.php?id=harmony:proposals>

Thanks [Brendan Eich](http://brendaneich.com/), Allen Wirfs-Brock, Douglas
Crockford, Mark Miller, Tom Van Cutsem, Alex Russell, and so many others.
