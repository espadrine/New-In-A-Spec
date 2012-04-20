EcmaScript Fifth Edition
========================


# Object methods

- `Object.getOwnPropertyDescriptor(obj, prop)`:
  a property has either a `value` and three boolean attributes `writable`,
  `enumerable` and `configurable`, or a `get`-ter and a `set`-ter.

      {
        value: "foo",
        writable: true,     // You can modify the value.
        enumerable: true,   // Will appear in a "for (var i in obj.prop)".
        configurable: true  // You can change "writable", "enumerable" and
                            // "configurable"
      }

- `Object.defineProperty(obj, prop, desc)`: set the property descriptor (as seen
  above).

      Object.defineProperty(obj, 'answer', {
        get: function() { return 42; },
        set: function() { throw Error('Truth is immutably 42'); }
      });

- `Object.defineProperties(obj, props)`: same as above.
  
      Object.defineProperties(obj, {
        'prop1': {value: 1337, writable: false},
        'prop2': {value: 666, enumerable: false}
      });

- `Object.keys(obj)`: array of strings of all enumerable properties.

- `Object.getOwnPropertyNames(obj)`: array of strings of all properties
  (including non-enumerable ones).

- `Object.create(proto, props)`: inherit a new object from the object `proto`.
    
      var mum = Object.create({}, {common: {value:5}, overriden: {value:7}});
      var baby = Object.create(mum, {overriden: {value:8}});

- `Object.getPrototypeOf(obj)`: self-descriptive.

- `Object.preventExtensions(obj)`: now you can't add properties to `obj`.

- `Object.isExtensible(obj)`

- `Object.seal(obj)`: now you can't delete or add any properties, and you can't
  change their descriptors (but you can change their values).

- `Object.isSealed(obj)`

- `Object.freeze(obj)`: now you can't delete, add, or change any property.

- `Object.isFrozen(obj)`


# Array awesomeness

- `arr.indexOf(searchElement [, fromIndex])`
- `arr.lastIndexOf(...)`
- `arr.every(callbackfn [, thisArg])`
- `arr.some(callbackfn [, thisArg])`
- `arr.forEach(callbackfn [, thisArg])`
- `arr.map(callbackfn [, thisArg])`
- `arr.filter(callbackfn [, thisArg])`
- `arr.reduce(callbackfn [, initialValue])`
- `arr.reduceRight(...)`


# Strict mode

How to use it?
Write the following instruction:

      "use strict";

What does it do?
  
- You need to use `var` to introduce new variables.
- You can't override the `eval` function.
- You can't introduce new variables in an `eval`.
- Functions lose their `arguments.caller` and `arguments.callee`.
- `with` statements become a syntax error.

# JSON

- `JSON.parse('{"some": "data"}')` → `{some: "data"}`
- `JSON.stringify({foo:undefined, bar:null})` → `'{"bar":null}'`

# Miscellaneous

- `"\t Foo! ".trim()` → `"Foo!"`
- `func.bind(thisArg)`: returns a function that runs `func`, with `this` bound
  as `thisArg`.


# Worth noting

- All this is implemented in all browsers (including IE from version 9 up).
- If you want to support older IE versions, there are
  [polyfills for that](http://github.com/kriskowal/es5-shim)!

Standard available [at
ECMA](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-262.pdf).

My dearest thanks go to [Brendan Eich](http://brendaneich.com/), Allen
Wirfs-Brock, Douglas Crockford, Mark Miller, Tom Van Cutsem, Alex Russell, and
so many others.

