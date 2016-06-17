EcmaScript Seventh Edition
==========================

- array and generator comprehension:
  `[for (a of A) for (b of B) a+b]` (array comprehension),
  `(for (x of generateValues()) if (x.color === 'blue') x)` (generator
  expression).

- binary data: `const Pixel = new StructType({x:uint32, y:uint32, color:Color})`
  (if `Color` is itself a `StructType`), `new ArrayType(Pixel, 3)`.


