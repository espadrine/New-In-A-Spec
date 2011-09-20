DOM4
====


DOM Events
----------

- Events have constructors.
- Event.type has no more restriction.
- `preventDefault()` only changes what `defaultPrevented` and
  `dispatchEvent()` return if the event is cancelable.
- No more EventException.
- Fire is no longer synonymous with dispatch, but includes initializing an
  event.
- The propagation and canceled flags are unset when invoking `initEvent()`
  rather than after dispatch.


DOM Core
--------

### Document

- readonly attribute DOMString URL;
- readonly attribute DOMString compatMode;
- readonly attribute DOMString characterSet;
- readonly attribute DOMString defaultCharset;
- attribute DOMString charset;
- readonly attribute DOMString contentType;
- NodeList getElementsByClassName(DOMString classNames);
- Event createEvent(DOMString eventInterfaceName);
- Range createRange();
- NodeIterator createNodeIterator(Node root, optional unsigned long
  whatToShow, optional NodeFilter? filter);
- TreeWalker createTreeWalker(Node root, optional unsigned long whatToShow,
  optional NodeFilter? filter);

### Node

- readonly attribute Element? parentElement;
- boolean contains(Node? other);

### Element

- readonly attribute DOMString? namespaceURI;
- readonly attribute DOMString? prefix;
- readonly attribute DOMString localName;
-          attribute DOMString id;
-          attribute DOMString className;
- readonly attribute DOMTokenList classList;
- readonly attribute Attr[] attributes;
- readonly attribute HTMLCollection children;
- readonly attribute Element? firstElementChild;
- readonly attribute Element? lastElementChild;
- readonly attribute Element? previousElementSibling;
- readonly attribute Element? nextElementSibling;
- readonly attribute unsigned long childElementCount;
- NodeList getElementsByClassName(DOMString classNames);

### Event

That section corresponds to
[DOM Level 2 Events](http://www.w3.org/TR/DOM-Level-2-Events/events.html).

The `Event` interface contains:

- void stopImmediatePropagation();
- readonly attribute boolean defaultPrevented;
- readonly attribute boolean isTrusted;

The derived interface `CustomEvent` contains

- readonly attribute any detail;

In the `EventTarget` interface, the `capture` parameter is now optional:

- void addEventListener(DOMString type, EventListener? listener, optional
  boolean capture);
- void removeEventListener(DOMString type, EventListener? listener, optional
  boolean capture);


### Range

That interface corresponds to that of [DOM Level 2 Range] [].
Most of it is a complete ripoff, which is good.

  [DOM Level 2 Range]: http://www.w3.org/TR/DOM-Level-2-Traversal-Range/ranges.html

- boolean isPointInRange(Node parent, unsigned long offset);
- short comparePoint(nodeparent, unsigned long offset);
- boolean intersectsNode(Node node);


### NodeIterator

That interface corresponds to that of [DOM Level 2 Range] [].

- readonly attribute Node? referenceNode;
- readonly attribute boolean pointerBeforeReferenceNode;


### General considerations

- `DOMString` and `DOMTimeStamp are now defined in WebIDL.
- `Node` inherits from `EventTarget`.
- Removal of: 
  * `CDATASection`
  * `DOMConfiguration`
  * `DOMError`
  * `DOMErrorHandler`
  * `DOMImplementationList`
  * `DOMImplementationSource`
  * `DOMLocator`
  * `DOMObject`
  * `DOMUserData`
  * `Entity`
  * `EntityReference`
  * `NamedNodeMap`
  * `NameList`
  * `Notation`
  * `TypeInfo`
  * `UserDataHandler`


- - -

Specification: <http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html>

Thanks Anne Van Kesteren, Aryeh Gregor, Ms2ger.
