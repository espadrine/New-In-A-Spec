XMLHttpRequest Level 2
======================


XMLHttpRequestEventTarget
-------------------------

Was reserved for future use. Now has:

- attribute Function onloadstart
- attribute Function onprogress
- attribute Function onabort
- attribute Function onerror
- attribute Function onload
- attribute Function ontimeout
- attribute Function onloadend

XMLHttpRequestUpload
--------------------

Inherits from `XMLHttpRequestEventTarget`.

XMLHttpRequest
--------------

(We don't talk here about the update to
[Web IDL](http://dev.w3.org/2006/webapi/WebIDL/). Ahem.)

- attribute unsigned long timeout
- attribute boolean withCredentials
- readonly attribute XMLHttpRequestUpload upload
- void send(ArrayBuffer *data*)
- void send(Blob *data*)
- void send(FormData *data*)
- void overrideMimeType(DOMString *mime*)
- attribute DOMString responseType
- readonly attribute any response

The `response` attribute is mostly the same as `responseText`, when the
`responseType` is the empty string or `"text"`. But it can also be an
`"arraybuffer"`, a `"blob"`, or a `"document"`.

As you can tell, this update mostly adds
[Typed Arrays](http://dev.w3.org/2006/webapi/XMLHttpRequest-2/#refsTYPEDARRAY).

FormData
--------

- void append(DOMString *name*, Blob *value*, optional DOMString *filename*)
- void append(DOMString *name*, DOMString *value*)

----

Specification: <http://dev.w3.org/2006/webapi/XMLHttpRequest-2/>

Thanks Anne Van Kesteren.

