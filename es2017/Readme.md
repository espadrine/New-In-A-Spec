ECMAScript 2017
===============

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
let obj = { key: 'value' }
let clone = Object.create(Object.getPrototypeOf(obj),
  Object.getOwnPropertyDescriptors(obj))
```

- [Trailing commas in function parameter lists and calls](https://github.com/tc39/proposal-trailing-function-commas)

```javascript
function thisFunctionNameIsPurposefullyLongToForceParametersOnTheNextLine(
  param1,
  param2,  // ← Notice the comma at the end!
) {
  return param1 + param2
}
```

- [Async functions](https://github.com/tc39/ecmascript-asyncawait)

```javascript
// Returns a Promise.
async function concatenateFiles(filenames) {
  let result = ''
  filenames.forEach(filename => {
    // fileSystemRead() returns a Promise.
    result += await fileSystemRead(filename)
  })
  return result  // Resolving the promise.
}
```

- [Shared memory and atomics](https://github.com/tc39/ecmascript_sharedmem)

```javascript
// main.js
let worker = new Worker('greenify.js')
let sharedBuf = new SharedArrayBuffer(Int8Array.BYTES_PER_ELEMENT * 3 * 64 * 64)
let arrayBuf = new Int8Array(sharedBuf)
// Imagine a 64x64 image.
fillWithImage(arrayBuf)
worker.postMessage(sharedBuf)
worker.onmessage = function(event) {
  if (event.data.done) {
    showGreenerImage(sharedBuf)
  }
}

// greenify.js
let sharedBuf
onmessage = function(event) {
  sharedBuf = event.data
  greenify(sharedBuf)
  postMessage({done: true})
}

// Atomic operations:
Atomics.load(arrayBuf, index)
Atomics.store(arrayBuf, index, value)
Atomics.compareExchange(arrayBuf, index, oldValue, newValue)
Atomics.exchange(arrayBuf, index, newValue)  // return old value
Atomics.add(arrayBuf, index, value)
Atomics.sub(arrayBuf, index, value)
Atomics.and(arrayBuf, index, value)
Atomics.or(arrayBuf, index, value)
Atomics.xor(arrayBuf, index, value)
// If value matches content, sleep until woken up.
Atomics.wait(arrayBuf, index, value)
Atomics.wake(arrayBuf, index, numberOfWaitersToWakeUp)
// Optimization primitive
Atomics.isLockFree(size)
```

[Full standard](https://tc39.github.io/ecma262/)

[Submit an issue](https://github.com/espadrine/New-In-A-Spec/issues/new)
