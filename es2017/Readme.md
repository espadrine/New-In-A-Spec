EcmaScript Seventh Edition
==========================

- [Object.values](https://github.com/es-shims/Object.values) / [Object.entries](https://github.com/es-shims/Object.entries)

```javascript
Object.values({ key: 'value' }) === ['value']
Object.entries({ key: 'value' }) === [['key', 'value']]
```

- [String.prototype.padStart](https://github.com/es-shims/String.prototype.padStart) / [String.prototype.padEnd](https://github.com/es-shims/String.prototype.padEnd)

```javascript
'hi'.padStart(5) === '   hi'
'123'.padStart(5, '0') === '00123'
'chapter 1'.padEnd(20, ' .') === 'chapter 1 . . . . . '
```

- [Object.getOwnPropertyDescriptors](https://github.com/tc39/proposal-object-getownpropertydescriptors): retrieve all possible own descriptors of an object, as per `Reflect.ownKeys(object)`, in an enumerable object. Eases the creation of clones.

```javascript
var obj = { key: 'value' }
var clone = Object.create(Object.getPrototypeOf(obj),
  Object.getOwnPropertyDescriptors(obj))
```

[Full standard](https://tc39.github.io/ecma262/)
